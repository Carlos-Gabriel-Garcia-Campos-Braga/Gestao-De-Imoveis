import 'package:gestao_imoveis/features/property/domain/entities/property.dart';
import 'package:gestao_imoveis/features/property/domain/repositories/i_property_repository.dart';

class GetPropertyDetailUseCase {
  const GetPropertyDetailUseCase(this._repository);

  final IPropertyRepository _repository;

  Future<Property> execute(int id) => _repository.getById(id);
}
