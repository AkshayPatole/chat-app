import 'package:flutter/material.dart';

import '../../../../utils/constants/app_colors.dart';

class DashboardFilter {
  const DashboardFilter({
    required this.label,
    this.count,
    this.selected = false,
  });

  final String label;
  final int? count;
  final bool selected;
}

class DashboardChatItem {
  const DashboardChatItem({
    required this.title,
    required this.message,
    required this.time,
    required this.unread,
    required this.pinned,
    required this.showReadReceipt,
    required this.avatarLabel,
    required this.avatarColor,
  });

  final String title;
  final String message;
  final String time;
  final int unread;
  final bool pinned;
  final bool showReadReceipt;
  final String avatarLabel;
  final Color avatarColor;
}

const dashboardFilters = <DashboardFilter>[
  DashboardFilter(label: 'All', selected: true),
  DashboardFilter(label: 'Unread', count: 20),
  DashboardFilter(label: 'Favorites'),
  DashboardFilter(label: 'Groups', count: 5),
];

const dashboardChats = <DashboardChatItem>[
  DashboardChatItem(
    title: 'YouTube Cont (Daily Update)',
    message: 'You reacted to "https://www.in..."',
    time: '8:50 AM',
    unread: 0,
    pinned: true,
    showReadReceipt: true,
    avatarLabel: 'YC',
    avatarColor: AppColors.cyanMedium,
  ),
  DashboardChatItem(
    title: 'BAAP CO EMP 2025',
    message: 'Prajakta: If leave not update on time...',
    time: '11:45 AM',
    unread: 0,
    pinned: true,
    showReadReceipt: false,
    avatarLabel: 'B',
    avatarColor: AppColors.cyanMedium,
  ),
  DashboardChatItem(
    title: 'Marathi Manus Group',
    message: 'You: https://youtu.be/short...',
    time: '3/11/26',
    unread: 0,
    pinned: false,
    showReadReceipt: true,
    avatarLabel: 'M',
    avatarColor: AppColors.cyanMedium,
  ),
  DashboardChatItem(
    title: 'Flutter Jaipur Community',
    message: '+91 85294 26152: Backend Develo...',
    time: '3:48 PM',
    unread: 0,
    pinned: false,
    showReadReceipt: false,
    avatarLabel: 'F',
    avatarColor: AppColors.cyanMedium,
  ),
  DashboardChatItem(
    title: 'Krushi Network Group',
    message: 'New price updates in the market...',
    time: '3:34 PM',
    unread: 3,
    pinned: false,
    showReadReceipt: false,
    avatarLabel: 'K',
    avatarColor: AppColors.cyanMedium,
  ),
  DashboardChatItem(
    title: 'Sai Agro Business',
    message: 'New stock list shared. Check now.',
    time: '2:10 PM',
    unread: 1,
    pinned: false,
    showReadReceipt: false,
    avatarLabel: 'S',
    avatarColor: Color(0xFF5A3D1E),
  ),
];
