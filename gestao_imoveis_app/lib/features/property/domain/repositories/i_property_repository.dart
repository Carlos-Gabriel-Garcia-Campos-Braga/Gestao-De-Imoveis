import 'package:gestao_imoveis/features/property/domain/entities/inspection_report.dart';
import 'package:gestao_imoveis/features/property/domain/entities/property.dart';
import 'package:gestao_imoveis/features/property/domain/value_objects/property_status.dart';

abstract interface class IPropertyRepository {
  Future<List<Property>> getAll();

  Future<List<Property>> getByStatus(PropertyStatus status);

  Future<Property> getById(int id);

  Future<Property> create({
    required String description,
    required String type,
    required String zipCode,
    String? number,
    String? complement,
  });

  Future<Property> update(
    int id, {
    required String description,
    required String type,
    required String zipCode,
    String? number,
    String? complement,
  });

  Future<Property> updateStatus(int id, PropertyStatus status);

  Future<List<Property>> getArchived();

  Future<Property> archive(int id);

  Future<Property> unarchive(int id);

  Future<List<InspectionReport>> getInspections(int id);

  Future<InspectionReport> addInspection(
    int id, {
    required String type,
    required String inspector,
    String? notes,
  });
}
