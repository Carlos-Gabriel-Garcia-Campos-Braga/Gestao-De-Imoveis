import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_payment_request_model.freezed.dart';
part 'register_payment_request_model.g.dart';

@freezed
class RegisterPaymentRequestModel with _$RegisterPaymentRequestModel {
  const factory RegisterPaymentRequestModel({
    required double amountPaid,
    @Default('PIX') String paymentMethod,
  }) = _RegisterPaymentRequestModel;

  factory RegisterPaymentRequestModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterPaymentRequestModelFromJson(json);
}
