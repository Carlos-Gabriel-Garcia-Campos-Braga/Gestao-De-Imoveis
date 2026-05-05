import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gestao_imoveis/features/leasing/domain/entities/rent_bill.dart';

part 'rent_bill_model.freezed.dart';
part 'rent_bill_model.g.dart';

@freezed
class RentBillModel with _$RentBillModel {
  const factory RentBillModel({
    required int id,
    int? rentalContractId,
    required String type,
    required DateTime validationDate,
    required double value,
  }) = _RentBillModel;

  factory RentBillModel.fromJson(Map<String, dynamic> json) =>
      _$RentBillModelFromJson(json);
}

extension RentBillModelToEntity on RentBillModel {
  RentBill toEntity() => RentBill(
        id: id,
        rentalContractId: rentalContractId,
        type: type,
        validationDate: validationDate,
        value: value,
      );
}
