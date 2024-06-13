import 'package:adopteuncandidat/providers/provider_soft_skills_seeker.dart';
import 'package:flutter/material.dart';

class SoftSkillsSelector extends StatelessWidget {
  final ScrollController scrollController;
  final SoftSkillsNotifier notifier;
  final void Function(int index) toggler;
  final Color color;

  const SoftSkillsSelector({
    super.key,
    required this.scrollController,
    required this.notifier,
    required this.toggler,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlue[50],
      child: GridView.builder(
        controller: scrollController,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 10.0,
          childAspectRatio: 3.2,
        ),
        itemCount: notifier.allSoftSkills.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => toggler(index),
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
              decoration: BoxDecoration(
                color: notifier.isSelected(index) ? color : Colors.grey[200],
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
    );
  }
}
