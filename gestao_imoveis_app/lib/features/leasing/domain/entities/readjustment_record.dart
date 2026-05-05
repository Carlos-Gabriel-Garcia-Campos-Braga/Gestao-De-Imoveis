import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gestao_imoveis/features/leasing/domain/value_objects/economic_index.dart';

part 'readjustment_record.freezed.dart';

@freezed
class ReadjustmentRecord with _$ReadjustmentRecord {
  const factory ReadjustmentRecord({
    required int contractId,
    required EconomicIndex index,
    required double rate,
    required double oldValue,
    required double newValue,
    required DateTime appliedAt,
  }) = _ReadjustmentRecord;
}
