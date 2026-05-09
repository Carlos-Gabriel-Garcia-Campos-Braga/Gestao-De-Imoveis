import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestao_imoveis/core/constants/api_constants.dart';
import 'package:gestao_imoveis/core/errors/failure.dart';
import 'package:gestao_imoveis/core/extensions/date_extension.dart';
import 'package:gestao_imoveis/core/extensions/double_extension.dart';
import 'package:gestao_imoveis/core/network/dio_provider.dart';
import 'package:gestao_imoveis/core/theme/app_colors.dart';
import 'package:gestao_imoveis/features/leasing/domain/entities/rental_contract.dart';
import 'package:gestao_imoveis/features/leasing/domain/value_objects/contract_status.dart';
import 'package:gestao_imoveis/features/leasing/domain/value_objects/economic_index.dart';
import 'package:gestao_imoveis/features/leasing/presentation/providers/leasing_providers.dart';
import 'package:gestao_imoveis/features/property/presentation/providers/property_providers.dart';
import 'package:gestao_imoveis/shared/widgets/error_view.dart';
import 'package:gestao_imoveis/shared/widgets/loading_overlay.dart';
import 'package:gestao_imoveis/shared/widgets/section_header.dart';
import 'package:gestao_imoveis/shared/widgets/status_badge.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

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
  bool _loadingTerminate = false;
  bool _loadingPdf = false;

  Future<void> _exportPdf() async {
    setState(() => _loadingPdf = true);
    final messenger = ScaffoldMessenger.of(context);
    try {
      final dio = ref.read(dioProvider);
      final response = await dio.get<List<int>>(
        ApiConstants.contractPdf(widget.contract.id),
        options: Options(responseType: ResponseType.bytes),
      );
      final dir = await getTemporaryDirectory();
      final file = File('${dir.path}/contrato-${widget.contract.id.toString().padLeft(6, '0')}.pdf');
      await file.writeAsBytes(response.data!);
      await Share.shareXFiles([XFile(file.path)], subject: 'Contrato nº ${widget.contract.id}');
    } catch (e) {
      messenger.showSnackBar(SnackBar(content: Text('Erro ao exportar PDF: $e')));
    } finally {
      if (mounted) setState(() => _loadingPdf = false);
    }
  }

  StatusBadgeType _badgeType(ContractStatus status) => switch (status) {
        ContractStatus.active => StatusBadgeType.active,
        ContractStatus.expired => StatusBadgeType.expired,
        ContractStatus.terminated => StatusBadgeType.terminated,
      };

  Future<void> _showTerminateDialog() async {
    String? selectedBy;
    final router = GoRouter.of(context);
    final messenger = ScaffoldMessenger.of(context);

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => StatefulBuilder(
        builder: (ctx, setS) => AlertDialog(
          title: const Text('Rescindir Contrato'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Atenção: esta ação não pode ser desfeita. O contrato será marcado como rescindido.',
              ),
              const SizedBox(height: 16),
              const Text('Rescisão solicitada por:'),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                hint: const Text('Selecione'),
                initialValue: selectedBy,
                items: const [
                  DropdownMenuItem(
                    value: 'Locatário',
                    child: Text('Locatário'),
                  ),
                  DropdownMenuItem(
                    value: 'Locador',
                    child: Text('Locador'),
                  ),
                ],
                onChanged: (v) => setS(() => selectedBy = v),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text('Cancelar'),
            ),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: Theme.of(ctx).colorScheme.error,
              ),
              onPressed: selectedBy == null
                  ? null
                  : () => Navigator.pop(ctx, true),
              child: const Text('Rescindir'),
            ),
          ],
        ),
      ),
    );

    if (confirmed != true || !mounted) return;

    setState(() => _loadingTerminate = true);
    try {
      await ref
          .read(contractListProvider.notifier)
          .terminate(widget.contract.id, selectedBy!);
      ref.invalidate(propertyListProvider);
      if (mounted) router.pop();
    } catch (e) {
      messenger.showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      if (mounted) setState(() => _loadingTerminate = false);
    }
  }

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
          _loadingPdf
              ? const Padding(
                  padding: EdgeInsets.all(14),
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                )
              : IconButton(
                  icon: const Icon(Icons.picture_as_pdf_outlined),
                  tooltip: 'Exportar PDF',
                  onPressed: _exportPdf,
                ),
          if (c.status == ContractStatus.active)
            IconButton(
              icon: const Icon(Icons.trending_up),
              tooltip: 'Aplicar reajuste',
              onPressed: _loadingReadjustment ? null : _showReadjustmentDialog,
            ),
          PopupMenuButton<String>(
            onSelected: (value) async {
              if (value == 'terminate') {
                if (!_loadingTerminate) await _showTerminateDialog();
                return;
              }
              if (value == 'archive') {
                final router = GoRouter.of(context);
                final messenger = ScaffoldMessenger.of(context);
                final confirmed = await showDialog<bool>(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text('Arquivar contrato'),
                    content: const Text(
                      'O contrato será movido para o arquivo e não aparecerá mais nas listas ativas. Deseja continuar?',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(ctx, false),
                        child: const Text('Cancelar'),
                      ),
                      FilledButton(
                        onPressed: () => Navigator.pop(ctx, true),
                        child: const Text('Arquivar'),
                      ),
                    ],
                  ),
                );
                if (confirmed ?? false) {
                  try {
                    await ref
                        .read(rentalContractRepositoryProvider)
                        .archive(c.id);
                    ref.invalidate(contractListProvider);
                    if (mounted) router.pop();
                  } catch (e) {
                    if (mounted) {
                      messenger.showSnackBar(
                        SnackBar(content: Text(e.toString())),
                      );
                    }
                  }
                }
              }
            },
            itemBuilder: (_) => [
              if (c.status == ContractStatus.active)
                const PopupMenuItem(
                  value: 'terminate',
                  child: ListTile(
                    leading: Icon(Icons.cancel_outlined, color: Colors.red),
                    title: Text('Rescindir contrato',
                        style: TextStyle(color: Colors.red)),
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              const PopupMenuItem(
                value: 'archive',
                child: ListTile(
                  leading: Icon(Icons.archive_outlined),
                  title: Text('Arquivar contrato'),
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ],
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

            if (c.terminatedAt != null) ...[
              const SizedBox(height: 16),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.errorContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(Icons.cancel_outlined,
                        size: 16,
                        color:
                            Theme.of(context).colorScheme.onErrorContainer),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Rescindido em ${c.terminatedAt!.toBrDate()} · por ${c.terminatedBy}',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color:
                              Theme.of(context).colorScheme.onErrorContainer,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],

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
