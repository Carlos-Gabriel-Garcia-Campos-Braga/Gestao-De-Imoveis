import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestao_imoveis/features/leasing/domain/entities/rental_contract.dart';
import 'package:gestao_imoveis/features/leasing/domain/entities/renter.dart';
import 'package:gestao_imoveis/features/leasing/presentation/providers/leasing_providers.dart';
import 'package:gestao_imoveis/features/property/domain/entities/property.dart';
import 'package:gestao_imoveis/features/property/presentation/providers/property_providers.dart';

final archivedPropertiesProvider =
    FutureProvider.autoDispose<List<Property>>((ref) {
  return ref.watch(propertyRepositoryProvider).getArchived();
});

final archivedRentersProvider =
    FutureProvider.autoDispose<List<Renter>>((ref) {
  return ref.watch(renterRepositoryProvider).getArchived();
});

final archivedContractsProvider =
    FutureProvider.autoDispose<List<RentalContract>>((ref) {
  return ref.watch(rentalContractRepositoryProvider).getArchived();
});
