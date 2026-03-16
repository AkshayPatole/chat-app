import 'package:flutter/material.dart';

import '../../../../../utils/constants/app_colors.dart';
import '../dashboard_data.dart';
import '../dashboard_styles.dart';

class DashboardFilterRow extends StatelessWidget {
  const DashboardFilterRow({
    super.key,
    required this.filters,
  });

  final List<DashboardFilter> filters;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (final filter in filters) ...[
            _FilterChip(data: filter),
            const SizedBox(width: 8),
          ],
          const _PlusChip(),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({required this.data});

  final DashboardFilter data;

  @override
  Widget build(BuildContext context) {
    final bg =
        data.selected ? AppColors.successBubbleColor : AppColors.finacialTextColor;
    final textColor =
        data.selected ? AppColors.redColorDark : AppColors.darkTextColor;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Text(
            data.label,
            style: DashboardStyles.font(
              color: textColor,
              size: 13,
              weight: FontWeight.w600,
            ),
          ),
          if (data.count != null) ...[
            const SizedBox(width: 6),
            Text(
              data.count.toString(),
              style: DashboardStyles.font(
                color: textColor,
                size: 12,
                weight: FontWeight.w600,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _PlusChip extends StatelessWidget {
  const _PlusChip();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: DashboardStyles.surfaceAlt,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Icon(
        Icons.add,
        size: 16,
        color: DashboardStyles.textSecondary,
      ),
    );
  }
}
