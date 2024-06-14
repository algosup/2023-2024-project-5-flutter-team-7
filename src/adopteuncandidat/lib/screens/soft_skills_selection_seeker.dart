import 'package:adopteuncandidat/layout/common_layout.dart';
import 'package:adopteuncandidat/models/layout_model.dart';
import 'package:adopteuncandidat/providers/provider_soft_skills_seeker.dart';
import 'package:adopteuncandidat/widgets/soft_skills_selector.dart';
import 'package:adopteuncandidat/widgets/soft_skills_selector_arrow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
      model: LayoutModel(
        widget.isEditMode ? LayoutType.editProfile : LayoutType.createProfile,
        UserType.jobSeeker,
      ),
      body: _buildContent(notifier),
    );
  }

  Widget _buildContent(SoftSkillsNotifier notifier) {
    final header = widget.isEditMode
        ? 'Changer tes soft skills.'
        : 'Sélectionner les soft skills que vous possédez.';
    final count =
        'SoftSkills: ${notifier.getSelectedCount()}/${SoftSkillsNotifier.maxSoftSkills}';
    toggler(int index) {
      setState(() {
        notifier.toggle(index);
      });
    }

    return Container(
      color: Colors.red,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text(
              '$header $count',
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
                    color: Colors.red,
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
                            if (widget.isEditMode) {
                              context.go('/jobSeekerProfile');
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
    );
  }
}
