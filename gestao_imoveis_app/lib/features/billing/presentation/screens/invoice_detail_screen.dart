import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestao_imoveis/core/errors/failure.dart';
import 'package:gestao_imoveis/core/extensions/date_extension.dart';
import 'package:gestao_imoveis/core/extensions/double_extension.dart';
import 'package:gestao_imoveis/core/theme/app_colors.dart';
import 'package:gestao_imoveis/features/billing/domain/entities/invoice.dart';
import 'package:gestao_imoveis/features/billing/domain/value_objects/invoice_status.dart';
import 'package:gestao_imoveis/features/billing/presentation/providers/billing_providers.dart';
import 'package:gestao_imoveis/shared/widgets/app_button.dart';
import 'package:gestao_imoveis/shared/widgets/error_view.dart';
import 'package:gestao_imoveis/shared/widgets/loading_overlay.dart';
import 'package:gestao_imoveis/shared/widgets/money_text_field.dart';
import 'package:gestao_imoveis/shared/widgets/section_header.dart';
import 'package:gestao_imoveis/shared/widgets/status_badge.dart';

class InvoiceDetailScreen extends ConsumerWidget {
  const InvoiceDetailScreen({super.key, required this.invoiceId});

  final int invoiceId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final invoiceAsync = ref.watch(invoiceDetailProvider(invoiceId));

    return invoiceAsync.when(
      loading: () => const Scaffold(body: LoadingOverlay()),
      error: (error, _) => Scaffold(
        appBar: AppBar(),
        body: ErrorView(
          failure: error is Failure
              ? error
              : Failure.unknown(message: error.toString()),
          onRetry: () => ref.invalidate(invoiceDetailProvider(invoiceId)),
        ),
      ),
      data: (invoice) => _InvoiceDetailView(invoice: invoice),
    );
  }
}

class _InvoiceDetailView extends ConsumerStatefulWidget {
  const _InvoiceDetailView({required this.invoice});

  final Invoice invoice;

  @override
  ConsumerState<_InvoiceDetailView> createState() =>
      _InvoiceDetailViewState();
}

class _InvoiceDetailViewState extends ConsumerState<_InvoiceDetailView> {
  bool _loadingPix = false;
  bool _loadingPayment = false;

  StatusBadgeType _badgeType(InvoiceStatus s) => switch (s) {
        InvoiceStatus.pending => StatusBadgeType.pending,
        InvoiceStatus.overdue => StatusBadgeType.overdue,
        InvoiceStatus.paid => StatusBadgeType.paid,
        InvoiceStatus.cancelled => StatusBadgeType.cancelled,
      };

  Future<void> _generatePix() async {
    setState(() => _loadingPix = true);
    await ref.read(invoiceListProvider.notifier).generatePix(widget.invoice.id);
    if (mounted) {
      setState(() => _loadingPix = false);
      ref.invalidate(invoiceDetailProvider(widget.invoice.id));
    }
  }

  Future<void> _showPaymentDialog() async {
    double? amount;
    String method = 'PIX';

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => StatefulBuilder(
        builder: (ctx, setS) => AlertDialog(
          title: const Text('Registrar Pagamento'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MoneyTextField(
                label: 'Valor pago',
                initialValue: widget.invoice.totalDue,
                onChanged: (v) => amount = v,
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                initialValue: method,
                decoration:
                    const InputDecoration(labelText: 'Meio de pagamento'),
                items: ['PIX', 'Transferência', 'Dinheiro', 'Cartão']
                    .map((m) => DropdownMenuItem(value: m, child: Text(m)))
                    .toList(),
                onChanged: (v) => setS(() => method = v!),
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
              child: const Text('Confirmar'),
            ),
          ],
        ),
      ),
    );

    if (confirmed != true || !mounted) return;

    setState(() => _loadingPayment = true);
    await ref.read(invoiceListProvider.notifier).registerPayment(
          widget.invoice.id,
          amountPaid: amount ?? widget.invoice.totalDue,
          paymentMethod: method,
        );
    if (mounted) {
      setState(() => _loadingPayment = false);
      ref.invalidate(invoiceDetailProvider(widget.invoice.id));
    }
  }

  @override
  Widget build(BuildContext context) {
    final inv = widget.invoice;
    final theme = Theme.of(context);
    final canPay = inv.status == InvoiceStatus.pending ||
        inv.status == InvoiceStatus.overdue;

    return Scaffold(
      appBar: AppBar(title: const Text('Detalhes da Cobrança')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Amount + status
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        inv.totalDue.toBRL(),
                        style: theme.textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      if (inv.lateFee != null) ...[
                        const SizedBox(height: 2),
                        Text(
                          'Original: ${inv.amount.toBRL()}',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                StatusBadge(_badgeType(inv.status)),
              ],
            ),

            const SizedBox(height: 8),
            Text(
              inv.description,
              style: theme.textTheme.bodyMedium,
            ),

            const SizedBox(height: 4),
            Text(
              'Venc. ${inv.dueDate.toBrDate()}',
              style: theme.textTheme.bodySmall?.copyWith(
                color: inv.status == InvoiceStatus.overdue
                    ? AppColors.danger
                    : theme.colorScheme.onSurfaceVariant,
              ),
            ),

            if (inv.daysOverdue > 0) ...[
              const SizedBox(height: 4),
              Text(
                '${inv.daysOverdue} dias em atraso',
                style: const TextStyle(
                  color: AppColors.danger,
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
            ],

            // Late fee
            if (inv.lateFee != null) ...[
              const SizedBox(height: 20),
              const SectionHeader(title: 'Encargos por atraso'),
              const SizedBox(height: 8),
              _FeeTile(
                  'Multa (2%)', inv.lateFee!.lateFeeAmount.toBRL()),
              const SizedBox(height: 4),
              _FeeTile(
                  'Juros (1%/mês)', inv.lateFee!.interestAmount.toBRL()),
              const SizedBox(height: 4),
              _FeeTile('Total com encargos',
                  inv.lateFee!.totalAmount.toBRL(),
                  bold: true),
            ],

            // PIX QR Code
            if (inv.pixCharge != null) ...[
              const SizedBox(height: 24),
              const SectionHeader(title: 'PIX'),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerLow,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Código PIX',
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      inv.pixCharge!.qrCode,
                      style: const TextStyle(
                          fontFamily: 'monospace', fontSize: 12),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    TextButton.icon(
                      onPressed: () {
                        Clipboard.setData(
                          ClipboardData(text: inv.pixCharge!.qrCode),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Código PIX copiado!')),
                        );
                      },
                      icon: const Icon(Icons.copy, size: 16),
                      label: const Text('Copiar código'),
                    ),
                  ],
                ),
              ),
            ],

            // Payment record
            if (inv.payment != null) ...[
              const SizedBox(height: 24),
              const SectionHeader(title: 'Pagamento'),
              const SizedBox(height: 8),
              _FeeTile('Valor pago', inv.payment!.amountPaid.toBRL()),
              const SizedBox(height: 4),
              _FeeTile('Meio', inv.payment!.paymentMethod),
              const SizedBox(height: 4),
              _FeeTile('Data', inv.payment!.paidAt.toBrDate()),
            ],

            // Actions
            if (canPay) ...[
              const SizedBox(height: 32),
              if (inv.pixCharge == null)
                AppButton(
                  label: 'Gerar QR Code PIX',
                  isLoading: _loadingPix,
                  icon: Icons.qr_code,
                  onPressed: _generatePix,
                ),
              if (inv.pixCharge == null) const SizedBox(height: 12),
              AppButton(
                label: 'Registrar pagamento',
                isLoading: _loadingPayment,
                icon: Icons.check_circle_outline,
                onPressed: _showPaymentDialog,
              ),
            ],

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

class _FeeTile extends StatelessWidget {
  const _FeeTile(this.label, this.value, {this.bold = false});

  final String label;
  final String value;
  final bool bold;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: bold
              ? const TextStyle(fontWeight: FontWeight.w600)
              : Theme.of(context).textTheme.bodyMedium,
        ),
        Text(
          value,
          style: bold ? const TextStyle(fontWeight: FontWeight.w700) : null,
        ),
      ],
    );
  }
}
