import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestao_imoveis/core/errors/failure.dart';
import 'package:gestao_imoveis/core/router/route_names.dart';
import 'package:gestao_imoveis/features/billing/domain/entities/invoice.dart';
import 'package:gestao_imoveis/features/billing/domain/value_objects/invoice_status.dart';
import 'package:gestao_imoveis/features/billing/presentation/providers/billing_providers.dart';
import 'package:gestao_imoveis/shared/widgets/empty_state.dart';
import 'package:gestao_imoveis/shared/widgets/error_view.dart';
import 'package:gestao_imoveis/shared/widgets/invoice_card.dart';
import 'package:gestao_imoveis/shared/widgets/skeleton_list.dart';
import 'package:gestao_imoveis/shared/widgets/status_badge.dart';
import 'package:go_router/go_router.dart';

class InvoiceListScreen extends ConsumerStatefulWidget {
  const InvoiceListScreen({super.key});

  @override
  ConsumerState<InvoiceListScreen> createState() => _InvoiceListScreenState();
}

class _InvoiceListScreenState extends ConsumerState<InvoiceListScreen> {
  InvoiceStatus? _filter;

  @override
  Widget build(BuildContext context) {
    final invoicesAsync = ref.watch(invoiceListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Cobranças')),
      body: Column(
        children: [
          _FilterChips(
            current: _filter,
            onChanged: (v) => setState(() => _filter = v),
          ),
          Expanded(
            child: invoicesAsync.when(
              loading: () =>
                  const SkeletonList(itemHeight: 88),
              error: (error, _) => ErrorView(
                failure: error is Failure
                    ? error
                    : Failure.unknown(message: error.toString()),
                onRetry: () => ref.invalidate(invoiceListProvider),
              ),
              data: (invoices) {
                final filtered = _filter == null
                    ? invoices
                    : invoices
                        .where((i) => i.status == _filter)
                        .toList();

                if (filtered.isEmpty) {
                  return EmptyState(
                    icon: Icons.receipt_long_outlined,
                    title: 'Nenhuma cobrança',
                    subtitle: _filter == null
                        ? 'Crie a primeira cobrança.'
                        : 'Nenhuma cobrança "${_filter!.label}".',
                    actionLabel: _filter == null ? 'Nova cobrança' : null,
                    onAction: _filter == null
                        ? () => context.pushNamed(RouteNames.newInvoice)
                        : null,
                  );
                }

                return RefreshIndicator(
                  onRefresh: () =>
                      ref.read(invoiceListProvider.notifier).refresh(),
                  child: ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: filtered.length,
                    separatorBuilder: (_, __) =>
                        const SizedBox(height: 10),
                    itemBuilder: (_, i) =>
                        _buildCard(context, filtered[i]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pushNamed(RouteNames.newInvoice),
        child: const Icon(Icons.add),
      ),
    );
  }

  StatusBadgeType _badgeType(InvoiceStatus s) => switch (s) {
        InvoiceStatus.pending => StatusBadgeType.pending,
        InvoiceStatus.overdue => StatusBadgeType.overdue,
        InvoiceStatus.paid => StatusBadgeType.paid,
        InvoiceStatus.cancelled => StatusBadgeType.cancelled,
      };

  Widget _buildCard(BuildContext context, Invoice invoice) {
    return InvoiceCard(
      amount: invoice.totalDue,
      dueDate: invoice.dueDate,
      status: _badgeType(invoice.status),
      daysOverdue: invoice.daysOverdue > 0 ? invoice.daysOverdue : null,
      onTap: () => context.pushNamed(
        RouteNames.invoiceDetail,
        pathParameters: {'id': '${invoice.id}'},
      ),
    );
  }
}

class _FilterChips extends StatelessWidget {
  const _FilterChips({required this.current, required this.onChanged});

  final InvoiceStatus? current;
  final ValueChanged<InvoiceStatus?> onChanged;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          _chip(context, label: 'Todos', value: null),
          const SizedBox(width: 8),
          ...InvoiceStatus.values.map(
            (s) => Padding(
              padding: const EdgeInsets.only(right: 8),
              child: _chip(context, label: s.label, value: s),
            ),
          ),
        ],
      ),
    );
  }

  Widget _chip(
    BuildContext context, {
    required String label,
    required InvoiceStatus? value,
  }) {
    return FilterChip(
      label: Text(label),
      selected: current == value,
      onSelected: (_) => onChanged(value),
    );
  }
}
