import 'package:adopteuncandidat/layout/common_layout.dart';
import 'package:adopteuncandidat/providers/provider_soft_skills_seeker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'providers/provider_offer.dart';

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
              _buildTextInput('Type de l\'emploi', _typeController),
              const SizedBox(height: 20),
              _buildTextInput('Lieu de l\'emploi', _locationController),
              const SizedBox(height: 20),
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      color: Colors.lightBlue[50],
                      child: GridView.builder(
                        controller: _scrollController,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 8.0,
                          crossAxisSpacing: 10.0,
                          childAspectRatio: 3.2,
                        ),
                        itemCount: notifier.allSoftSkills.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                notifier.toggle(index);
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12.0, horizontal: 12.0),
                              decoration: BoxDecoration(
                                color: notifier.isSelected(index)
                                    ? Colors.lightBlue
                                    : Colors.grey[200],
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10.0),
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
                            Icons.keyboard_arrow_up_rounded,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
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
