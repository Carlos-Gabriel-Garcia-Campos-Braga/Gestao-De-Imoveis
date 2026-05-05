// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_property_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreatePropertyRequestModel _$CreatePropertyRequestModelFromJson(
    Map<String, dynamic> json) {
  return _CreatePropertyRequestModel.fromJson(json);
}

/// @nodoc
mixin _$CreatePropertyRequestModel {
  String get description => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get zipCode => throw _privateConstructorUsedError;
  String? get number => throw _privateConstructorUsedError;
  String? get complement => throw _privateConstructorUsedError;

  /// Serializes this CreatePropertyRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreatePropertyRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreatePropertyRequestModelCopyWith<CreatePropertyRequestModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatePropertyRequestModelCopyWith<$Res> {
  factory $CreatePropertyRequestModelCopyWith(CreatePropertyRequestModel value,
          $Res Function(CreatePropertyRequestModel) then) =
      _$CreatePropertyRequestModelCopyWithImpl<$Res,
          CreatePropertyRequestModel>;
  @useResult
  $Res call(
      {String description,
      String type,
      String zipCode,
      String? number,
      String? complement});
}

/// @nodoc
class _$CreatePropertyRequestModelCopyWithImpl<$Res,
        $Val extends CreatePropertyRequestModel>
    implements $CreatePropertyRequestModelCopyWith<$Res> {
  _$CreatePropertyRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreatePropertyRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? type = null,
    Object? zipCode = null,
    Object? number = freezed,
    Object? complement = freezed,
  }) {
    return _then(_value.copyWith(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      zipCode: null == zipCode
          ? _value.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as String,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String?,
      complement: freezed == complement
          ? _value.complement
          : complement // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreatePropertyRequestModelImplCopyWith<$Res>
    implements $CreatePropertyRequestModelCopyWith<$Res> {
  factory _$$CreatePropertyRequestModelImplCopyWith(
          _$CreatePropertyRequestModelImpl value,
          $Res Function(_$CreatePropertyRequestModelImpl) then) =
      __$$CreatePropertyRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String description,
      String type,
      String zipCode,
      String? number,
      String? complement});
}

/// @nodoc
class __$$CreatePropertyRequestModelImplCopyWithImpl<$Res>
    extends _$CreatePropertyRequestModelCopyWithImpl<$Res,
        _$CreatePropertyRequestModelImpl>
    implements _$$CreatePropertyRequestModelImplCopyWith<$Res> {
  __$$CreatePropertyRequestModelImplCopyWithImpl(
      _$CreatePropertyRequestModelImpl _value,
      $Res Function(_$CreatePropertyRequestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreatePropertyRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? type = null,
    Object? zipCode = null,
    Object? number = freezed,
    Object? complement = freezed,
  }) {
    return _then(_$CreatePropertyRequestModelImpl(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      zipCode: null == zipCode
          ? _value.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as String,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String?,
      complement: freezed == complement
          ? _value.complement
          : complement // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreatePropertyRequestModelImpl implements _CreatePropertyRequestModel {
  const _$CreatePropertyRequestModelImpl(
      {required this.description,
      required this.type,
      required this.zipCode,
      this.number,
      this.complement});

  factory _$CreatePropertyRequestModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$CreatePropertyRequestModelImplFromJson(json);

  @override
  final String description;
  @override
  final String type;
  @override
  final String zipCode;
  @override
  final String? number;
  @override
  final String? complement;

  @override
  String toString() {
    return 'CreatePropertyRequestModel(description: $description, type: $type, zipCode: $zipCode, number: $number, complement: $complement)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatePropertyRequestModelImpl &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.zipCode, zipCode) || other.zipCode == zipCode) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.complement, complement) ||
                other.complement == complement));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, description, type, zipCode, number, complement);

  /// Create a copy of CreatePropertyRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreatePropertyRequestModelImplCopyWith<_$CreatePropertyRequestModelImpl>
      get copyWith => __$$CreatePropertyRequestModelImplCopyWithImpl<
          _$CreatePropertyRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreatePropertyRequestModelImplToJson(
      this,
    );
  }
}

abstract class _CreatePropertyRequestModel
    implements CreatePropertyRequestModel {
  const factory _CreatePropertyRequestModel(
      {required final String description,
      required final String type,
      required final String zipCode,
      final String? number,
      final String? complement}) = _$CreatePropertyRequestModelImpl;

  factory _CreatePropertyRequestModel.fromJson(Map<String, dynamic> json) =
      _$CreatePropertyRequestModelImpl.fromJson;

  @override
  String get description;
  @override
  String get type;
  @override
  String get zipCode;
  @override
  String? get number;
  @override
  String? get complement;

  /// Create a copy of CreatePropertyRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreatePropertyRequestModelImplCopyWith<_$CreatePropertyRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
