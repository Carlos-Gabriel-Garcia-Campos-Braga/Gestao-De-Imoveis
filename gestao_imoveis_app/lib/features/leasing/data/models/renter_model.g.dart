// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'renter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RenterModelImpl _$$RenterModelImplFromJson(Map<String, dynamic> json) =>
    _$RenterModelImpl(
      id: (json['id'] as num).toInt(),
      name: (json['name'] as String?) ?? '',
      cpf: (json['cPF'] as String?) ?? '',
      phoneNumber: (json['phoneNumber'] as String?) ?? '',
    );

Map<String, dynamic> _$$RenterModelImplToJson(_$RenterModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'cPF': instance.cpf,
      'phoneNumber': instance.phoneNumber,
    };
