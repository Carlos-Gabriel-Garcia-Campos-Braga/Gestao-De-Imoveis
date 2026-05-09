import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestao_imoveis/features/billing/presentation/providers/billing_providers.dart';
import 'package:gestao_imoveis/features/leasing/domain/value_objects/contract_status.dart';
import 'package:gestao_imoveis/features/leasing/presentation/providers/leasing_providers.dart';
import 'package:gestao_imoveis/features/property/domain/value_objects/property_status.dart';
import 'package:gestao_imoveis/features/property/presentation/providers/property_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dashboard_providers.g.dart';

class DashboardKpis {
  const DashboardKpis({
    required this.totalProperties,
    required this.occupiedProperties,
    required this.vacantProperties,
    required this.activeContracts,
    required this.overdueInvoices,
    required this.monthlyRevenue,
  });

  final int totalProperties;
  final int occupiedProperties;
  final int vacantProperties;
  final int activeContracts;
  final int overdueInvoices;
  final double monthlyRevenue;

  double get occupancyRate =>
      totalProperties == 0 ? 0 : occupiedProperties / totalProperties;
}

@riverpod
Future<DashboardKpis> dashboardKpis(Ref ref) async {
  final properties = await ref.watch(propertyListProvider.future);
  final contracts = await ref.watch(contractListProvider.future);
  final overdue = await ref.watch(overdueInvoicesProvider.future);
  await ref.watch(invoiceListProvider.future);

  final occupied = properties
      .where((p) => p.status == PropertyStatus.occupied)
      .length;
  final vacant = properties
      .where((p) => p.status == PropertyStatus.vacant)
      .length;

  final activeContracts = contracts
      .where((c) => c.status == ContractStatus.active)
      .length;

  final monthlyRevenue = contracts
      .where((c) => c.status == ContractStatus.active)
      .fold<double>(0, (sum, c) => sum + c.rentalValue);

  return DashboardKpis(
    totalProperties: properties.length,
    occupiedProperties: occupied,
    vacantProperties: vacant,
    activeContracts: activeContracts,
    overdueInvoices: overdue.length,
    monthlyRevenue: monthlyRevenue,
  );
}
