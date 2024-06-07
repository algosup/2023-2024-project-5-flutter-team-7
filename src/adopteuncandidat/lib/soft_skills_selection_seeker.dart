import 'package:adopteuncandidat/layout/common_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'providers/provider_soft_skills_seeker.dart';

class SoftSkillsSelectionScreen extends ConsumerStatefulWidget {
  final bool isEditMode;

  const SoftSkillsSelectionScreen({super.key, required this.isEditMode});

  @override
  ConsumerState<SoftSkillsSelectionScreen> createState() =>
      _SoftSkillsSelectionScreenState();
}

class _SoftSkillsSelectionScreenState
    extends ConsumerState<SoftSkillsSelectionScreen> {
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
    return CommonLayout(
      body: Container(
        color: Colors.red,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text(
                widget.isEditMode
                    ? 'Changer tes soft skills. SoftSkills: ${notifier.getSelectedCount()}/${SoftSkillsNotifier.maxSoftSkills}'
                    : 'Sélectionner les soft skills que vous possédez. SoftSkills: ${notifier.getSelectedCount()}/${SoftSkillsNotifier.maxSoftSkills}',
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(height: 10),
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
                                    ? Colors.red
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
                              if (widget.isEditMode) {
                                context.go('/matchmaking');
                              } else {
                                context.go('/hobbies');
                              }
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      child: Text(
                        widget.isEditMode ? 'Confirmer' : 'Suivant',
                        style: const TextStyle(color: Colors.white),
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
