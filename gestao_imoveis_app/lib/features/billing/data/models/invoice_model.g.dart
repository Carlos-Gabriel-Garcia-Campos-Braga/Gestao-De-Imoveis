// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PixChargeModelImpl _$$PixChargeModelImplFromJson(Map<String, dynamic> json) =>
    _$PixChargeModelImpl(
      qrCode: json['qrCode'] as String,
      expiresAt: DateTime.parse(json['expiresAt'] as String),
      status: json['status'] as String,
    );

Map<String, dynamic> _$$PixChargeModelImplToJson(
        _$PixChargeModelImpl instance) =>
    <String, dynamic>{
      'qrCode': instance.qrCode,
      'expiresAt': instance.expiresAt.toIso8601String(),
      'status': instance.status,
    };

_$LateFeeModelImpl _$$LateFeeModelImplFromJson(Map<String, dynamic> json) =>
    _$LateFeeModelImpl(
      daysOverdue: (json['daysOverdue'] as num).toInt(),
      lateFeeAmount: (json['lateFeeAmount'] as num).toDouble(),
      interestAmount: (json['interestAmount'] as num).toDouble(),
      totalAmount: (json['totalAmount'] as num).toDouble(),
    );

Map<String, dynamic> _$$LateFeeModelImplToJson(_$LateFeeModelImpl instance) =>
    <String, dynamic>{
      'daysOverdue': instance.daysOverdue,
      'lateFeeAmount': instance.lateFeeAmount,
      'interestAmount': instance.interestAmount,
      'totalAmount': instance.totalAmount,
    };

_$PaymentRecordModelImpl _$$PaymentRecordModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PaymentRecordModelImpl(
      paidAt: DateTime.parse(json['paidAt'] as String),
      amountPaid: (json['amountPaid'] as num).toDouble(),
      paymentMethod: json['paymentMethod'] as String,
    );

Map<String, dynamic> _$$PaymentRecordModelImplToJson(
        _$PaymentRecordModelImpl instance) =>
    <String, dynamic>{
      'paidAt': instance.paidAt.toIso8601String(),
      'amountPaid': instance.amountPaid,
      'paymentMethod': instance.paymentMethod,
    };

_$InvoiceModelImpl _$$InvoiceModelImplFromJson(Map<String, dynamic> json) =>
    _$InvoiceModelImpl(
      id: (json['id'] as num).toInt(),
      rentalContractId: (json['rentalContractId'] as num).toInt(),
      description: json['description'] as String,
      dueDate: json['dueDate'] as String,
      amount: (json['amount'] as num).toDouble(),
      status: json['status'] as String,
      pixCharge: json['pixCharge'] == null
          ? null
          : PixChargeModel.fromJson(json['pixCharge'] as Map<String, dynamic>),
      lateFee: json['lateFee'] == null
          ? null
          : LateFeeModel.fromJson(json['lateFee'] as Map<String, dynamic>),
      paymentRecord: json['payment'] == null
          ? null
          : PaymentRecordModel.fromJson(
              json['payment'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$InvoiceModelImplToJson(_$InvoiceModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rentalContractId': instance.rentalContractId,
      'description': instance.description,
      'dueDate': instance.dueDate,
      'amount': instance.amount,
      'status': instance.status,
      'pixCharge': instance.pixCharge,
      'lateFee': instance.lateFee,
      'payment': instance.paymentRecord,
    };
