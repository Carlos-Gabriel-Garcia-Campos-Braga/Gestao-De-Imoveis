import 'package:freezed_annotation/freezed_annotation.dart';

part 'apply_readjustment_request_model.freezed.dart';
part 'apply_readjustment_request_model.g.dart';

@freezed
class ApplyReadjustmentRequestModel with _$ApplyReadjustmentRequestModel {
  const factory ApplyReadjustmentRequestModel({
    String? index,
    double? manualRate,
  }) = _ApplyReadjustmentRequestModel;

  factory ApplyReadjustmentRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ApplyReadjustmentRequestModelFromJson(json);
}
