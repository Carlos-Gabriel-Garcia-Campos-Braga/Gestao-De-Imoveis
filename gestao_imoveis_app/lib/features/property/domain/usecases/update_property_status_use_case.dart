import 'package:gestao_imoveis/features/property/domain/entities/property.dart';
import 'package:gestao_imoveis/features/property/domain/repositories/i_property_repository.dart';
import 'package:gestao_imoveis/features/property/domain/value_objects/property_status.dart';

class UpdatePropertyStatusUseCase {
  const UpdatePropertyStatusUseCase(this._repository);

  final IPropertyRepository _repository;

  Future<Property> execute(int id, PropertyStatus status) =>
      _repository.updateStatus(id, status);
}
