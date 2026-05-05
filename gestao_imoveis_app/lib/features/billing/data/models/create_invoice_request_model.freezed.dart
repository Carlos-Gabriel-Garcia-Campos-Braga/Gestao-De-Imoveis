// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_invoice_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateInvoiceRequestModel _$CreateInvoiceRequestModelFromJson(
    Map<String, dynamic> json) {
  return _CreateInvoiceRequestModel.fromJson(json);
}

/// @nodoc
mixin _$CreateInvoiceRequestModel {
  int get rentalContractId => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get dueDate => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;

  /// Serializes this CreateInvoiceRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateInvoiceRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateInvoiceRequestModelCopyWith<CreateInvoiceRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateInvoiceRequestModelCopyWith<$Res> {
  factory $CreateInvoiceRequestModelCopyWith(CreateInvoiceRequestModel value,
          $Res Function(CreateInvoiceRequestModel) then) =
      _$CreateInvoiceRequestModelCopyWithImpl<$Res, CreateInvoiceRequestModel>;
  @useResult
  $Res call(
      {int rentalContractId,
      String description,
      String dueDate,
      double amount});
}

/// @nodoc
class _$CreateInvoiceRequestModelCopyWithImpl<$Res,
        $Val extends CreateInvoiceRequestModel>
    implements $CreateInvoiceRequestModelCopyWith<$Res> {
  _$CreateInvoiceRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateInvoiceRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rentalContractId = null,
    Object? description = null,
    Object? dueDate = null,
    Object? amount = null,
  }) {
    return _then(_value.copyWith(
      rentalContractId: null == rentalContractId
          ? _value.rentalContractId
          : rentalContractId // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateInvoiceRequestModelImplCopyWith<$Res>
    implements $CreateInvoiceRequestModelCopyWith<$Res> {
  factory _$$CreateInvoiceRequestModelImplCopyWith(
          _$CreateInvoiceRequestModelImpl value,
          $Res Function(_$CreateInvoiceRequestModelImpl) then) =
      __$$CreateInvoiceRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int rentalContractId,
      String description,
      String dueDate,
      double amount});
}

/// @nodoc
class __$$CreateInvoiceRequestModelImplCopyWithImpl<$Res>
    extends _$CreateInvoiceRequestModelCopyWithImpl<$Res,
        _$CreateInvoiceRequestModelImpl>
    implements _$$CreateInvoiceRequestModelImplCopyWith<$Res> {
  __$$CreateInvoiceRequestModelImplCopyWithImpl(
      _$CreateInvoiceRequestModelImpl _value,
      $Res Function(_$CreateInvoiceRequestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateInvoiceRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rentalContractId = null,
    Object? description = null,
    Object? dueDate = null,
    Object? amount = null,
  }) {
    return _then(_$CreateInvoiceRequestModelImpl(
      rentalContractId: null == rentalContractId
          ? _value.rentalContractId
          : rentalContractId // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateInvoiceRequestModelImpl implements _CreateInvoiceRequestModel {
  const _$CreateInvoiceRequestModelImpl(
      {required this.rentalContractId,
      required this.description,
      required this.dueDate,
      required this.amount});

  factory _$CreateInvoiceRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateInvoiceRequestModelImplFromJson(json);

  @override
  final int rentalContractId;
  @override
  final String description;
  @override
  final String dueDate;
  @override
  final double amount;

  @override
  String toString() {
    return 'CreateInvoiceRequestModel(rentalContractId: $rentalContractId, description: $description, dueDate: $dueDate, amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateInvoiceRequestModelImpl &&
            (identical(other.rentalContractId, rentalContractId) ||
                other.rentalContractId == rentalContractId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, rentalContractId, description, dueDate, amount);

  /// Create a copy of CreateInvoiceRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateInvoiceRequestModelImplCopyWith<_$CreateInvoiceRequestModelImpl>
      get copyWith => __$$CreateInvoiceRequestModelImplCopyWithImpl<
          _$CreateInvoiceRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateInvoiceRequestModelImplToJson(
      this,
    );
  }
}

abstract class _CreateInvoiceRequestModel implements CreateInvoiceRequestModel {
  const factory _CreateInvoiceRequestModel(
      {required final int rentalContractId,
      required final String description,
      required final String dueDate,
      required final double amount}) = _$CreateInvoiceRequestModelImpl;

  factory _CreateInvoiceRequestModel.fromJson(Map<String, dynamic> json) =
      _$CreateInvoiceRequestModelImpl.fromJson;

  @override
  int get rentalContractId;
  @override
  String get description;
  @override
  String get dueDate;
  @override
  double get amount;

  /// Create a copy of CreateInvoiceRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateInvoiceRequestModelImplCopyWith<_$CreateInvoiceRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
