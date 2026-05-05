import 'package:flutter/material.dart';
import 'package:gestao_imoveis/core/theme/app_colors.dart';

enum StatusBadgeType {
  // Property
  vacant,
  occupied,
  maintenance,
  // Invoice
  pending,
  paid,
  overdue,
  cancelled,
  // Contract
  active,
  expired,
  terminated,
}

class StatusBadge extends StatelessWidget {
  const StatusBadge(this.type, {super.key});

  final StatusBadgeType type;

  @override
  Widget build(BuildContext context) {
    final config = _config(type);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: config.$1.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(config.$2, size: 12, color: config.$1),
          const SizedBox(width: 4),
          Text(
            config.$3,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: config.$1,
            ),
          ),
        ],
      ),
    );
  }

  static (Color, IconData, String) _config(StatusBadgeType t) => switch (t) {
        StatusBadgeType.vacant => (AppColors.success, Icons.lock_open, 'Vago'),
        StatusBadgeType.occupied => (AppColors.primary, Icons.home, 'Ocupado'),
        StatusBadgeType.maintenance => (AppColors.warning, Icons.build, 'Manutenção'),
        StatusBadgeType.pending => (AppColors.warning, Icons.schedule, 'Pendente'),
        StatusBadgeType.paid => (AppColors.success, Icons.check_circle, 'Pago'),
        StatusBadgeType.overdue => (AppColors.danger, Icons.warning, 'Vencido'),
        StatusBadgeType.cancelled => (AppColors.neutral, Icons.cancel, 'Cancelado'),
        StatusBadgeType.active => (AppColors.success, Icons.check_circle, 'Ativo'),
        StatusBadgeType.expired => (AppColors.neutral, Icons.event_busy, 'Encerrado'),
        StatusBadgeType.terminated => (AppColors.danger, Icons.close, 'Rescindido'),
      };
}
