// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoice_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PixChargeModel _$PixChargeModelFromJson(Map<String, dynamic> json) {
  return _PixChargeModel.fromJson(json);
}

/// @nodoc
mixin _$PixChargeModel {
  String get qrCode => throw _privateConstructorUsedError;
  DateTime get expiresAt => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  /// Serializes this PixChargeModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PixChargeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PixChargeModelCopyWith<PixChargeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PixChargeModelCopyWith<$Res> {
  factory $PixChargeModelCopyWith(
          PixChargeModel value, $Res Function(PixChargeModel) then) =
      _$PixChargeModelCopyWithImpl<$Res, PixChargeModel>;
  @useResult
  $Res call({String qrCode, DateTime expiresAt, String status});
}

/// @nodoc
class _$PixChargeModelCopyWithImpl<$Res, $Val extends PixChargeModel>
    implements $PixChargeModelCopyWith<$Res> {
  _$PixChargeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PixChargeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qrCode = null,
    Object? expiresAt = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      qrCode: null == qrCode
          ? _value.qrCode
          : qrCode // ignore: cast_nullable_to_non_nullable
              as String,
      expiresAt: null == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PixChargeModelImplCopyWith<$Res>
    implements $PixChargeModelCopyWith<$Res> {
  factory _$$PixChargeModelImplCopyWith(_$PixChargeModelImpl value,
          $Res Function(_$PixChargeModelImpl) then) =
      __$$PixChargeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String qrCode, DateTime expiresAt, String status});
}

/// @nodoc
class __$$PixChargeModelImplCopyWithImpl<$Res>
    extends _$PixChargeModelCopyWithImpl<$Res, _$PixChargeModelImpl>
    implements _$$PixChargeModelImplCopyWith<$Res> {
  __$$PixChargeModelImplCopyWithImpl(
      _$PixChargeModelImpl _value, $Res Function(_$PixChargeModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PixChargeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qrCode = null,
    Object? expiresAt = null,
    Object? status = null,
  }) {
    return _then(_$PixChargeModelImpl(
      qrCode: null == qrCode
          ? _value.qrCode
          : qrCode // ignore: cast_nullable_to_non_nullable
              as String,
      expiresAt: null == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PixChargeModelImpl implements _PixChargeModel {
  const _$PixChargeModelImpl(
      {required this.qrCode, required this.expiresAt, required this.status});

  factory _$PixChargeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PixChargeModelImplFromJson(json);

  @override
  final String qrCode;
  @override
  final DateTime expiresAt;
  @override
  final String status;

  @override
  String toString() {
    return 'PixChargeModel(qrCode: $qrCode, expiresAt: $expiresAt, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PixChargeModelImpl &&
            (identical(other.qrCode, qrCode) || other.qrCode == qrCode) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, qrCode, expiresAt, status);

  /// Create a copy of PixChargeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PixChargeModelImplCopyWith<_$PixChargeModelImpl> get copyWith =>
      __$$PixChargeModelImplCopyWithImpl<_$PixChargeModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PixChargeModelImplToJson(
      this,
    );
  }
}

abstract class _PixChargeModel implements PixChargeModel {
  const factory _PixChargeModel(
      {required final String qrCode,
      required final DateTime expiresAt,
      required final String status}) = _$PixChargeModelImpl;

  factory _PixChargeModel.fromJson(Map<String, dynamic> json) =
      _$PixChargeModelImpl.fromJson;

  @override
  String get qrCode;
  @override
  DateTime get expiresAt;
  @override
  String get status;

  /// Create a copy of PixChargeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PixChargeModelImplCopyWith<_$PixChargeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LateFeeModel _$LateFeeModelFromJson(Map<String, dynamic> json) {
  return _LateFeeModel.fromJson(json);
}

/// @nodoc
mixin _$LateFeeModel {
  int get daysOverdue => throw _privateConstructorUsedError;
  double get lateFeeAmount => throw _privateConstructorUsedError;
  double get interestAmount => throw _privateConstructorUsedError;
  double get totalAmount => throw _privateConstructorUsedError;

  /// Serializes this LateFeeModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LateFeeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LateFeeModelCopyWith<LateFeeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LateFeeModelCopyWith<$Res> {
  factory $LateFeeModelCopyWith(
          LateFeeModel value, $Res Function(LateFeeModel) then) =
      _$LateFeeModelCopyWithImpl<$Res, LateFeeModel>;
  @useResult
  $Res call(
      {int daysOverdue,
      double lateFeeAmount,
      double interestAmount,
      double totalAmount});
}

/// @nodoc
class _$LateFeeModelCopyWithImpl<$Res, $Val extends LateFeeModel>
    implements $LateFeeModelCopyWith<$Res> {
  _$LateFeeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LateFeeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? daysOverdue = null,
    Object? lateFeeAmount = null,
    Object? interestAmount = null,
    Object? totalAmount = null,
  }) {
    return _then(_value.copyWith(
      daysOverdue: null == daysOverdue
          ? _value.daysOverdue
          : daysOverdue // ignore: cast_nullable_to_non_nullable
              as int,
      lateFeeAmount: null == lateFeeAmount
          ? _value.lateFeeAmount
          : lateFeeAmount // ignore: cast_nullable_to_non_nullable
              as double,
      interestAmount: null == interestAmount
          ? _value.interestAmount
          : interestAmount // ignore: cast_nullable_to_non_nullable
              as double,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LateFeeModelImplCopyWith<$Res>
    implements $LateFeeModelCopyWith<$Res> {
  factory _$$LateFeeModelImplCopyWith(
          _$LateFeeModelImpl value, $Res Function(_$LateFeeModelImpl) then) =
      __$$LateFeeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int daysOverdue,
      double lateFeeAmount,
      double interestAmount,
      double totalAmount});
}

/// @nodoc
class __$$LateFeeModelImplCopyWithImpl<$Res>
    extends _$LateFeeModelCopyWithImpl<$Res, _$LateFeeModelImpl>
    implements _$$LateFeeModelImplCopyWith<$Res> {
  __$$LateFeeModelImplCopyWithImpl(
      _$LateFeeModelImpl _value, $Res Function(_$LateFeeModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of LateFeeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? daysOverdue = null,
    Object? lateFeeAmount = null,
    Object? interestAmount = null,
    Object? totalAmount = null,
  }) {
    return _then(_$LateFeeModelImpl(
      daysOverdue: null == daysOverdue
          ? _value.daysOverdue
          : daysOverdue // ignore: cast_nullable_to_non_nullable
              as int,
      lateFeeAmount: null == lateFeeAmount
          ? _value.lateFeeAmount
          : lateFeeAmount // ignore: cast_nullable_to_non_nullable
              as double,
      interestAmount: null == interestAmount
          ? _value.interestAmount
          : interestAmount // ignore: cast_nullable_to_non_nullable
              as double,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LateFeeModelImpl implements _LateFeeModel {
  const _$LateFeeModelImpl(
      {required this.daysOverdue,
      required this.lateFeeAmount,
      required this.interestAmount,
      required this.totalAmount});

  factory _$LateFeeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LateFeeModelImplFromJson(json);

  @override
  final int daysOverdue;
  @override
  final double lateFeeAmount;
  @override
  final double interestAmount;
  @override
  final double totalAmount;

  @override
  String toString() {
    return 'LateFeeModel(daysOverdue: $daysOverdue, lateFeeAmount: $lateFeeAmount, interestAmount: $interestAmount, totalAmount: $totalAmount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LateFeeModelImpl &&
            (identical(other.daysOverdue, daysOverdue) ||
                other.daysOverdue == daysOverdue) &&
            (identical(other.lateFeeAmount, lateFeeAmount) ||
                other.lateFeeAmount == lateFeeAmount) &&
            (identical(other.interestAmount, interestAmount) ||
                other.interestAmount == interestAmount) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, daysOverdue, lateFeeAmount, interestAmount, totalAmount);

  /// Create a copy of LateFeeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LateFeeModelImplCopyWith<_$LateFeeModelImpl> get copyWith =>
      __$$LateFeeModelImplCopyWithImpl<_$LateFeeModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LateFeeModelImplToJson(
      this,
    );
  }
}

abstract class _LateFeeModel implements LateFeeModel {
  const factory _LateFeeModel(
      {required final int daysOverdue,
      required final double lateFeeAmount,
      required final double interestAmount,
      required final double totalAmount}) = _$LateFeeModelImpl;

  factory _LateFeeModel.fromJson(Map<String, dynamic> json) =
      _$LateFeeModelImpl.fromJson;

  @override
  int get daysOverdue;
  @override
  double get lateFeeAmount;
  @override
  double get interestAmount;
  @override
  double get totalAmount;

  /// Create a copy of LateFeeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LateFeeModelImplCopyWith<_$LateFeeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaymentRecordModel _$PaymentRecordModelFromJson(Map<String, dynamic> json) {
  return _PaymentRecordModel.fromJson(json);
}

/// @nodoc
mixin _$PaymentRecordModel {
  DateTime get paidAt => throw _privateConstructorUsedError;
  double get amountPaid => throw _privateConstructorUsedError;
  String get paymentMethod => throw _privateConstructorUsedError;

  /// Serializes this PaymentRecordModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentRecordModelCopyWith<PaymentRecordModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentRecordModelCopyWith<$Res> {
  factory $PaymentRecordModelCopyWith(
          PaymentRecordModel value, $Res Function(PaymentRecordModel) then) =
      _$PaymentRecordModelCopyWithImpl<$Res, PaymentRecordModel>;
  @useResult
  $Res call({DateTime paidAt, double amountPaid, String paymentMethod});
}

/// @nodoc
class _$PaymentRecordModelCopyWithImpl<$Res, $Val extends PaymentRecordModel>
    implements $PaymentRecordModelCopyWith<$Res> {
  _$PaymentRecordModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paidAt = null,
    Object? amountPaid = null,
    Object? paymentMethod = null,
  }) {
    return _then(_value.copyWith(
      paidAt: null == paidAt
          ? _value.paidAt
          : paidAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      amountPaid: null == amountPaid
          ? _value.amountPaid
          : amountPaid // ignore: cast_nullable_to_non_nullable
              as double,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentRecordModelImplCopyWith<$Res>
    implements $PaymentRecordModelCopyWith<$Res> {
  factory _$$PaymentRecordModelImplCopyWith(_$PaymentRecordModelImpl value,
          $Res Function(_$PaymentRecordModelImpl) then) =
      __$$PaymentRecordModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime paidAt, double amountPaid, String paymentMethod});
}

/// @nodoc
class __$$PaymentRecordModelImplCopyWithImpl<$Res>
    extends _$PaymentRecordModelCopyWithImpl<$Res, _$PaymentRecordModelImpl>
    implements _$$PaymentRecordModelImplCopyWith<$Res> {
  __$$PaymentRecordModelImplCopyWithImpl(_$PaymentRecordModelImpl _value,
      $Res Function(_$PaymentRecordModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paidAt = null,
    Object? amountPaid = null,
    Object? paymentMethod = null,
  }) {
    return _then(_$PaymentRecordModelImpl(
      paidAt: null == paidAt
          ? _value.paidAt
          : paidAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      amountPaid: null == amountPaid
          ? _value.amountPaid
          : amountPaid // ignore: cast_nullable_to_non_nullable
              as double,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentRecordModelImpl implements _PaymentRecordModel {
  const _$PaymentRecordModelImpl(
      {required this.paidAt,
      required this.amountPaid,
      required this.paymentMethod});

  factory _$PaymentRecordModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentRecordModelImplFromJson(json);

  @override
  final DateTime paidAt;
  @override
  final double amountPaid;
  @override
  final String paymentMethod;

  @override
  String toString() {
    return 'PaymentRecordModel(paidAt: $paidAt, amountPaid: $amountPaid, paymentMethod: $paymentMethod)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentRecordModelImpl &&
            (identical(other.paidAt, paidAt) || other.paidAt == paidAt) &&
            (identical(other.amountPaid, amountPaid) ||
                other.amountPaid == amountPaid) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, paidAt, amountPaid, paymentMethod);

  /// Create a copy of PaymentRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentRecordModelImplCopyWith<_$PaymentRecordModelImpl> get copyWith =>
      __$$PaymentRecordModelImplCopyWithImpl<_$PaymentRecordModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentRecordModelImplToJson(
      this,
    );
  }
}

abstract class _PaymentRecordModel implements PaymentRecordModel {
  const factory _PaymentRecordModel(
      {required final DateTime paidAt,
      required final double amountPaid,
      required final String paymentMethod}) = _$PaymentRecordModelImpl;

  factory _PaymentRecordModel.fromJson(Map<String, dynamic> json) =
      _$PaymentRecordModelImpl.fromJson;

  @override
  DateTime get paidAt;
  @override
  double get amountPaid;
  @override
  String get paymentMethod;

  /// Create a copy of PaymentRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentRecordModelImplCopyWith<_$PaymentRecordModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InvoiceModel _$InvoiceModelFromJson(Map<String, dynamic> json) {
  return _InvoiceModel.fromJson(json);
}

/// @nodoc
mixin _$InvoiceModel {
  int get id => throw _privateConstructorUsedError;
  int get rentalContractId => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get dueDate => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  PixChargeModel? get pixCharge => throw _privateConstructorUsedError;
  LateFeeModel? get lateFee => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment')
  PaymentRecordModel? get paymentRecord => throw _privateConstructorUsedError;

  /// Serializes this InvoiceModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InvoiceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InvoiceModelCopyWith<InvoiceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoiceModelCopyWith<$Res> {
  factory $InvoiceModelCopyWith(
          InvoiceModel value, $Res Function(InvoiceModel) then) =
      _$InvoiceModelCopyWithImpl<$Res, InvoiceModel>;
  @useResult
  $Res call(
      {int id,
      int rentalContractId,
      String description,
      String dueDate,
      double amount,
      String status,
      PixChargeModel? pixCharge,
      LateFeeModel? lateFee,
      @JsonKey(name: 'payment') PaymentRecordModel? paymentRecord});

  $PixChargeModelCopyWith<$Res>? get pixCharge;
  $LateFeeModelCopyWith<$Res>? get lateFee;
  $PaymentRecordModelCopyWith<$Res>? get paymentRecord;
}

/// @nodoc
class _$InvoiceModelCopyWithImpl<$Res, $Val extends InvoiceModel>
    implements $InvoiceModelCopyWith<$Res> {
  _$InvoiceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InvoiceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? rentalContractId = null,
    Object? description = null,
    Object? dueDate = null,
    Object? amount = null,
    Object? status = null,
    Object? pixCharge = freezed,
    Object? lateFee = freezed,
    Object? paymentRecord = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      pixCharge: freezed == pixCharge
          ? _value.pixCharge
          : pixCharge // ignore: cast_nullable_to_non_nullable
              as PixChargeModel?,
      lateFee: freezed == lateFee
          ? _value.lateFee
          : lateFee // ignore: cast_nullable_to_non_nullable
              as LateFeeModel?,
      paymentRecord: freezed == paymentRecord
          ? _value.paymentRecord
          : paymentRecord // ignore: cast_nullable_to_non_nullable
              as PaymentRecordModel?,
    ) as $Val);
  }

  /// Create a copy of InvoiceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PixChargeModelCopyWith<$Res>? get pixCharge {
    if (_value.pixCharge == null) {
      return null;
    }

    return $PixChargeModelCopyWith<$Res>(_value.pixCharge!, (value) {
      return _then(_value.copyWith(pixCharge: value) as $Val);
    });
  }

  /// Create a copy of InvoiceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LateFeeModelCopyWith<$Res>? get lateFee {
    if (_value.lateFee == null) {
      return null;
    }

    return $LateFeeModelCopyWith<$Res>(_value.lateFee!, (value) {
      return _then(_value.copyWith(lateFee: value) as $Val);
    });
  }

  /// Create a copy of InvoiceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaymentRecordModelCopyWith<$Res>? get paymentRecord {
    if (_value.paymentRecord == null) {
      return null;
    }

    return $PaymentRecordModelCopyWith<$Res>(_value.paymentRecord!, (value) {
      return _then(_value.copyWith(paymentRecord: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InvoiceModelImplCopyWith<$Res>
    implements $InvoiceModelCopyWith<$Res> {
  factory _$$InvoiceModelImplCopyWith(
          _$InvoiceModelImpl value, $Res Function(_$InvoiceModelImpl) then) =
      __$$InvoiceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int rentalContractId,
      String description,
      String dueDate,
      double amount,
      String status,
      PixChargeModel? pixCharge,
      LateFeeModel? lateFee,
      @JsonKey(name: 'payment') PaymentRecordModel? paymentRecord});

  @override
  $PixChargeModelCopyWith<$Res>? get pixCharge;
  @override
  $LateFeeModelCopyWith<$Res>? get lateFee;
  @override
  $PaymentRecordModelCopyWith<$Res>? get paymentRecord;
}

/// @nodoc
class __$$InvoiceModelImplCopyWithImpl<$Res>
    extends _$InvoiceModelCopyWithImpl<$Res, _$InvoiceModelImpl>
    implements _$$InvoiceModelImplCopyWith<$Res> {
  __$$InvoiceModelImplCopyWithImpl(
      _$InvoiceModelImpl _value, $Res Function(_$InvoiceModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of InvoiceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? rentalContractId = null,
    Object? description = null,
    Object? dueDate = null,
    Object? amount = null,
    Object? status = null,
    Object? pixCharge = freezed,
    Object? lateFee = freezed,
    Object? paymentRecord = freezed,
  }) {
    return _then(_$InvoiceModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      pixCharge: freezed == pixCharge
          ? _value.pixCharge
          : pixCharge // ignore: cast_nullable_to_non_nullable
              as PixChargeModel?,
      lateFee: freezed == lateFee
          ? _value.lateFee
          : lateFee // ignore: cast_nullable_to_non_nullable
              as LateFeeModel?,
      paymentRecord: freezed == paymentRecord
          ? _value.paymentRecord
          : paymentRecord // ignore: cast_nullable_to_non_nullable
              as PaymentRecordModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InvoiceModelImpl implements _InvoiceModel {
  const _$InvoiceModelImpl(
      {required this.id,
      required this.rentalContractId,
      required this.description,
      required this.dueDate,
      required this.amount,
      required this.status,
      this.pixCharge,
      this.lateFee,
      @JsonKey(name: 'payment') this.paymentRecord});

  factory _$InvoiceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvoiceModelImplFromJson(json);

  @override
  final int id;
  @override
  final int rentalContractId;
  @override
  final String description;
  @override
  final String dueDate;
  @override
  final double amount;
  @override
  final String status;
  @override
  final PixChargeModel? pixCharge;
  @override
  final LateFeeModel? lateFee;
  @override
  @JsonKey(name: 'payment')
  final PaymentRecordModel? paymentRecord;

  @override
  String toString() {
    return 'InvoiceModel(id: $id, rentalContractId: $rentalContractId, description: $description, dueDate: $dueDate, amount: $amount, status: $status, pixCharge: $pixCharge, lateFee: $lateFee, paymentRecord: $paymentRecord)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvoiceModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.rentalContractId, rentalContractId) ||
                other.rentalContractId == rentalContractId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.pixCharge, pixCharge) ||
                other.pixCharge == pixCharge) &&
            (identical(other.lateFee, lateFee) || other.lateFee == lateFee) &&
            (identical(other.paymentRecord, paymentRecord) ||
                other.paymentRecord == paymentRecord));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, rentalContractId,
      description, dueDate, amount, status, pixCharge, lateFee, paymentRecord);

  /// Create a copy of InvoiceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InvoiceModelImplCopyWith<_$InvoiceModelImpl> get copyWith =>
      __$$InvoiceModelImplCopyWithImpl<_$InvoiceModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InvoiceModelImplToJson(
      this,
    );
  }
}

abstract class _InvoiceModel implements InvoiceModel {
  const factory _InvoiceModel(
          {required final int id,
          required final int rentalContractId,
          required final String description,
          required final String dueDate,
          required final double amount,
          required final String status,
          final PixChargeModel? pixCharge,
          final LateFeeModel? lateFee,
          @JsonKey(name: 'payment') final PaymentRecordModel? paymentRecord}) =
      _$InvoiceModelImpl;

  factory _InvoiceModel.fromJson(Map<String, dynamic> json) =
      _$InvoiceModelImpl.fromJson;

  @override
  int get id;
  @override
  int get rentalContractId;
  @override
  String get description;
  @override
  String get dueDate;
  @override
  double get amount;
  @override
  String get status;
  @override
  PixChargeModel? get pixCharge;
  @override
  LateFeeModel? get lateFee;
  @override
  @JsonKey(name: 'payment')
  PaymentRecordModel? get paymentRecord;

  /// Create a copy of InvoiceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InvoiceModelImplCopyWith<_$InvoiceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
