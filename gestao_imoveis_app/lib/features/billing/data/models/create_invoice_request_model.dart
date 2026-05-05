import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_invoice_request_model.freezed.dart';
part 'create_invoice_request_model.g.dart';

@freezed
class CreateInvoiceRequestModel with _$CreateInvoiceRequestModel {
  const factory CreateInvoiceRequestModel({
    required int rentalContractId,
    required String description,
    required String dueDate,
    required double amount,
  }) = _CreateInvoiceRequestModel;

  factory CreateInvoiceRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CreateInvoiceRequestModelFromJson(json);
}
