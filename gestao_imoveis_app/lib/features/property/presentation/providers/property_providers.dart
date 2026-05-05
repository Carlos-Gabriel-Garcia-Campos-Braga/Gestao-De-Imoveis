import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestao_imoveis/core/network/dio_provider.dart';
import 'package:gestao_imoveis/features/property/data/datasources/property_remote_datasource.dart';
import 'package:gestao_imoveis/features/property/data/repositories/property_repository_impl.dart';
import 'package:gestao_imoveis/features/property/domain/entities/inspection_report.dart';
import 'package:gestao_imoveis/features/property/domain/entities/property.dart';
import 'package:gestao_imoveis/features/property/domain/repositories/i_property_repository.dart';
import 'package:gestao_imoveis/features/property/domain/value_objects/property_status.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'property_providers.g.dart';

// ── Infrastructure ────────────────────────────────────────────────────────────

@Riverpod(keepAlive: true)
PropertyRemoteDataSource propertyRemoteDataSource(Ref ref) =>
    PropertyRemoteDataSource(ref.watch(dioProvider));

@Riverpod(keepAlive: true)
IPropertyRepository propertyRepository(Ref ref) =>
    PropertyRepositoryImpl(ref.watch(propertyRemoteDataSourceProvider));

// ── Filter state ──────────────────────────────────────────────────────────────

@riverpod
class PropertyStatusFilter extends _$PropertyStatusFilter {
  @override
  PropertyStatus? build() => null;

  void set(PropertyStatus? status) => state = status;
}

// ── Property list with filter awareness ──────────────────────────────────────

@riverpod
class PropertyList extends _$PropertyList {
  @override
  Future<List<Property>> build() async {
    final filter = ref.watch(propertyStatusFilterProvider);
    final repo = ref.watch(propertyRepositoryProvider);
    return filter == null ? repo.getAll() : repo.getByStatus(filter);
  }

  Future<void> updateStatus(int id, PropertyStatus status) async {
    await AsyncValue.guard(
      () => ref.read(propertyRepositoryProvider).updateStatus(id, status),
    );
    ref.invalidateSelf();
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
  }
}

// ── Property detail ───────────────────────────────────────────────────────────

@riverpod
Future<Property> propertyDetail(Ref ref, int id) =>
    ref.watch(propertyRepositoryProvider).getById(id);

// ── Inspections ───────────────────────────────────────────────────────────────

@riverpod
Future<List<InspectionReport>> propertyInspections(Ref ref, int id) =>
    ref.watch(propertyRepositoryProvider).getInspections(id);
