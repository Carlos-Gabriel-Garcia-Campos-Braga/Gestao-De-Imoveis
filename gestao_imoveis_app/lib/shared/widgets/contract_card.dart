import 'package:flutter/material.dart';
import 'package:gestao_imoveis/core/extensions/date_extension.dart';
import 'package:gestao_imoveis/core/extensions/double_extension.dart';
import 'package:gestao_imoveis/core/theme/app_colors.dart';
import 'package:gestao_imoveis/shared/widgets/app_card.dart';
import 'package:gestao_imoveis/shared/widgets/status_badge.dart';

class ContractCard extends StatelessWidget {
  const ContractCard({
    super.key,
    required this.renterName,
    required this.propertyAddress,
    required this.rentValue,
    required this.startDate,
    required this.endDate,
    required this.status,
    this.readjustmentPending = false,
    this.onTap,
  });

  final String renterName;
  final String propertyAddress;
  final double rentValue;
  final DateTime startDate;
  final DateTime endDate;
  final StatusBadgeType status;
  final bool readjustmentPending;
  final VoidCallback? onTap;

  double get _progress {
    final total = endDate.difference(startDate).inDays;
    final elapsed = DateTime.now().difference(startDate).inDays;
    return (elapsed / total).clamp(0.0, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  renterName,
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 8),
              StatusBadge(status),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            propertyAddress,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                rentValue.toBRL(),
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  fontFamily: 'Poppins',
                ),
              ),
              if (readjustmentPending)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: AppColors.warning.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'Reajuste pendente',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: AppColors.warning,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: _progress,
              minHeight: 4,
              backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
              valueColor: AlwaysStoppedAnimation<Color>(
                status == StatusBadgeType.active ? AppColors.primary : AppColors.neutral,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                startDate.toBrDate(),
                style: Theme.of(context).textTheme.labelSmall,
              ),
              Text(
                endDate.toBrDate(),
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
