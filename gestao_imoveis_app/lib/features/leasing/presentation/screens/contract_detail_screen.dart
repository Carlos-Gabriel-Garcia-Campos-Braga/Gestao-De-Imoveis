import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestao_imoveis/core/errors/failure.dart';
import 'package:gestao_imoveis/core/extensions/date_extension.dart';
import 'package:gestao_imoveis/core/extensions/double_extension.dart';
import 'package:gestao_imoveis/core/theme/app_colors.dart';
import 'package:gestao_imoveis/features/leasing/domain/entities/rental_contract.dart';
import 'package:gestao_imoveis/features/leasing/domain/value_objects/contract_status.dart';
import 'package:gestao_imoveis/features/leasing/domain/value_objects/economic_index.dart';
import 'package:gestao_imoveis/features/leasing/presentation/providers/leasing_providers.dart';
import 'package:gestao_imoveis/shared/widgets/error_view.dart';
import 'package:gestao_imoveis/shared/widgets/loading_overlay.dart';
import 'package:gestao_imoveis/shared/widgets/section_header.dart';
import 'package:gestao_imoveis/shared/widgets/status_badge.dart';

class ContractDetailScreen extends ConsumerWidget {
  const ContractDetailScreen({super.key, required this.contractId});

  final int contractId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contractsAsync = ref.watch(contractListProvider);

    return contractsAsync.when(
      loading: () => const Scaffold(body: LoadingOverlay()),
      error: (error, _) => Scaffold(
        appBar: AppBar(),
        body: ErrorView(
          failure: error is Failure
              ? error
              : Failure.unknown(message: error.toString()),
          onRetry: () => ref.invalidate(contractListProvider),
        ),
      ),
      data: (contracts) {
        final contract = contracts.where((c) => c.id == contractId).firstOrNull;
        if (contract == null) {
          return Scaffold(
            appBar: AppBar(title: const Text('Contrato')),
            body: const Center(child: Text('Contrato não encontrado.')),
          );
        }
        return _ContractDetailView(contract: contract);
      },
    );
  }
}

class _ContractDetailView extends ConsumerStatefulWidget {
  const _ContractDetailView({required this.contract});

  final RentalContract contract;

  @override
  ConsumerState<_ContractDetailView> createState() =>
      _ContractDetailViewState();
}

class _ContractDetailViewState extends ConsumerState<_ContractDetailView> {
  bool _loadingReadjustment = false;

  StatusBadgeType _badgeType(ContractStatus status) => switch (status) {
        ContractStatus.active => StatusBadgeType.active,
        ContractStatus.expired => StatusBadgeType.expired,
        ContractStatus.terminated => StatusBadgeType.terminated,
      };

  Future<void> _showReadjustmentDialog() async {
    EconomicIndex selectedIndex = widget.contract.preferredIndex;
    final manualController = TextEditingController();

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => StatefulBuilder(
        builder: (ctx, setS) => AlertDialog(
          title: const Text('Aplicar Reajuste'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Índice de reajuste:'),
              const SizedBox(height: 8),
              DropdownButtonFormField<EconomicIndex>(
                initialValue: selectedIndex,
                items: EconomicIndex.values
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e.label),
                        ))
                    .toList(),
                onChanged: (v) => setS(() => selectedIndex = v!),
              ),
              const SizedBox(height: 12),
              const Text('Taxa manual (%) — obrigatório para IGPM:'),
              const SizedBox(height: 4),
              TextField(
                controller: manualController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  hintText: 'Ex: 4.87',
                  suffixText: '%',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text('Cancelar'),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: const Text('Aplicar'),
            ),
          ],
        ),
      ),
    );

    if (confirmed != true || !mounted) return;

    setState(() => _loadingReadjustment = true);
    final rate = double.tryParse(manualController.text.replaceAll(',', '.'));
    await ref.read(contractListProvider.notifier).applyReadjustment(
          widget.contract.id,
          index: selectedIndex,
          manualRate: rate,
        );
    if (mounted) setState(() => _loadingReadjustment = false);
  }

  @override
  Widget build(BuildContext context) {
    final c = widget.contract;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Contrato'),
        actions: [
          if (c.status == ContractStatus.active)
            IconButton(
              icon: const Icon(Icons.trending_up),
              tooltip: 'Aplicar reajuste',
              onPressed: _loadingReadjustment ? null : _showReadjustmentDialog,
            ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Status + valor
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        c.rentalValue.toBRL(),
                        style: theme.textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'por mês · índice ${c.preferredIndex.label}',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                StatusBadge(_badgeType(c.status)),
              ],
            ),

            if (c.readjustmentPending) ...[
              const SizedBox(height: 8),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.warning.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.info_outline,
                        size: 16, color: AppColors.warning),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Reajuste anual pendente',
                        style: TextStyle(
                            fontSize: 13,
                            color: AppColors.warning,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ],

            const SizedBox(height: 24),
            const SectionHeader(title: 'Período'),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                    child: _InfoTile('Início', c.startContract.toBrDate())),
                const SizedBox(width: 12),
                Expanded(
                    child: _InfoTile('Término', c.endContract.toBrDate())),
              ],
            ),

            const SizedBox(height: 24),
            const SectionHeader(title: 'Inquilino'),
            const SizedBox(height: 8),
            _InfoTile('Nome', c.renter.name),
            const SizedBox(height: 8),
            _InfoTile('CPF', c.renter.formattedCpf),
            const SizedBox(height: 8),
            _InfoTile('Telefone', c.renter.formattedPhone),

            const SizedBox(height: 24),
            const SectionHeader(title: 'Endereço'),
            const SizedBox(height: 8),
            _InfoTile('Logradouro', c.fullAddress),

            if (c.bills.isNotEmpty) ...[
              const SizedBox(height: 24),
              SectionHeader(title: 'Contas (${c.bills.length})'),
              const SizedBox(height: 8),
              ...c.bills.map(
                (b) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: _BillTile(
                    type: b.type,
                    date: b.validationDate.toBrDate(),
                    value: b.value,
                  ),
                ),
              ),
            ],

            if (c.readjustmentHistory.isNotEmpty) ...[
              const SizedBox(height: 24),
              SectionHeader(
                  title: 'Histórico de Reajustes (${c.readjustmentHistory.length})'),
              const SizedBox(height: 8),
              ...c.readjustmentHistory.map(
                (r) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: _ReadjustmentTile(
                    index: r.index.label,
                    rate: r.rate,
                    oldValue: r.oldValue,
                    newValue: r.newValue,
                    date: r.appliedAt.toBrDate(),
                  ),
                ),
              ),
            ],

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  const _InfoTile(this.label, this.value);

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}

class _BillTile extends StatelessWidget {
  const _BillTile({
    required this.type,
    required this.date,
    required this.value,
  });

  final String type;
  final String date;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(type, style: const TextStyle(fontWeight: FontWeight.w500)),
                Text(
                  date,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                ),
              ],
            ),
          ),
          Text(
            value.toBRL(),
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}

class _ReadjustmentTile extends StatelessWidget {
  const _ReadjustmentTile({
    required this.index,
    required this.rate,
    required this.oldValue,
    required this.newValue,
    required this.date,
  });

  final String index;
  final double rate;
  final double oldValue;
  final double newValue;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$index · ${rate.toStringAsFixed(2)}%',
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                Text(
                  '$date  ${oldValue.toBRL()} → ${newValue.toBRL()}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                ),
              ],
            ),
          ),
          const Icon(Icons.trending_up, size: 18, color: AppColors.success),
        ],
      ),
    );
  }
}
