import 'package:flutter/material.dart';
import 'package:gestao_imoveis/core/extensions/date_extension.dart';
import 'package:gestao_imoveis/core/extensions/double_extension.dart';
import 'package:gestao_imoveis/core/theme/app_colors.dart';
import 'package:gestao_imoveis/shared/widgets/app_card.dart';
import 'package:gestao_imoveis/shared/widgets/status_badge.dart';

class InvoiceCard extends StatelessWidget {
  const InvoiceCard({
    super.key,
    required this.amount,
    required this.dueDate,
    required this.status,
    this.renterName,
    this.daysOverdue,
    this.onTap,
  });

  final double amount;
  final DateTime dueDate;
  final StatusBadgeType status;
  final String? renterName;
  final int? daysOverdue;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: _iconBgColor(status),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(_icon(status), color: _iconColor(status), size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  amount.toBRL(),
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Venc. ${dueDate.toBrDate()}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                ),
                if (renterName != null)
                  Text(
                    renterName!,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              StatusBadge(status),
              if (daysOverdue != null && daysOverdue! > 0) ...[
                const SizedBox(height: 4),
                Text(
                  '$daysOverdue dias',
                  style: const TextStyle(
                    fontSize: 11,
                    color: AppColors.danger,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  static IconData _icon(StatusBadgeType s) => switch (s) {
        StatusBadgeType.paid => Icons.check_circle,
        StatusBadgeType.overdue => Icons.warning,
        StatusBadgeType.cancelled => Icons.cancel,
        _ => Icons.receipt_long,
      };

  static Color _iconColor(StatusBadgeType s) => switch (s) {
        StatusBadgeType.paid => AppColors.success,
        StatusBadgeType.overdue => AppColors.danger,
        StatusBadgeType.cancelled => AppColors.neutral,
        _ => AppColors.warning,
      };

  static Color _iconBgColor(StatusBadgeType s) => _iconColor(s).withValues(alpha: 0.12);
}
