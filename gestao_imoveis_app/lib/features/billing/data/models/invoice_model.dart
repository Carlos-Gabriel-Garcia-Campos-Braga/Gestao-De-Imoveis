import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gestao_imoveis/features/billing/domain/entities/invoice.dart';
import 'package:gestao_imoveis/features/billing/domain/value_objects/invoice_status.dart';

part 'invoice_model.freezed.dart';
part 'invoice_model.g.dart';

@freezed
class PixChargeModel with _$PixChargeModel {
  const factory PixChargeModel({
    required String qrCode,
    required DateTime expiresAt,
    required String status,
  }) = _PixChargeModel;

  factory PixChargeModel.fromJson(Map<String, dynamic> json) =>
      _$PixChargeModelFromJson(json);
}

@freezed
class LateFeeModel with _$LateFeeModel {
  const factory LateFeeModel({
    required int daysOverdue,
    required double lateFeeAmount,
    required double interestAmount,
    required double totalAmount,
  }) = _LateFeeModel;

  factory LateFeeModel.fromJson(Map<String, dynamic> json) =>
      _$LateFeeModelFromJson(json);
}

@freezed
class PaymentRecordModel with _$PaymentRecordModel {
  const factory PaymentRecordModel({
    required DateTime paidAt,
    required double amountPaid,
    required String paymentMethod,
  }) = _PaymentRecordModel;

  factory PaymentRecordModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentRecordModelFromJson(json);
}

@freezed
class InvoiceModel with _$InvoiceModel {
  const factory InvoiceModel({
    required int id,
    required int rentalContractId,
    required String description,
    required String dueDate,
    required double amount,
    required String status,
    PixChargeModel? pixCharge,
    LateFeeModel? lateFee,
    @JsonKey(name: 'payment') PaymentRecordModel? paymentRecord,
  }) = _InvoiceModel;

  factory InvoiceModel.fromJson(Map<String, dynamic> json) =>
      _$InvoiceModelFromJson(json);
}

extension InvoiceModelToEntity on InvoiceModel {
  Invoice toEntity() => Invoice(
        id: id,
        rentalContractId: rentalContractId,
        description: description,
        dueDate: DateTime.parse(dueDate),
        amount: amount,
        status: InvoiceStatusLabel.fromApi(status),
        pixCharge: pixCharge == null
            ? null
            : PixCharge(
                qrCode: pixCharge!.qrCode,
                expiresAt: pixCharge!.expiresAt,
                status: pixCharge!.status,
              ),
        lateFee: lateFee == null
            ? null
            : LateFee(
                daysOverdue: lateFee!.daysOverdue,
                lateFeeAmount: lateFee!.lateFeeAmount,
                interestAmount: lateFee!.interestAmount,
                totalAmount: lateFee!.totalAmount,
              ),
        payment: paymentRecord == null
            ? null
            : PaymentRecord(
                paidAt: paymentRecord!.paidAt,
                amountPaid: paymentRecord!.amountPaid,
                paymentMethod: paymentRecord!.paymentMethod,
              ),
      );
}
