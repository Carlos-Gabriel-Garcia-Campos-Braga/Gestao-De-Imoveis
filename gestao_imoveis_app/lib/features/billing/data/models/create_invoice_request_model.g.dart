// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_invoice_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateInvoiceRequestModelImpl _$$CreateInvoiceRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateInvoiceRequestModelImpl(
      rentalContractId: (json['rentalContractId'] as num).toInt(),
      description: json['description'] as String,
      dueDate: json['dueDate'] as String,
      amount: (json['amount'] as num).toDouble(),
    );

Map<String, dynamic> _$$CreateInvoiceRequestModelImplToJson(
        _$CreateInvoiceRequestModelImpl instance) =>
    <String, dynamic>{
      'rentalContractId': instance.rentalContractId,
      'description': instance.description,
      'dueDate': instance.dueDate,
      'amount': instance.amount,
    };
