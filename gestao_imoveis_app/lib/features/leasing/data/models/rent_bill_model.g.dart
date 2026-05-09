// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rent_bill_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RentBillModelImpl _$$RentBillModelImplFromJson(Map<String, dynamic> json) =>
    _$RentBillModelImpl(
      id: (json['id'] as num).toInt(),
      rentalContractId: (json['rentalContractId'] as num?)?.toInt(),
      type: json['type'] as String,
      validationDate: DateTime.parse(json['validationDate'] as String),
      value: (json['value'] as num).toDouble(),
    );

Map<String, dynamic> _$$RentBillModelImplToJson(_$RentBillModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rentalContractId': instance.rentalContractId,
      'type': instance.type,
      'validationDate': instance.validationDate.toIso8601String(),
      'value': instance.value,
    };
