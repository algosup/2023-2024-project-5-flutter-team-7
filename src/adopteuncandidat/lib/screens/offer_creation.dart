import 'package:adopteuncandidat/layout/common_layout.dart';
import 'package:adopteuncandidat/models/layout_model.dart';
import 'package:adopteuncandidat/providers/provider_offer.dart';
import 'package:adopteuncandidat/providers/provider_soft_skills_seeker.dart';
import 'package:adopteuncandidat/widgets/soft_skills_selector.dart';
import 'package:adopteuncandidat/widgets/soft_skills_selector_arrow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class OfferCreationScreen extends ConsumerStatefulWidget {
  final Offer? offer;

  const OfferCreationScreen({super.key, this.offer});

  @override
  ConsumerState<OfferCreationScreen> createState() =>
      _OfferCreationScreenState();
}

class _OfferCreationScreenState extends ConsumerState<OfferCreationScreen> {
  late ScrollController _scrollController;
  double _downArrowOpacity = 1.0;
  double _upArrowOpacity = 0.0;
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

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

    if (widget.offer != null) {
      _typeController.text = widget.offer!.type;
      _locationController.text = widget.offer!.location;
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _typeController.dispose();
    _locationController.dispose();
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
      type: LayoutType.editProfile,
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
              _buildTextInput('Type de l\'emploi', _typeController),
              const SizedBox(height: 20),
              _buildTextInput('Lieu de l\'emploi', _locationController),
              const SizedBox(height: 20),
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
                                if (widget.offer == null) {
                                  ref.read(offerProvider.notifier).addOffer(
                                        _typeController.text,
                                        _locationController.text,
                                      );
                                } else {
                                  ref.read(offerProvider.notifier).updateOffer(
                                        widget.offer!,
                                        _typeController.text,
                                        _locationController.text,
                                      );
                                }
                                context.go('/recruiterProfile');
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                        ),
                        child: const Text(
                          'Suivant',
                          style: TextStyle(color: Colors.white),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextInput(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: TextField(
            controller: controller,
            onChanged: (_) => setState(() {}),
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Placeholder',
            ),
          ),
        ),
      ],
    );
  }
}
