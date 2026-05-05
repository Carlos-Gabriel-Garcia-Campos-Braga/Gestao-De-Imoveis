// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_property_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreatePropertyRequestModelImpl _$$CreatePropertyRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CreatePropertyRequestModelImpl(
      description: json['description'] as String,
      type: json['type'] as String,
      zipCode: json['zipCode'] as String,
      number: json['number'] as String?,
      complement: json['complement'] as String?,
    );

Map<String, dynamic> _$$CreatePropertyRequestModelImplToJson(
        _$CreatePropertyRequestModelImpl instance) =>
    <String, dynamic>{
      'description': instance.description,
      'type': instance.type,
      'zipCode': instance.zipCode,
      'number': instance.number,
      'complement': instance.complement,
    };
