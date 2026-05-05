import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gestao_imoveis/features/property/domain/value_objects/inspection_type.dart';

part 'inspection_report.freezed.dart';

@freezed
class InspectionReport with _$InspectionReport {
  const factory InspectionReport({
    required int id,
    required int propertyId,
    required InspectionType type,
    required String inspector,
    String? notes,
    required DateTime inspectedAt,
  }) = _InspectionReport;
}
