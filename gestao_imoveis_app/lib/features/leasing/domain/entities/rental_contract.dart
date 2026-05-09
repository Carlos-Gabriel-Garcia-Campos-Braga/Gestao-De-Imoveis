import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gestao_imoveis/features/leasing/domain/entities/readjustment_record.dart';
import 'package:gestao_imoveis/features/leasing/domain/entities/rent_bill.dart';
import 'package:gestao_imoveis/features/leasing/domain/entities/renter.dart';
import 'package:gestao_imoveis/features/leasing/domain/value_objects/contract_status.dart';
import 'package:gestao_imoveis/features/leasing/domain/value_objects/economic_index.dart';

part 'rental_contract.freezed.dart';

@freezed
class RentalContract with _$RentalContract {
  const factory RentalContract({
    required int id,
    required Renter renter,
    required String street,
    required String number,
    String? complement,
    required String neighborhood,
    required String city,
    required String state,
    required String zipCode,
    required List<RentBill> bills,
    required DateTime startContract,
    required DateTime endContract,
    required double rentalValue,
    required EconomicIndex preferredIndex,
    required List<ReadjustmentRecord> readjustmentHistory,
    DateTime? terminatedAt,
    String? terminatedBy,
  }) = _RentalContract;

  const RentalContract._();

  ContractStatus get status {
    if (terminatedAt != null) return ContractStatus.terminated;
    final now = DateTime.now();
    if (now.isBefore(endContract)) return ContractStatus.active;
    return ContractStatus.expired;
  }

  bool get readjustmentPending {
    if (readjustmentHistory.isEmpty) return false;
    final last = readjustmentHistory
        .reduce((a, b) => a.appliedAt.isAfter(b.appliedAt) ? a : b);
    return DateTime.now().difference(last.appliedAt).inDays >= 330;
  }

  String get fullAddress =>
      '$street, $number${complement != null ? ', $complement' : ''} — $neighborhood, $city/$state';
}
