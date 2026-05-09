// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rental_contract_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ContractAddressModel _$ContractAddressModelFromJson(Map<String, dynamic> json) {
  return _ContractAddressModel.fromJson(json);
}

/// @nodoc
mixin _$ContractAddressModel {
  String get street => throw _privateConstructorUsedError;
  String? get complement => throw _privateConstructorUsedError;
  String get number => throw _privateConstructorUsedError;
  String get neighborhood => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get state => throw _privateConstructorUsedError;
  String get zipCode => throw _privateConstructorUsedError;

  /// Serializes this ContractAddressModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ContractAddressModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContractAddressModelCopyWith<ContractAddressModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContractAddressModelCopyWith<$Res> {
  factory $ContractAddressModelCopyWith(ContractAddressModel value,
          $Res Function(ContractAddressModel) then) =
      _$ContractAddressModelCopyWithImpl<$Res, ContractAddressModel>;
  @useResult
  $Res call(
      {String street,
      String? complement,
      String number,
      String neighborhood,
      String city,
      String state,
      String zipCode});
}

/// @nodoc
class _$ContractAddressModelCopyWithImpl<$Res,
        $Val extends ContractAddressModel>
    implements $ContractAddressModelCopyWith<$Res> {
  _$ContractAddressModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ContractAddressModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? street = null,
    Object? complement = freezed,
    Object? number = null,
    Object? neighborhood = null,
    Object? city = null,
    Object? state = null,
    Object? zipCode = null,
  }) {
    return _then(_value.copyWith(
      street: null == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String,
      complement: freezed == complement
          ? _value.complement
          : complement // ignore: cast_nullable_to_non_nullable
              as String?,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      neighborhood: null == neighborhood
          ? _value.neighborhood
          : neighborhood // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      zipCode: null == zipCode
          ? _value.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContractAddressModelImplCopyWith<$Res>
    implements $ContractAddressModelCopyWith<$Res> {
  factory _$$ContractAddressModelImplCopyWith(_$ContractAddressModelImpl value,
          $Res Function(_$ContractAddressModelImpl) then) =
      __$$ContractAddressModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String street,
      String? complement,
      String number,
      String neighborhood,
      String city,
      String state,
      String zipCode});
}

/// @nodoc
class __$$ContractAddressModelImplCopyWithImpl<$Res>
    extends _$ContractAddressModelCopyWithImpl<$Res, _$ContractAddressModelImpl>
    implements _$$ContractAddressModelImplCopyWith<$Res> {
  __$$ContractAddressModelImplCopyWithImpl(_$ContractAddressModelImpl _value,
      $Res Function(_$ContractAddressModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ContractAddressModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? street = null,
    Object? complement = freezed,
    Object? number = null,
    Object? neighborhood = null,
    Object? city = null,
    Object? state = null,
    Object? zipCode = null,
  }) {
    return _then(_$ContractAddressModelImpl(
      street: null == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String,
      complement: freezed == complement
          ? _value.complement
          : complement // ignore: cast_nullable_to_non_nullable
              as String?,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      neighborhood: null == neighborhood
          ? _value.neighborhood
          : neighborhood // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      zipCode: null == zipCode
          ? _value.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContractAddressModelImpl implements _ContractAddressModel {
  const _$ContractAddressModelImpl(
      {required this.street,
      this.complement,
      required this.number,
      required this.neighborhood,
      required this.city,
      required this.state,
      required this.zipCode});

  factory _$ContractAddressModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContractAddressModelImplFromJson(json);

  @override
  final String street;
  @override
  final String? complement;
  @override
  final String number;
  @override
  final String neighborhood;
  @override
  final String city;
  @override
  final String state;
  @override
  final String zipCode;

  @override
  String toString() {
    return 'ContractAddressModel(street: $street, complement: $complement, number: $number, neighborhood: $neighborhood, city: $city, state: $state, zipCode: $zipCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContractAddressModelImpl &&
            (identical(other.street, street) || other.street == street) &&
            (identical(other.complement, complement) ||
                other.complement == complement) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.neighborhood, neighborhood) ||
                other.neighborhood == neighborhood) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.zipCode, zipCode) || other.zipCode == zipCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, street, complement, number,
      neighborhood, city, state, zipCode);

  /// Create a copy of ContractAddressModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContractAddressModelImplCopyWith<_$ContractAddressModelImpl>
      get copyWith =>
          __$$ContractAddressModelImplCopyWithImpl<_$ContractAddressModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContractAddressModelImplToJson(
      this,
    );
  }
}

abstract class _ContractAddressModel implements ContractAddressModel {
  const factory _ContractAddressModel(
      {required final String street,
      final String? complement,
      required final String number,
      required final String neighborhood,
      required final String city,
      required final String state,
      required final String zipCode}) = _$ContractAddressModelImpl;

  factory _ContractAddressModel.fromJson(Map<String, dynamic> json) =
      _$ContractAddressModelImpl.fromJson;

  @override
  String get street;
  @override
  String? get complement;
  @override
  String get number;
  @override
  String get neighborhood;
  @override
  String get city;
  @override
  String get state;
  @override
  String get zipCode;

  /// Create a copy of ContractAddressModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContractAddressModelImplCopyWith<_$ContractAddressModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

RentalContractModel _$RentalContractModelFromJson(Map<String, dynamic> json) {
  return _RentalContractModel.fromJson(json);
}

/// @nodoc
mixin _$RentalContractModel {
  int get id => throw _privateConstructorUsedError;
  RenterModel get renter => throw _privateConstructorUsedError;
  @JsonKey(name: 'adress')
  ContractAddressModel get address => throw _privateConstructorUsedError;
  List<RentBillModel> get bills => throw _privateConstructorUsedError;
  DateTime get startContract => throw _privateConstructorUsedError;
  DateTime get endContract => throw _privateConstructorUsedError;
  double get rentalValue => throw _privateConstructorUsedError;
  String get preferredIndex => throw _privateConstructorUsedError;
  List<ReadjustmentRecordModel> get readjustmentHistory =>
      throw _privateConstructorUsedError;
  DateTime? get terminatedAt => throw _privateConstructorUsedError;
  String? get terminatedBy => throw _privateConstructorUsedError;

  /// Serializes this RentalContractModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RentalContractModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RentalContractModelCopyWith<RentalContractModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RentalContractModelCopyWith<$Res> {
  factory $RentalContractModelCopyWith(
          RentalContractModel value, $Res Function(RentalContractModel) then) =
      _$RentalContractModelCopyWithImpl<$Res, RentalContractModel>;
  @useResult
  $Res call(
      {int id,
      RenterModel renter,
      @JsonKey(name: 'adress') ContractAddressModel address,
      List<RentBillModel> bills,
      DateTime startContract,
      DateTime endContract,
      double rentalValue,
      String preferredIndex,
      List<ReadjustmentRecordModel> readjustmentHistory,
      DateTime? terminatedAt,
      String? terminatedBy});

  $RenterModelCopyWith<$Res> get renter;
  $ContractAddressModelCopyWith<$Res> get address;
}

/// @nodoc
class _$RentalContractModelCopyWithImpl<$Res, $Val extends RentalContractModel>
    implements $RentalContractModelCopyWith<$Res> {
  _$RentalContractModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RentalContractModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? renter = null,
    Object? address = null,
    Object? bills = null,
    Object? startContract = null,
    Object? endContract = null,
    Object? rentalValue = null,
    Object? preferredIndex = null,
    Object? readjustmentHistory = null,
    Object? terminatedAt = freezed,
    Object? terminatedBy = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      renter: null == renter
          ? _value.renter
          : renter // ignore: cast_nullable_to_non_nullable
              as RenterModel,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as ContractAddressModel,
      bills: null == bills
          ? _value.bills
          : bills // ignore: cast_nullable_to_non_nullable
              as List<RentBillModel>,
      startContract: null == startContract
          ? _value.startContract
          : startContract // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endContract: null == endContract
          ? _value.endContract
          : endContract // ignore: cast_nullable_to_non_nullable
              as DateTime,
      rentalValue: null == rentalValue
          ? _value.rentalValue
          : rentalValue // ignore: cast_nullable_to_non_nullable
              as double,
      preferredIndex: null == preferredIndex
          ? _value.preferredIndex
          : preferredIndex // ignore: cast_nullable_to_non_nullable
              as String,
      readjustmentHistory: null == readjustmentHistory
          ? _value.readjustmentHistory
          : readjustmentHistory // ignore: cast_nullable_to_non_nullable
              as List<ReadjustmentRecordModel>,
      terminatedAt: freezed == terminatedAt
          ? _value.terminatedAt
          : terminatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      terminatedBy: freezed == terminatedBy
          ? _value.terminatedBy
          : terminatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of RentalContractModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RenterModelCopyWith<$Res> get renter {
    return $RenterModelCopyWith<$Res>(_value.renter, (value) {
      return _then(_value.copyWith(renter: value) as $Val);
    });
  }

  /// Create a copy of RentalContractModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ContractAddressModelCopyWith<$Res> get address {
    return $ContractAddressModelCopyWith<$Res>(_value.address, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RentalContractModelImplCopyWith<$Res>
    implements $RentalContractModelCopyWith<$Res> {
  factory _$$RentalContractModelImplCopyWith(_$RentalContractModelImpl value,
          $Res Function(_$RentalContractModelImpl) then) =
      __$$RentalContractModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      RenterModel renter,
      @JsonKey(name: 'adress') ContractAddressModel address,
      List<RentBillModel> bills,
      DateTime startContract,
      DateTime endContract,
      double rentalValue,
      String preferredIndex,
      List<ReadjustmentRecordModel> readjustmentHistory,
      DateTime? terminatedAt,
      String? terminatedBy});

  @override
  $RenterModelCopyWith<$Res> get renter;
  @override
  $ContractAddressModelCopyWith<$Res> get address;
}

/// @nodoc
class __$$RentalContractModelImplCopyWithImpl<$Res>
    extends _$RentalContractModelCopyWithImpl<$Res, _$RentalContractModelImpl>
    implements _$$RentalContractModelImplCopyWith<$Res> {
  __$$RentalContractModelImplCopyWithImpl(_$RentalContractModelImpl _value,
      $Res Function(_$RentalContractModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of RentalContractModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? renter = null,
    Object? address = null,
    Object? bills = null,
    Object? startContract = null,
    Object? endContract = null,
    Object? rentalValue = null,
    Object? preferredIndex = null,
    Object? readjustmentHistory = null,
    Object? terminatedAt = freezed,
    Object? terminatedBy = freezed,
  }) {
    return _then(_$RentalContractModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      renter: null == renter
          ? _value.renter
          : renter // ignore: cast_nullable_to_non_nullable
              as RenterModel,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as ContractAddressModel,
      bills: null == bills
          ? _value._bills
          : bills // ignore: cast_nullable_to_non_nullable
              as List<RentBillModel>,
      startContract: null == startContract
          ? _value.startContract
          : startContract // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endContract: null == endContract
          ? _value.endContract
          : endContract // ignore: cast_nullable_to_non_nullable
              as DateTime,
      rentalValue: null == rentalValue
          ? _value.rentalValue
          : rentalValue // ignore: cast_nullable_to_non_nullable
              as double,
      preferredIndex: null == preferredIndex
          ? _value.preferredIndex
          : preferredIndex // ignore: cast_nullable_to_non_nullable
              as String,
      readjustmentHistory: null == readjustmentHistory
          ? _value._readjustmentHistory
          : readjustmentHistory // ignore: cast_nullable_to_non_nullable
              as List<ReadjustmentRecordModel>,
      terminatedAt: freezed == terminatedAt
          ? _value.terminatedAt
          : terminatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      terminatedBy: freezed == terminatedBy
          ? _value.terminatedBy
          : terminatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RentalContractModelImpl implements _RentalContractModel {
  const _$RentalContractModelImpl(
      {required this.id,
      required this.renter,
      @JsonKey(name: 'adress') required this.address,
      required final List<RentBillModel> bills,
      required this.startContract,
      required this.endContract,
      required this.rentalValue,
      required this.preferredIndex,
      required final List<ReadjustmentRecordModel> readjustmentHistory,
      this.terminatedAt,
      this.terminatedBy})
      : _bills = bills,
        _readjustmentHistory = readjustmentHistory;

  factory _$RentalContractModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RentalContractModelImplFromJson(json);

  @override
  final int id;
  @override
  final RenterModel renter;
  @override
  @JsonKey(name: 'adress')
  final ContractAddressModel address;
  final List<RentBillModel> _bills;
  @override
  List<RentBillModel> get bills {
    if (_bills is EqualUnmodifiableListView) return _bills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bills);
  }

  @override
  final DateTime startContract;
  @override
  final DateTime endContract;
  @override
  final double rentalValue;
  @override
  final String preferredIndex;
  final List<ReadjustmentRecordModel> _readjustmentHistory;
  @override
  List<ReadjustmentRecordModel> get readjustmentHistory {
    if (_readjustmentHistory is EqualUnmodifiableListView)
      return _readjustmentHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_readjustmentHistory);
  }

  @override
  final DateTime? terminatedAt;
  @override
  final String? terminatedBy;

  @override
  String toString() {
    return 'RentalContractModel(id: $id, renter: $renter, address: $address, bills: $bills, startContract: $startContract, endContract: $endContract, rentalValue: $rentalValue, preferredIndex: $preferredIndex, readjustmentHistory: $readjustmentHistory, terminatedAt: $terminatedAt, terminatedBy: $terminatedBy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RentalContractModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.renter, renter) || other.renter == renter) &&
            (identical(other.address, address) || other.address == address) &&
            const DeepCollectionEquality().equals(other._bills, _bills) &&
            (identical(other.startContract, startContract) ||
                other.startContract == startContract) &&
            (identical(other.endContract, endContract) ||
                other.endContract == endContract) &&
            (identical(other.rentalValue, rentalValue) ||
                other.rentalValue == rentalValue) &&
            (identical(other.preferredIndex, preferredIndex) ||
                other.preferredIndex == preferredIndex) &&
            const DeepCollectionEquality()
                .equals(other._readjustmentHistory, _readjustmentHistory) &&
            (identical(other.terminatedAt, terminatedAt) ||
                other.terminatedAt == terminatedAt) &&
            (identical(other.terminatedBy, terminatedBy) ||
                other.terminatedBy == terminatedBy));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      renter,
      address,
      const DeepCollectionEquality().hash(_bills),
      startContract,
      endContract,
      rentalValue,
      preferredIndex,
      const DeepCollectionEquality().hash(_readjustmentHistory),
      terminatedAt,
      terminatedBy);

  /// Create a copy of RentalContractModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RentalContractModelImplCopyWith<_$RentalContractModelImpl> get copyWith =>
      __$$RentalContractModelImplCopyWithImpl<_$RentalContractModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RentalContractModelImplToJson(
      this,
    );
  }
}

abstract class _RentalContractModel implements RentalContractModel {
  const factory _RentalContractModel(
      {required final int id,
      required final RenterModel renter,
      @JsonKey(name: 'adress') required final ContractAddressModel address,
      required final List<RentBillModel> bills,
      required final DateTime startContract,
      required final DateTime endContract,
      required final double rentalValue,
      required final String preferredIndex,
      required final List<ReadjustmentRecordModel> readjustmentHistory,
      final DateTime? terminatedAt,
      final String? terminatedBy}) = _$RentalContractModelImpl;

  factory _RentalContractModel.fromJson(Map<String, dynamic> json) =
      _$RentalContractModelImpl.fromJson;

  @override
  int get id;
  @override
  RenterModel get renter;
  @override
  @JsonKey(name: 'adress')
  ContractAddressModel get address;
  @override
  List<RentBillModel> get bills;
  @override
  DateTime get startContract;
  @override
  DateTime get endContract;
  @override
  double get rentalValue;
  @override
  String get preferredIndex;
  @override
  List<ReadjustmentRecordModel> get readjustmentHistory;
  @override
  DateTime? get terminatedAt;
  @override
  String? get terminatedBy;

  /// Create a copy of RentalContractModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RentalContractModelImplCopyWith<_$RentalContractModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
