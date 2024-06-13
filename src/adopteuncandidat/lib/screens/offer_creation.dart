import 'package:adopteuncandidat/layout/common_layout.dart';
import 'package:adopteuncandidat/providers/provider_soft_skills_seeker.dart';
import 'package:adopteuncandidat/widgets/soft_skills_selector.dart';
import 'package:adopteuncandidat/widgets/soft_skills_selector_arrow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class OfferCreationScreen extends ConsumerStatefulWidget {
  const OfferCreationScreen({super.key});

  @override
  ConsumerState<OfferCreationScreen> createState() =>
      _OfferCreationScreenState();
}

class _OfferCreationScreenState extends ConsumerState<OfferCreationScreen> {
  late ScrollController _scrollController;
  double _downArrowOpacity = 1.0;
  double _upArrowOpacity = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {
        _downArrowOpacity = _scrollController.position.pixels <
                _scrollController.position.maxScrollExtent
            ? 1.0
            : 0.0;
        _upArrowOpacity = _scrollController.position.pixels > 0 ? 1.0 : 0.0;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(softSkillsProvider.notifier);
    final counter =
        'SoftSkills: ${notifier.getSelectedCount()}/${SoftSkillsNotifier.maxSoftSkills}';
    toggler(int index) {
      setState(() {
        notifier.toggle(index);
      });
    }

    return CommonLayout(
      body: Container(
        color: Colors.lightBlue,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                'Selectione les softs skills que vous rechercher. $counter',
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Stack(
                  children: [
                    SoftSkillsSelector(
                      scrollController: _scrollController,
                      notifier: notifier,
                      toggler: toggler,
                      color: Colors.lightBlue,
                    ),
                    SoftSkillsSelectorArrow(
                      icon: Icons.keyboard_arrow_down_rounded,
                      alignment: Alignment.bottomCenter,
                      opacity: _downArrowOpacity,
                    ),
                    SoftSkillsSelectorArrow(
                      icon: Icons.keyboard_arrow_up_rounded,
                      alignment: Alignment.topCenter,
                      opacity: _upArrowOpacity,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: notifier.getSelectedCount() > 0
                          ? () {
                              context.go('/recruiterProfile');
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      child: const Text(
                        'Confirmer',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
