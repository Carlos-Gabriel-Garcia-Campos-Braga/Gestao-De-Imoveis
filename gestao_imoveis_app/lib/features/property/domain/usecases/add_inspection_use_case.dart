import 'package:gestao_imoveis/features/property/domain/entities/inspection_report.dart';
import 'package:gestao_imoveis/features/property/domain/repositories/i_property_repository.dart';

class AddInspectionUseCase {
  const AddInspectionUseCase(this._repository);

  final IPropertyRepository _repository;

  Future<InspectionReport> execute(
    int propertyId, {
    required String type,
    required String inspector,
    String? notes,
  }) =>
      _repository.addInspection(
        propertyId,
        type: type,
        inspector: inspector,
        notes: notes,
      );
}
