import 'package:flutter/material.dart';

import '../../../../../utils/constants/app_colors.dart';

class DashboardTopBar extends StatelessWidget implements PreferredSizeWidget {
  const DashboardTopBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.black,
      elevation: 0,
      titleSpacing: 20,
      title: Text(
        'WhatsApp',
      
      ),
      actions: const [
        _TopIconButton(icon: Icons.camera_alt_outlined),
        _TopIconButton(icon: Icons.search),
        _TopIconButton(icon: Icons.more_vert),
        Padding(
          padding: EdgeInsets.only(right: 16),
          child: CircleAvatar(
            radius: 16,
            backgroundColor: AppColors.greenishTeal,
            child: Text(
              'A',
              style: TextStyle(
                color: AppColors.darkBlueColor,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _TopIconButton extends StatelessWidget {
  const _TopIconButton({required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Icon(icon, color: AppColors.approvedBgColor),
      tooltip: '',
    );
  }
}
