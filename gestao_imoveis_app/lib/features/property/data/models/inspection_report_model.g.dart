// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inspection_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InspectionReportModelImpl _$$InspectionReportModelImplFromJson(
        Map<String, dynamic> json) =>
    _$InspectionReportModelImpl(
      id: (json['id'] as num).toInt(),
      propertyId: (json['propertyId'] as num).toInt(),
      type: json['type'] as String,
      inspector: json['inspector'] as String,
      notes: json['notes'] as String?,
      inspectedAt: DateTime.parse(json['inspectedAt'] as String),
    );

Map<String, dynamic> _$$InspectionReportModelImplToJson(
        _$InspectionReportModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'propertyId': instance.propertyId,
      'type': instance.type,
      'inspector': instance.inspector,
      'notes': instance.notes,
      'inspectedAt': instance.inspectedAt.toIso8601String(),
    };
