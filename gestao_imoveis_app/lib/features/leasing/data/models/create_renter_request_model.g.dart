// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_renter_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateRenterRequestModelImpl _$$CreateRenterRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateRenterRequestModelImpl(
      name: json['name'] as String,
      cpf: json['cPF'] as String,
      phoneNumber: json['phoneNumber'] as String,
    );

Map<String, dynamic> _$$CreateRenterRequestModelImplToJson(
        _$CreateRenterRequestModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'cPF': instance.cpf,
      'phoneNumber': instance.phoneNumber,
    };
