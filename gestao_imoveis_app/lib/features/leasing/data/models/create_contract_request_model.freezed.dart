// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_contract_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateRenterRequestData _$CreateRenterRequestDataFromJson(
    Map<String, dynamic> json) {
  return _CreateRenterRequestData.fromJson(json);
}

/// @nodoc
mixin _$CreateRenterRequestData {
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'cPF')
  String get cpf => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;

  /// Serializes this CreateRenterRequestData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateRenterRequestData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateRenterRequestDataCopyWith<CreateRenterRequestData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateRenterRequestDataCopyWith<$Res> {
  factory $CreateRenterRequestDataCopyWith(CreateRenterRequestData value,
          $Res Function(CreateRenterRequestData) then) =
      _$CreateRenterRequestDataCopyWithImpl<$Res, CreateRenterRequestData>;
  @useResult
  $Res call(
      {String name, @JsonKey(name: 'cPF') String cpf, String phoneNumber});
}

/// @nodoc
class _$CreateRenterRequestDataCopyWithImpl<$Res,
        $Val extends CreateRenterRequestData>
    implements $CreateRenterRequestDataCopyWith<$Res> {
  _$CreateRenterRequestDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateRenterRequestData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? cpf = null,
    Object? phoneNumber = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      cpf: null == cpf
          ? _value.cpf
          : cpf // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateRenterRequestDataImplCopyWith<$Res>
    implements $CreateRenterRequestDataCopyWith<$Res> {
  factory _$$CreateRenterRequestDataImplCopyWith(
          _$CreateRenterRequestDataImpl value,
          $Res Function(_$CreateRenterRequestDataImpl) then) =
      __$$CreateRenterRequestDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name, @JsonKey(name: 'cPF') String cpf, String phoneNumber});
}

/// @nodoc
class __$$CreateRenterRequestDataImplCopyWithImpl<$Res>
    extends _$CreateRenterRequestDataCopyWithImpl<$Res,
        _$CreateRenterRequestDataImpl>
    implements _$$CreateRenterRequestDataImplCopyWith<$Res> {
  __$$CreateRenterRequestDataImplCopyWithImpl(
      _$CreateRenterRequestDataImpl _value,
      $Res Function(_$CreateRenterRequestDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateRenterRequestData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? cpf = null,
    Object? phoneNumber = null,
  }) {
    return _then(_$CreateRenterRequestDataImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      cpf: null == cpf
          ? _value.cpf
          : cpf // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateRenterRequestDataImpl implements _CreateRenterRequestData {
  const _$CreateRenterRequestDataImpl(
      {required this.name,
      @JsonKey(name: 'cPF') required this.cpf,
      required this.phoneNumber});

  factory _$CreateRenterRequestDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateRenterRequestDataImplFromJson(json);

  @override
  final String name;
  @override
  @JsonKey(name: 'cPF')
  final String cpf;
  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'CreateRenterRequestData(name: $name, cpf: $cpf, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateRenterRequestDataImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.cpf, cpf) || other.cpf == cpf) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, cpf, phoneNumber);

  /// Create a copy of CreateRenterRequestData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateRenterRequestDataImplCopyWith<_$CreateRenterRequestDataImpl>
      get copyWith => __$$CreateRenterRequestDataImplCopyWithImpl<
          _$CreateRenterRequestDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateRenterRequestDataImplToJson(
      this,
    );
  }
}

abstract class _CreateRenterRequestData implements CreateRenterRequestData {
  const factory _CreateRenterRequestData(
      {required final String name,
      @JsonKey(name: 'cPF') required final String cpf,
      required final String phoneNumber}) = _$CreateRenterRequestDataImpl;

  factory _CreateRenterRequestData.fromJson(Map<String, dynamic> json) =
      _$CreateRenterRequestDataImpl.fromJson;

  @override
  String get name;
  @override
  @JsonKey(name: 'cPF')
  String get cpf;
  @override
  String get phoneNumber;

  /// Create a copy of CreateRenterRequestData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateRenterRequestDataImplCopyWith<_$CreateRenterRequestDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CreateContractAddressData _$CreateContractAddressDataFromJson(
    Map<String, dynamic> json) {
  return _CreateContractAddressData.fromJson(json);
}

/// @nodoc
mixin _$CreateContractAddressData {
  String get street => throw _privateConstructorUsedError;
  String get number => throw _privateConstructorUsedError;
  String? get complement => throw _privateConstructorUsedError;
  String get neighborhood => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get state => throw _privateConstructorUsedError;
  String get zipCode => throw _privateConstructorUsedError;

  /// Serializes this CreateContractAddressData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateContractAddressData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateContractAddressDataCopyWith<CreateContractAddressData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateContractAddressDataCopyWith<$Res> {
  factory $CreateContractAddressDataCopyWith(CreateContractAddressData value,
          $Res Function(CreateContractAddressData) then) =
      _$CreateContractAddressDataCopyWithImpl<$Res, CreateContractAddressData>;
  @useResult
  $Res call(
      {String street,
      String number,
      String? complement,
      String neighborhood,
      String city,
      String state,
      String zipCode});
}

/// @nodoc
class _$CreateContractAddressDataCopyWithImpl<$Res,
        $Val extends CreateContractAddressData>
    implements $CreateContractAddressDataCopyWith<$Res> {
  _$CreateContractAddressDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateContractAddressData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? street = null,
    Object? number = null,
    Object? complement = freezed,
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
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      complement: freezed == complement
          ? _value.complement
          : complement // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$CreateContractAddressDataImplCopyWith<$Res>
    implements $CreateContractAddressDataCopyWith<$Res> {
  factory _$$CreateContractAddressDataImplCopyWith(
          _$CreateContractAddressDataImpl value,
          $Res Function(_$CreateContractAddressDataImpl) then) =
      __$$CreateContractAddressDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String street,
      String number,
      String? complement,
      String neighborhood,
      String city,
      String state,
      String zipCode});
}

/// @nodoc
class __$$CreateContractAddressDataImplCopyWithImpl<$Res>
    extends _$CreateContractAddressDataCopyWithImpl<$Res,
        _$CreateContractAddressDataImpl>
    implements _$$CreateContractAddressDataImplCopyWith<$Res> {
  __$$CreateContractAddressDataImplCopyWithImpl(
      _$CreateContractAddressDataImpl _value,
      $Res Function(_$CreateContractAddressDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateContractAddressData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? street = null,
    Object? number = null,
    Object? complement = freezed,
    Object? neighborhood = null,
    Object? city = null,
    Object? state = null,
    Object? zipCode = null,
  }) {
    return _then(_$CreateContractAddressDataImpl(
      street: null == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      complement: freezed == complement
          ? _value.complement
          : complement // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$CreateContractAddressDataImpl implements _CreateContractAddressData {
  const _$CreateContractAddressDataImpl(
      {required this.street,
      required this.number,
      this.complement,
      required this.neighborhood,
      required this.city,
      required this.state,
      required this.zipCode});

  factory _$CreateContractAddressDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateContractAddressDataImplFromJson(json);

  @override
  final String street;
  @override
  final String number;
  @override
  final String? complement;
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
    return 'CreateContractAddressData(street: $street, number: $number, complement: $complement, neighborhood: $neighborhood, city: $city, state: $state, zipCode: $zipCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateContractAddressDataImpl &&
            (identical(other.street, street) || other.street == street) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.complement, complement) ||
                other.complement == complement) &&
            (identical(other.neighborhood, neighborhood) ||
                other.neighborhood == neighborhood) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.zipCode, zipCode) || other.zipCode == zipCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, street, number, complement,
      neighborhood, city, state, zipCode);

  /// Create a copy of CreateContractAddressData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateContractAddressDataImplCopyWith<_$CreateContractAddressDataImpl>
      get copyWith => __$$CreateContractAddressDataImplCopyWithImpl<
          _$CreateContractAddressDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateContractAddressDataImplToJson(
      this,
    );
  }
}

abstract class _CreateContractAddressData implements CreateContractAddressData {
  const factory _CreateContractAddressData(
      {required final String street,
      required final String number,
      final String? complement,
      required final String neighborhood,
      required final String city,
      required final String state,
      required final String zipCode}) = _$CreateContractAddressDataImpl;

  factory _CreateContractAddressData.fromJson(Map<String, dynamic> json) =
      _$CreateContractAddressDataImpl.fromJson;

  @override
  String get street;
  @override
  String get number;
  @override
  String? get complement;
  @override
  String get neighborhood;
  @override
  String get city;
  @override
  String get state;
  @override
  String get zipCode;

  /// Create a copy of CreateContractAddressData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateContractAddressDataImplCopyWith<_$CreateContractAddressDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CreateContractRequestModel _$CreateContractRequestModelFromJson(
    Map<String, dynamic> json) {
  return _CreateContractRequestModel.fromJson(json);
}

/// @nodoc
mixin _$CreateContractRequestModel {
  CreateRenterRequestData get renter => throw _privateConstructorUsedError;
  @JsonKey(name: 'adress')
  CreateContractAddressData get address => throw _privateConstructorUsedError;
  DateTime get startContract => throw _privateConstructorUsedError;
  DateTime get endContract => throw _privateConstructorUsedError;
  double get rentalValue => throw _privateConstructorUsedError;
  String get preferredIndex => throw _privateConstructorUsedError;

  /// Serializes this CreateContractRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateContractRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateContractRequestModelCopyWith<CreateContractRequestModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateContractRequestModelCopyWith<$Res> {
  factory $CreateContractRequestModelCopyWith(CreateContractRequestModel value,
          $Res Function(CreateContractRequestModel) then) =
      _$CreateContractRequestModelCopyWithImpl<$Res,
          CreateContractRequestModel>;
  @useResult
  $Res call(
      {CreateRenterRequestData renter,
      @JsonKey(name: 'adress') CreateContractAddressData address,
      DateTime startContract,
      DateTime endContract,
      double rentalValue,
      String preferredIndex});

  $CreateRenterRequestDataCopyWith<$Res> get renter;
  $CreateContractAddressDataCopyWith<$Res> get address;
}

/// @nodoc
class _$CreateContractRequestModelCopyWithImpl<$Res,
        $Val extends CreateContractRequestModel>
    implements $CreateContractRequestModelCopyWith<$Res> {
  _$CreateContractRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateContractRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? renter = null,
    Object? address = null,
    Object? startContract = null,
    Object? endContract = null,
    Object? rentalValue = null,
    Object? preferredIndex = null,
  }) {
    return _then(_value.copyWith(
      renter: null == renter
          ? _value.renter
          : renter // ignore: cast_nullable_to_non_nullable
              as CreateRenterRequestData,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as CreateContractAddressData,
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
    ) as $Val);
  }

  /// Create a copy of CreateContractRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CreateRenterRequestDataCopyWith<$Res> get renter {
    return $CreateRenterRequestDataCopyWith<$Res>(_value.renter, (value) {
      return _then(_value.copyWith(renter: value) as $Val);
    });
  }

  /// Create a copy of CreateContractRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CreateContractAddressDataCopyWith<$Res> get address {
    return $CreateContractAddressDataCopyWith<$Res>(_value.address, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CreateContractRequestModelImplCopyWith<$Res>
    implements $CreateContractRequestModelCopyWith<$Res> {
  factory _$$CreateContractRequestModelImplCopyWith(
          _$CreateContractRequestModelImpl value,
          $Res Function(_$CreateContractRequestModelImpl) then) =
      __$$CreateContractRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CreateRenterRequestData renter,
      @JsonKey(name: 'adress') CreateContractAddressData address,
      DateTime startContract,
      DateTime endContract,
      double rentalValue,
      String preferredIndex});

  @override
  $CreateRenterRequestDataCopyWith<$Res> get renter;
  @override
  $CreateContractAddressDataCopyWith<$Res> get address;
}

/// @nodoc
class __$$CreateContractRequestModelImplCopyWithImpl<$Res>
    extends _$CreateContractRequestModelCopyWithImpl<$Res,
        _$CreateContractRequestModelImpl>
    implements _$$CreateContractRequestModelImplCopyWith<$Res> {
  __$$CreateContractRequestModelImplCopyWithImpl(
      _$CreateContractRequestModelImpl _value,
      $Res Function(_$CreateContractRequestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateContractRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? renter = null,
    Object? address = null,
    Object? startContract = null,
    Object? endContract = null,
    Object? rentalValue = null,
    Object? preferredIndex = null,
  }) {
    return _then(_$CreateContractRequestModelImpl(
      renter: null == renter
          ? _value.renter
          : renter // ignore: cast_nullable_to_non_nullable
              as CreateRenterRequestData,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as CreateContractAddressData,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateContractRequestModelImpl implements _CreateContractRequestModel {
  const _$CreateContractRequestModelImpl(
      {required this.renter,
      @JsonKey(name: 'adress') required this.address,
      required this.startContract,
      required this.endContract,
      required this.rentalValue,
      this.preferredIndex = 'IPCA'});

  factory _$CreateContractRequestModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$CreateContractRequestModelImplFromJson(json);

  @override
  final CreateRenterRequestData renter;
  @override
  @JsonKey(name: 'adress')
  final CreateContractAddressData address;
  @override
  final DateTime startContract;
  @override
  final DateTime endContract;
  @override
  final double rentalValue;
  @override
  @JsonKey()
  final String preferredIndex;

  @override
  String toString() {
    return 'CreateContractRequestModel(renter: $renter, address: $address, startContract: $startContract, endContract: $endContract, rentalValue: $rentalValue, preferredIndex: $preferredIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateContractRequestModelImpl &&
            (identical(other.renter, renter) || other.renter == renter) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.startContract, startContract) ||
                other.startContract == startContract) &&
            (identical(other.endContract, endContract) ||
                other.endContract == endContract) &&
            (identical(other.rentalValue, rentalValue) ||
                other.rentalValue == rentalValue) &&
            (identical(other.preferredIndex, preferredIndex) ||
                other.preferredIndex == preferredIndex));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, renter, address, startContract,
      endContract, rentalValue, preferredIndex);

  /// Create a copy of CreateContractRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateContractRequestModelImplCopyWith<_$CreateContractRequestModelImpl>
      get copyWith => __$$CreateContractRequestModelImplCopyWithImpl<
          _$CreateContractRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateContractRequestModelImplToJson(
      this,
    );
  }
}

abstract class _CreateContractRequestModel
    implements CreateContractRequestModel {
  const factory _CreateContractRequestModel(
      {required final CreateRenterRequestData renter,
      @JsonKey(name: 'adress') required final CreateContractAddressData address,
      required final DateTime startContract,
      required final DateTime endContract,
      required final double rentalValue,
      final String preferredIndex}) = _$CreateContractRequestModelImpl;

  factory _CreateContractRequestModel.fromJson(Map<String, dynamic> json) =
      _$CreateContractRequestModelImpl.fromJson;

  @override
  CreateRenterRequestData get renter;
  @override
  @JsonKey(name: 'adress')
  CreateContractAddressData get address;
  @override
  DateTime get startContract;
  @override
  DateTime get endContract;
  @override
  double get rentalValue;
  @override
  String get preferredIndex;

  /// Create a copy of CreateContractRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateContractRequestModelImplCopyWith<_$CreateContractRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
