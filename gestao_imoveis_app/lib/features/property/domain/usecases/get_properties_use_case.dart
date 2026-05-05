import 'package:gestao_imoveis/features/property/domain/entities/property.dart';
import 'package:gestao_imoveis/features/property/domain/repositories/i_property_repository.dart';
import 'package:gestao_imoveis/features/property/domain/value_objects/property_status.dart';

class GetPropertiesUseCase {
  const GetPropertiesUseCase(this._repository);

  final IPropertyRepository _repository;

  Future<List<Property>> execute({PropertyStatus? status}) =>
      status == null ? _repository.getAll() : _repository.getByStatus(status);
}
