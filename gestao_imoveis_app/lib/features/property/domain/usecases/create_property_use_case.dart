import 'package:gestao_imoveis/features/property/domain/entities/property.dart';
import 'package:gestao_imoveis/features/property/domain/repositories/i_property_repository.dart';

class CreatePropertyUseCase {
  const CreatePropertyUseCase(this._repository);

  final IPropertyRepository _repository;

  Future<Property> execute({
    required String description,
    required String type,
    required String zipCode,
    required String number,
    String? complement,
  }) =>
      _repository.create(
        description: description,
        type: type,
        zipCode: zipCode,
        number: number,
        complement: complement,
      );
}
