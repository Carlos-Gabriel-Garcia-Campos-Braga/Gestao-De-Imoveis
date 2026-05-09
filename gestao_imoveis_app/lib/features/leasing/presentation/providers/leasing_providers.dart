import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestao_imoveis/core/network/dio_provider.dart';
import 'package:gestao_imoveis/features/leasing/data/datasources/leasing_remote_datasource.dart';
import 'package:gestao_imoveis/features/leasing/data/repositories/rental_contract_repository_impl.dart';
import 'package:gestao_imoveis/features/leasing/data/repositories/renter_repository_impl.dart';
import 'package:gestao_imoveis/features/leasing/domain/entities/readjustment_record.dart';
import 'package:gestao_imoveis/features/leasing/domain/entities/rental_contract.dart';
import 'package:gestao_imoveis/features/leasing/domain/entities/renter.dart';
import 'package:gestao_imoveis/features/leasing/domain/repositories/i_rental_contract_repository.dart';
import 'package:gestao_imoveis/features/leasing/domain/repositories/i_renter_repository.dart';
import 'package:gestao_imoveis/features/leasing/domain/value_objects/economic_index.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'leasing_providers.g.dart';

// ── Infrastructure ─────────────────────────────────────────────────────────

@Riverpod(keepAlive: true)
LeasingRemoteDataSource leasingRemoteDataSource(Ref ref) =>
    LeasingRemoteDataSource(ref.watch(dioProvider));

@Riverpod(keepAlive: true)
IRentalContractRepository rentalContractRepository(Ref ref) =>
    RentalContractRepositoryImpl(ref.watch(leasingRemoteDataSourceProvider));

@Riverpod(keepAlive: true)
IRenterRepository renterRepository(Ref ref) =>
    RenterRepositoryImpl(ref.watch(leasingRemoteDataSourceProvider));

// ── Contracts ──────────────────────────────────────────────────────────────

@riverpod
class ContractList extends _$ContractList {
  @override
  Future<List<RentalContract>> build() =>
      ref.watch(rentalContractRepositoryProvider).getAll();

  Future<ReadjustmentRecord?> applyReadjustment(
    int contractId, {
    EconomicIndex? index,
    double? manualRate,
  }) async {
    final result = await AsyncValue.guard(
      () => ref
          .read(rentalContractRepositoryProvider)
          .applyReadjustment(contractId, index: index, manualRate: manualRate),
    );
    ref.invalidateSelf();
    return result.valueOrNull;
  }

  Future<void> terminate(int contractId, String terminatedBy) async {
    await AsyncValue.guard(
      () => ref
          .read(rentalContractRepositoryProvider)
          .terminate(contractId, terminatedBy),
    );
    ref.invalidateSelf();
  }

  Future<void> refresh() async => ref.invalidateSelf();
}

// ── Renters ────────────────────────────────────────────────────────────────

@riverpod
class RenterList extends _$RenterList {
  @override
  Future<List<Renter>> build() =>
      ref.watch(renterRepositoryProvider).getAll();

  Future<void> refresh() async => ref.invalidateSelf();
}

@riverpod
Future<Renter> renterDetail(Ref ref, int id) =>
    ref.watch(renterRepositoryProvider).getById(id);
