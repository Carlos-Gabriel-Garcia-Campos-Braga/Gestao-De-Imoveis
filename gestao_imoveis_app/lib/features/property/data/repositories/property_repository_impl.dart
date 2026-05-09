import 'package:gestao_imoveis/features/property/data/datasources/property_remote_datasource.dart';
import 'package:gestao_imoveis/features/property/data/models/create_property_request_model.dart';
import 'package:gestao_imoveis/features/property/data/models/inspection_report_model.dart';
import 'package:gestao_imoveis/features/property/data/models/property_model.dart';
import 'package:gestao_imoveis/features/property/domain/entities/inspection_report.dart';
import 'package:gestao_imoveis/features/property/domain/entities/property.dart';
import 'package:gestao_imoveis/features/property/domain/repositories/i_property_repository.dart';
import 'package:gestao_imoveis/features/property/domain/value_objects/property_status.dart';

class PropertyRepositoryImpl implements IPropertyRepository {
  const PropertyRepositoryImpl(this._dataSource);

  final PropertyRemoteDataSource _dataSource;

  @override
  Future<List<Property>> getAll() async {
    final models = await _dataSource.getAll();
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<List<Property>> getByStatus(PropertyStatus status) async {
    final models = await _dataSource.getByStatus(status.toApiString);
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<Property> getById(int id) async {
    final model = await _dataSource.getById(id);
    return model.toEntity();
  }

  @override
  Future<Property> create({
    required String description,
    required String type,
    required String zipCode,
    String? number,
    String? complement,
  }) async {
    final model = await _dataSource.create(
      CreatePropertyRequestModel(
        description: description,
        type: type,
        zipCode: zipCode,
        number: number,
        complement: complement,
      ),
    );
    return model.toEntity();
  }

  @override
  Future<Property> update(
    int id, {
    required String description,
    required String type,
    required String zipCode,
    String? number,
    String? complement,
  }) async {
    final model = await _dataSource.update(
      id,
      description: description,
      type: type,
      zipCode: zipCode,
      number: number,
      complement: complement,
    );
    return model.toEntity();
  }

  @override
  Future<Property> updateStatus(int id, PropertyStatus status) async {
    final model = await _dataSource.updateStatus(id, status.toApiString);
    return model.toEntity();
  }

  @override
  Future<List<Property>> getArchived() async {
    final models = await _dataSource.getArchived();
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<Property> archive(int id) async {
    final model = await _dataSource.archive(id);
    return model.toEntity();
  }

  @override
  Future<Property> unarchive(int id) async {
    final model = await _dataSource.unarchive(id);
    return model.toEntity();
  }

  @override
  Future<List<InspectionReport>> getInspections(int id) async {
    final models = await _dataSource.getInspections(id);
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<InspectionReport> addInspection(
    int id, {
    required String type,
    required String inspector,
    String? notes,
  }) async {
    final model = await _dataSource.addInspection(
      id,
      type: type,
      inspector: inspector,
      notes: notes,
    );
    return model.toEntity();
  }
}
