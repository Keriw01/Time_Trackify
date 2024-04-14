// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qr_codes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QrCodes _$QrCodesFromJson(Map<String, dynamic> json) {
  return _QrCodes.fromJson(json);
}

/// @nodoc
mixin _$QrCodes {
  String get description => throw _privateConstructorUsedError;
  String get gate => throw _privateConstructorUsedError;
  String get qrCode => throw _privateConstructorUsedError;
  String get sector => throw _privateConstructorUsedError;
  String? get workstation => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QrCodesCopyWith<QrCodes> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QrCodesCopyWith<$Res> {
  factory $QrCodesCopyWith(QrCodes value, $Res Function(QrCodes) then) =
      _$QrCodesCopyWithImpl<$Res, QrCodes>;
  @useResult
  $Res call(
      {String description,
      String gate,
      String qrCode,
      String sector,
      String? workstation,
      String status});
}

/// @nodoc
class _$QrCodesCopyWithImpl<$Res, $Val extends QrCodes>
    implements $QrCodesCopyWith<$Res> {
  _$QrCodesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? gate = null,
    Object? qrCode = null,
    Object? sector = null,
    Object? workstation = freezed,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      gate: null == gate
          ? _value.gate
          : gate // ignore: cast_nullable_to_non_nullable
              as String,
      qrCode: null == qrCode
          ? _value.qrCode
          : qrCode // ignore: cast_nullable_to_non_nullable
              as String,
      sector: null == sector
          ? _value.sector
          : sector // ignore: cast_nullable_to_non_nullable
              as String,
      workstation: freezed == workstation
          ? _value.workstation
          : workstation // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QrCodesImplCopyWith<$Res> implements $QrCodesCopyWith<$Res> {
  factory _$$QrCodesImplCopyWith(
          _$QrCodesImpl value, $Res Function(_$QrCodesImpl) then) =
      __$$QrCodesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String description,
      String gate,
      String qrCode,
      String sector,
      String? workstation,
      String status});
}

/// @nodoc
class __$$QrCodesImplCopyWithImpl<$Res>
    extends _$QrCodesCopyWithImpl<$Res, _$QrCodesImpl>
    implements _$$QrCodesImplCopyWith<$Res> {
  __$$QrCodesImplCopyWithImpl(
      _$QrCodesImpl _value, $Res Function(_$QrCodesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? gate = null,
    Object? qrCode = null,
    Object? sector = null,
    Object? workstation = freezed,
    Object? status = null,
  }) {
    return _then(_$QrCodesImpl(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      gate: null == gate
          ? _value.gate
          : gate // ignore: cast_nullable_to_non_nullable
              as String,
      qrCode: null == qrCode
          ? _value.qrCode
          : qrCode // ignore: cast_nullable_to_non_nullable
              as String,
      sector: null == sector
          ? _value.sector
          : sector // ignore: cast_nullable_to_non_nullable
              as String,
      workstation: freezed == workstation
          ? _value.workstation
          : workstation // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QrCodesImpl implements _QrCodes {
  const _$QrCodesImpl(
      {required this.description,
      required this.gate,
      required this.qrCode,
      required this.sector,
      required this.workstation,
      required this.status});

  factory _$QrCodesImpl.fromJson(Map<String, dynamic> json) =>
      _$$QrCodesImplFromJson(json);

  @override
  final String description;
  @override
  final String gate;
  @override
  final String qrCode;
  @override
  final String sector;
  @override
  final String? workstation;
  @override
  final String status;

  @override
  String toString() {
    return 'QrCodes(description: $description, gate: $gate, qrCode: $qrCode, sector: $sector, workstation: $workstation, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QrCodesImpl &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.gate, gate) || other.gate == gate) &&
            (identical(other.qrCode, qrCode) || other.qrCode == qrCode) &&
            (identical(other.sector, sector) || other.sector == sector) &&
            (identical(other.workstation, workstation) ||
                other.workstation == workstation) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, description, gate, qrCode, sector, workstation, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QrCodesImplCopyWith<_$QrCodesImpl> get copyWith =>
      __$$QrCodesImplCopyWithImpl<_$QrCodesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QrCodesImplToJson(
      this,
    );
  }
}

abstract class _QrCodes implements QrCodes {
  const factory _QrCodes(
      {required final String description,
      required final String gate,
      required final String qrCode,
      required final String sector,
      required final String? workstation,
      required final String status}) = _$QrCodesImpl;

  factory _QrCodes.fromJson(Map<String, dynamic> json) = _$QrCodesImpl.fromJson;

  @override
  String get description;
  @override
  String get gate;
  @override
  String get qrCode;
  @override
  String get sector;
  @override
  String? get workstation;
  @override
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$QrCodesImplCopyWith<_$QrCodesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
