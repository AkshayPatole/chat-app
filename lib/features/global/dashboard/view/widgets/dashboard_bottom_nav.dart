import 'package:demo/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

import '../dashboard_styles.dart';

class DashboardBottomNav extends StatelessWidget {
  const DashboardBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      onTap: (_) {},
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.black,
      selectedItemColor: AppColors.cyanDark,
      unselectedItemColor: AppColors.unselectedItemColor,
      selectedLabelStyle: DashboardStyles.font(
        size: 12,
        weight: FontWeight.w600,
      ),
      unselectedLabelStyle: DashboardStyles.font(
        size: 12,
        weight: FontWeight.w600,
      ),
      items: const [
        BottomNavigationBarItem(
          icon: _NavIconWithBadge(
            icon: Icons.chat_bubble_outline,
            badgeCount: 20,
          ),
          activeIcon: _NavIconWithBadge(
            icon: Icons.chat_bubble,
            badgeCount: 20,
            isActive: true,
          ),
          label: 'Chats',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.update_outlined),
          activeIcon: Icon(Icons.update),
          label: 'Updates',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.group_outlined),
          activeIcon: Icon(Icons.group),
          label: 'Communities',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.call_outlined),
          activeIcon: Icon(Icons.call),
          label: 'Calls',
        ),
      ],
    );
  }
}

class _NavIconWithBadge extends StatelessWidget {
  const _NavIconWithBadge({
    required this.icon,
    required this.badgeCount,
    this.isActive = false,
  });

  final IconData icon;
  final int badgeCount;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Icon(icon, color: isActive ? AppColors.cyanDark : null),
        Positioned(
          right: -6,
          top: -6,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
            decoration: BoxDecoration(
              color: AppColors.cyanDark,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              badgeCount.toString(),
              style: DashboardStyles.font(
                color: AppColors.black,
                size: 9,
                weight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
