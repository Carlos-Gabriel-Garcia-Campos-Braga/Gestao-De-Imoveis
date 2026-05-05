import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gestao_imoveis/features/leasing/domain/entities/readjustment_record.dart';
import 'package:gestao_imoveis/features/leasing/domain/value_objects/economic_index.dart';

part 'readjustment_record_model.freezed.dart';
part 'readjustment_record_model.g.dart';

@freezed
class ReadjustmentRecordModel with _$ReadjustmentRecordModel {
  const factory ReadjustmentRecordModel({
    required int contractId,
    required String index,
    required double rate,
    required double oldValue,
    required double newValue,
    required DateTime appliedAt,
  }) = _ReadjustmentRecordModel;

  factory ReadjustmentRecordModel.fromJson(Map<String, dynamic> json) =>
      _$ReadjustmentRecordModelFromJson(json);
}

extension ReadjustmentRecordModelToEntity on ReadjustmentRecordModel {
  ReadjustmentRecord toEntity() => ReadjustmentRecord(
        contractId: contractId,
        index: EconomicIndexLabel.fromApi(index),
        rate: rate,
        oldValue: oldValue,
        newValue: newValue,
        appliedAt: appliedAt,
      );
}
