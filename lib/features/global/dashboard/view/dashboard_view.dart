import 'package:demo/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

import 'dashboard_data.dart';
import 'widgets/dashboard_bottom_nav.dart';
import 'widgets/dashboard_chat_tile.dart';
import 'widgets/dashboard_filter_row.dart';
import 'widgets/dashboard_search_bar.dart';
import 'widgets/dashboard_top_bar.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: const DashboardTopBar(),
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const DashboardSearchBar(),
                    const SizedBox(height: 12),
                    DashboardFilterRow(filters: dashboardFilters),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final item = dashboardChats[index];
                return DashboardChatTile(item: item);
              }, childCount: dashboardChats.length),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 24),),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.cyanDark,
        child: const Icon(Icons.add, color:AppColors.black),
      ),
      bottomNavigationBar: const SafeArea(
        top: false,
        child: DashboardBottomNav(),
      ),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DashboardView();
  }
}
