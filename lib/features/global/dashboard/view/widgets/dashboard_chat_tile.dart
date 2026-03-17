import 'package:flutter/material.dart';

import '../../../../../utils/constants/app_colors.dart';
import '../dashboard_data.dart';
import '../dashboard_styles.dart';

class DashboardChatTile extends StatelessWidget {
  const DashboardChatTile({super.key, required this.item});

  final DashboardChatItem item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        color: AppColors.black,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: item.avatarColor,
                  child: Text(
                    item.avatarLabel,
                    style: DashboardStyles.font(
                      color: AppColors.greenishTeal,
                      weight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: DashboardStyles.font(
                          color: AppColors.greenishTeal,
                          size: 16,
                          weight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          if (item.showReadReceipt) ...[
                            const Icon(
                              Icons.done_all,
                              size: 16,
                              color: AppColors.cyanDark
                            ),
                            const SizedBox(width: 6),
                          ],
                          Expanded(
                            child: Text(
                              item.message,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: DashboardStyles.font(
                                color: AppColors.darkTextColor,
                                size: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      item.time,
                      style: DashboardStyles.font(
                        color: AppColors.darkTextColor,
                        size: 12,
                        weight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (item.pinned) ...[
                          const Icon(
                            Icons.push_pin,
                            size: 14,
                            color: AppColors.darkTextColor,
                          ),
                          const SizedBox(width: 6),
                        ],
                        if (item.unread > 0) _UnreadBadge(count: item.unread),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Divider(height: 1, color: AppColors.black),
          ],
        ),
      ),
    );
  }
}

class _UnreadBadge extends StatelessWidget {
  const _UnreadBadge({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: DashboardStyles.accent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        count.toString(),
        style: DashboardStyles.font(
          color: Colors.black,
          size: 11,
          weight: FontWeight.w700,
        ),
      ),
    );
  }
}
