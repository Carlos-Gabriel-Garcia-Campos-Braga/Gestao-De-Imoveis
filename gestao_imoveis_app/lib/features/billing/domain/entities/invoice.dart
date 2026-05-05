import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gestao_imoveis/features/billing/domain/value_objects/invoice_status.dart';

part 'invoice.freezed.dart';

@freezed
class PixCharge with _$PixCharge {
  const factory PixCharge({
    required String qrCode,
    required DateTime expiresAt,
    required String status,
  }) = _PixCharge;
}

@freezed
class LateFee with _$LateFee {
  const factory LateFee({
    required int daysOverdue,
    required double lateFeeAmount,
    required double interestAmount,
    required double totalAmount,
  }) = _LateFee;
}

@freezed
class PaymentRecord with _$PaymentRecord {
  const factory PaymentRecord({
    required DateTime paidAt,
    required double amountPaid,
    required String paymentMethod,
  }) = _PaymentRecord;
}

@freezed
class Invoice with _$Invoice {
  const factory Invoice({
    required int id,
    required int rentalContractId,
    required String description,
    required DateTime dueDate,
    required double amount,
    required InvoiceStatus status,
    PixCharge? pixCharge,
    LateFee? lateFee,
    PaymentRecord? payment,
  }) = _Invoice;

  const Invoice._();

  int get daysOverdue {
    if (status != InvoiceStatus.overdue) return 0;
    return DateTime.now().difference(dueDate).inDays.clamp(0, 9999);
  }

  double get totalDue => lateFee?.totalAmount ?? amount;
}
