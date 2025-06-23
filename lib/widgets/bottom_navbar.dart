import 'package:flutter/material.dart';

class BottomNavbar extends StatelessWidget {
  final List<IconData> mainNavIcons;
  final int currentIndex;
  final ValueChanged<int> onPageChanged;
  const BottomNavbar({
    super.key,
    required this.mainNavIcons,
    required this.currentIndex,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onPageChanged,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: Theme.of(context).colorScheme.surface,
      selectedItemColor: Theme.of(context).colorScheme.primary,
      unselectedItemColor: Theme.of(
        context,
      ).colorScheme.onSurface.withValues(alpha: 0.4),
      elevation: 8,
      type: BottomNavigationBarType.fixed,
      items: mainNavIcons.map((icon) {
        return BottomNavigationBarItem(icon: Icon(icon), label: "");
      }).toList(),
    );
  }
}
