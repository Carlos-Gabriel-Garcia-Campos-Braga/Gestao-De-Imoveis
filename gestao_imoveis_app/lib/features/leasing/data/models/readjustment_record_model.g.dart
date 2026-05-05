// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'readjustment_record_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReadjustmentRecordModelImpl _$$ReadjustmentRecordModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ReadjustmentRecordModelImpl(
      contractId: (json['contractId'] as num).toInt(),
      index: (json['index'] as String?) ?? 'IPCA',
      rate: (json['rate'] as num).toDouble(),
      oldValue: (json['oldValue'] as num).toDouble(),
      newValue: (json['newValue'] as num).toDouble(),
      appliedAt: DateTime.parse(json['appliedAt'] as String),
    );

Map<String, dynamic> _$$ReadjustmentRecordModelImplToJson(
        _$ReadjustmentRecordModelImpl instance) =>
    <String, dynamic>{
      'contractId': instance.contractId,
      'index': instance.index,
      'rate': instance.rate,
      'oldValue': instance.oldValue,
      'newValue': instance.newValue,
      'appliedAt': instance.appliedAt.toIso8601String(),
    };
