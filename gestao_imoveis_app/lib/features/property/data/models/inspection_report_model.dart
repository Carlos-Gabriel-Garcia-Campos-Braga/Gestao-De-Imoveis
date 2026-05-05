import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gestao_imoveis/features/property/domain/entities/inspection_report.dart';
import 'package:gestao_imoveis/features/property/domain/value_objects/inspection_type.dart';

part 'inspection_report_model.freezed.dart';
part 'inspection_report_model.g.dart';

@freezed
class InspectionReportModel with _$InspectionReportModel {
  const factory InspectionReportModel({
    required int id,
    required int propertyId,
    required String type,
    required String inspector,
    String? notes,
    required DateTime inspectedAt,
  }) = _InspectionReportModel;

  factory InspectionReportModel.fromJson(Map<String, dynamic> json) =>
      _$InspectionReportModelFromJson(json);
}

extension InspectionReportModelToEntity on InspectionReportModel {
  InspectionReport toEntity() => InspectionReport(
        id: id,
        propertyId: propertyId,
        type: InspectionTypeLabel.fromApi(type),
        inspector: inspector,
        notes: notes,
        inspectedAt: inspectedAt,
      );
}
