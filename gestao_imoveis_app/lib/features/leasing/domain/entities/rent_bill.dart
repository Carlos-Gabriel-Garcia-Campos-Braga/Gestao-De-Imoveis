import 'package:freezed_annotation/freezed_annotation.dart';

part 'rent_bill.freezed.dart';

@freezed
class RentBill with _$RentBill {
  const factory RentBill({
    required int id,
    int? rentalContractId,
    required String type,
    required DateTime validationDate,
    required double value,
  }) = _RentBill;
}
