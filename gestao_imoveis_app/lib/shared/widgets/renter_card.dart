import 'package:flutter/material.dart';
import 'package:gestao_imoveis/core/extensions/string_extension.dart';
import 'package:gestao_imoveis/core/theme/app_colors.dart';
import 'package:gestao_imoveis/shared/widgets/app_card.dart';

class RenterCard extends StatelessWidget {
  const RenterCard({
    super.key,
    required this.name,
    required this.cpf,
    this.hasActiveContract = false,
    this.isDefaulter = false,
    this.onTap,
  });

  final String name;
  final String cpf;
  final bool hasActiveContract;
  final bool isDefaulter;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: onTap,
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: isDefaulter
                ? AppColors.danger.withValues(alpha: 0.12)
                : Theme.of(context).colorScheme.primaryContainer,
            child: Text(
              name.isNotEmpty ? name[0].toUpperCase() : '?',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: isDefaulter
                    ? AppColors.danger
                    : Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  cpf.formatCpf(),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          if (isDefaulter)
            const _SmallBadge('Inadimplente', AppColors.danger)
          else if (hasActiveContract)
            const _SmallBadge('Contrato ativo', AppColors.success)
          else
            const _SmallBadge('Sem contrato', AppColors.neutral),
        ],
      ),
    );
  }
}

class _SmallBadge extends StatelessWidget {
  const _SmallBadge(this.label, this.color);

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: color),
      ),
    );
  }
}
