import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class BottomNavbar extends StatelessWidget {
  final List<IconData> mainNavIcons;
  final List<IconData> actionNavIcons;
  final int currentIndex;
  final ValueChanged<int> onPageChanged;
  final ValueChanged<int>? onActionPressed;
  const BottomNavbar({
    super.key,
    required this.mainNavIcons,
    required this.actionNavIcons,
    required this.currentIndex,
    required this.onPageChanged,
    this.onActionPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 0, 10, 30),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    mainNavIcons.length,
                    (index) => ShadIconButton(
                      icon: Icon(
                        mainNavIcons[index],
                        color: currentIndex == index
                            ? Colors.black
                            : Colors.grey,
                      ),
                      onPressed: () => onPageChanged(index),
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (actionNavIcons.isNotEmpty &&
              currentIndex < actionNavIcons.length) ...[
            const SizedBox(width: 10),
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: ShadIconButton(
                  icon: Icon(actionNavIcons[currentIndex], color: Colors.black),
                  onPressed: onActionPressed != null
                      ? () => onActionPressed!(currentIndex)
                      : null,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
