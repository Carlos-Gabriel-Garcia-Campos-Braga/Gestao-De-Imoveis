import 'package:freezed_annotation/freezed_annotation.dart';

part 'renter.freezed.dart';

@freezed
class Renter with _$Renter {
  const factory Renter({
    required int id,
    required String name,
    required String cpf,
    required String phoneNumber,
  }) = _Renter;

  const Renter._();

  String get formattedCpf {
    final d = cpf.replaceAll(RegExp(r'\D'), '');
    if (d.length != 11) return cpf;
    return '${d.substring(0, 3)}.${d.substring(3, 6)}.${d.substring(6, 9)}-${d.substring(9)}';
  }

  String get formattedPhone {
    final d = phoneNumber.replaceAll(RegExp(r'\D'), '');
    if (d.length == 11) {
      return '(${d.substring(0, 2)}) ${d.substring(2, 7)}-${d.substring(7)}';
    } else if (d.length == 10) {
      return '(${d.substring(0, 2)}) ${d.substring(2, 6)}-${d.substring(6)}';
    }
    return phoneNumber;
  }
}
