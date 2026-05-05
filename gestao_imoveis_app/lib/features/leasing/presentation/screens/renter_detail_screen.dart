import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestao_imoveis/core/errors/failure.dart';
import 'package:gestao_imoveis/core/router/route_names.dart';
import 'package:gestao_imoveis/features/leasing/domain/entities/renter.dart';
import 'package:gestao_imoveis/features/leasing/domain/value_objects/contract_status.dart';
import 'package:gestao_imoveis/features/leasing/presentation/providers/leasing_providers.dart';
import 'package:gestao_imoveis/shared/widgets/contract_card.dart';
import 'package:gestao_imoveis/shared/widgets/empty_state.dart';
import 'package:gestao_imoveis/shared/widgets/error_view.dart';
import 'package:gestao_imoveis/shared/widgets/section_header.dart';
import 'package:gestao_imoveis/shared/widgets/skeleton_list.dart';
import 'package:gestao_imoveis/shared/widgets/status_badge.dart';
import 'package:go_router/go_router.dart';

class RenterDetailScreen extends ConsumerWidget {
  const RenterDetailScreen({super.key, required this.renterId});

  final int renterId;

  StatusBadgeType _badgeType(ContractStatus status) => switch (status) {
        ContractStatus.active => StatusBadgeType.active,
        ContractStatus.expired => StatusBadgeType.expired,
        ContractStatus.terminated => StatusBadgeType.terminated,
      };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final renterAsync = ref.watch(renterDetailProvider(renterId));
    final contractsAsync = ref.watch(contractListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Inquilino')),
      body: renterAsync.when(
        loading: () => const SkeletonList(itemHeight: 80),
        error: (error, _) => ErrorView(
          failure: error is Failure
              ? error
              : Failure.unknown(message: error.toString()),
          onRetry: () => ref.invalidate(renterDetailProvider(renterId)),
        ),
        data: (renter) => ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _RenterInfoCard(renter: renter),
            const SizedBox(height: 24),
            const SectionHeader(title: 'Contratos'),
            const SizedBox(height: 8),
            contractsAsync.when(
              loading: () => const SkeletonList(itemCount: 2, itemHeight: 120),
              error: (_, __) => const SizedBox.shrink(),
              data: (contracts) {
                final mine = contracts
                    .where((c) => c.renter.id == renterId)
                    .toList();
                if (mine.isEmpty) {
                  return const EmptyState(
                    icon: Icons.description_outlined,
                    title: 'Nenhum contrato',
                    subtitle: 'Este inquilino não possui contratos.',
                  );
                }
                return Column(
                  children: mine
                      .map((c) => ContractCard(
                            renterName: c.renter.name,
                            propertyAddress: c.fullAddress,
                            rentValue: c.rentalValue,
                            startDate: c.startContract,
                            endDate: c.endContract,
                            status: _badgeType(c.status),
                            readjustmentPending: c.readjustmentPending,
                            onTap: () => context.pushNamed(
                              RouteNames.contractDetail,
                              pathParameters: {'id': '${c.id}'},
                            ),
                          ))
                      .toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _RenterInfoCard extends StatelessWidget {
  const _RenterInfoCard({required this.renter});

  final Renter renter;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 36,
              backgroundColor: theme.colorScheme.primaryContainer,
              child: Text(
                renter.name.isNotEmpty ? renter.name[0].toUpperCase() : '?',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: theme.colorScheme.onPrimaryContainer,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              renter.name,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            _InfoRow(icon: Icons.badge_outlined, label: 'CPF', value: renter.formattedCpf),
            const Divider(height: 24),
            _InfoRow(
              icon: Icons.phone_outlined,
              label: 'Telefone',
              value: renter.formattedPhone,
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Icon(icon, size: 18, color: theme.colorScheme.onSurfaceVariant),
        const SizedBox(width: 8),
        Text(
          '$label: ',
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        Text(value, style: const TextStyle(fontWeight: FontWeight.w600)),
      ],
    );
  }
}
