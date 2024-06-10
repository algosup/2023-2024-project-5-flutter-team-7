import 'package:adopteuncandidat/layout/common_layout.dart';
import 'package:adopteuncandidat/providers/provider_soft_skills_seeker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
  ConsumerState<OfferCreationScreen> createState() =>
      _OfferCreationScreenState();

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(softSkillsProvider.notifier);
    return CommonLayout(
      body: Container(
        color: Colors.lightBlue,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                'Selectione les softs skills que vous rechercher. SoftSkills: ${notifier.getSelectedCount()}/${SoftSkillsNotifier.maxSoftSkills}',
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      color: Colors.grey[50],
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 10,
                          childAspectRatio: 3.2,
                        ),
                        itemCount: notifier.allSoftSkills.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(
                                () {
                                  notifier.toggle(index);
                                },
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 12,
                              ),
                              decoration: BoxDecoration(
                                color: notifier.isSelected(index)
                                    ? Colors.lightBlue
                                    : Colors.grey[200],
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    notifier.getNameOf(index),
                                    style: TextStyle(
                                      color: notifier.isSelected(index)
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: AnimatedOpacity(
                        opacity: _downArrowOpacity,
                        duration: const Duration(milliseconds: 500),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: AnimatedOpacity(
                        opacity: _upArrowOpacity,
                        duration: const Duration(milliseconds: 500),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
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
