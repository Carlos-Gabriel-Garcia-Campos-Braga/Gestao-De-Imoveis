// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_payment_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegisterPaymentRequestModelImpl _$$RegisterPaymentRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RegisterPaymentRequestModelImpl(
      amountPaid: (json['amountPaid'] as num).toDouble(),
      paymentMethod: json['paymentMethod'] as String? ?? 'PIX',
    );

Map<String, dynamic> _$$RegisterPaymentRequestModelImplToJson(
        _$RegisterPaymentRequestModelImpl instance) =>
    <String, dynamic>{
      'amountPaid': instance.amountPaid,
      'paymentMethod': instance.paymentMethod,
    };
