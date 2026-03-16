import 'package:demo/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

import '../dashboard_styles.dart';

class DashboardSearchBar extends StatelessWidget {
  const DashboardSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Ask Meta AI or Search',
        hintStyle: DashboardStyles.font(
          color:AppColors.searchBarBackground,
          size: 14,
          weight: FontWeight.w500,
        ),
        prefixIcon: const Icon(
          Icons.search,
          color: AppColors.searchBarBackground,
        ),
        filled: true,
        fillColor: DashboardStyles.surfaceAlt,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 12),
      ),
    );
  }
}
