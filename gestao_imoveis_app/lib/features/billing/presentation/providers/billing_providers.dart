import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestao_imoveis/core/network/dio_provider.dart';
import 'package:gestao_imoveis/features/billing/data/datasources/billing_remote_datasource.dart';
import 'package:gestao_imoveis/features/billing/data/repositories/invoice_repository_impl.dart';
import 'package:gestao_imoveis/features/billing/domain/entities/invoice.dart';
import 'package:gestao_imoveis/features/billing/domain/repositories/i_invoice_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'billing_providers.g.dart';

// ── Infrastructure ─────────────────────────────────────────────────────────

@Riverpod(keepAlive: true)
BillingRemoteDataSource billingRemoteDataSource(Ref ref) =>
    BillingRemoteDataSource(ref.watch(dioProvider));

@Riverpod(keepAlive: true)
IInvoiceRepository invoiceRepository(Ref ref) =>
    InvoiceRepositoryImpl(ref.watch(billingRemoteDataSourceProvider));

// ── Invoice list ───────────────────────────────────────────────────────────

@riverpod
class InvoiceList extends _$InvoiceList {
  @override
  Future<List<Invoice>> build() =>
      ref.watch(invoiceRepositoryProvider).getAll();

  Future<Invoice?> registerPayment(
    int id, {
    required double amountPaid,
    String paymentMethod = 'PIX',
  }) async {
    final result = await AsyncValue.guard(
      () => ref
          .read(invoiceRepositoryProvider)
          .registerPayment(id, amountPaid: amountPaid, paymentMethod: paymentMethod),
    );
    ref.invalidateSelf();
    return result.valueOrNull;
  }

  Future<Invoice?> generatePix(int id) async {
    final result = await AsyncValue.guard(
      () => ref.read(invoiceRepositoryProvider).generatePix(id),
    );
    ref.invalidateSelf();
    return result.valueOrNull;
  }

  Future<void> refresh() async => ref.invalidateSelf();
}

// ── Invoice detail ─────────────────────────────────────────────────────────

@riverpod
Future<Invoice> invoiceDetail(Ref ref, int id) =>
    ref.watch(invoiceRepositoryProvider).getById(id);

// ── Overdue & due-soon ─────────────────────────────────────────────────────

@riverpod
Future<List<Invoice>> overdueInvoices(Ref ref) =>
    ref.watch(invoiceRepositoryProvider).getOverdue();

@riverpod
Future<List<Invoice>> dueSoonInvoices(Ref ref) =>
    ref.watch(invoiceRepositoryProvider).getDueSoon();
