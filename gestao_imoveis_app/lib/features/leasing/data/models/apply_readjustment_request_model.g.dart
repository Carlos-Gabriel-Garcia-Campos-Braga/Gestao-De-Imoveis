// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apply_readjustment_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApplyReadjustmentRequestModelImpl
    _$$ApplyReadjustmentRequestModelImplFromJson(Map<String, dynamic> json) =>
        _$ApplyReadjustmentRequestModelImpl(
          index: json['index'] as String?,
          manualRate: (json['manualRate'] as num?)?.toDouble(),
        );

Map<String, dynamic> _$$ApplyReadjustmentRequestModelImplToJson(
        _$ApplyReadjustmentRequestModelImpl instance) =>
    <String, dynamic>{
      'index': instance.index,
      'manualRate': instance.manualRate,
    };
