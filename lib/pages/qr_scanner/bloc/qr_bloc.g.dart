// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$QrStateCWProxy {
  QrState userData(UserData? userData);

  QrState currentQrStep(QrStep currentQrStep);

  QrState isLoading(bool isLoading);

  QrState barcode(String? barcode);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `QrState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// QrState(...).copyWith(id: 12, name: "My name")
  /// ````
  QrState call({
    UserData? userData,
    QrStep? currentQrStep,
    bool? isLoading,
    String? barcode,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfQrState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfQrState.copyWith.fieldName(...)`
class _$QrStateCWProxyImpl implements _$QrStateCWProxy {
  const _$QrStateCWProxyImpl(this._value);

  final QrState _value;

  @override
  QrState userData(UserData? userData) => this(userData: userData);

  @override
  QrState currentQrStep(QrStep currentQrStep) =>
      this(currentQrStep: currentQrStep);

  @override
  QrState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override
  QrState barcode(String? barcode) => this(barcode: barcode);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `QrState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// QrState(...).copyWith(id: 12, name: "My name")
  /// ````
  QrState call({
    Object? userData = const $CopyWithPlaceholder(),
    Object? currentQrStep = const $CopyWithPlaceholder(),
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? barcode = const $CopyWithPlaceholder(),
  }) {
    return QrState(
      userData: userData == const $CopyWithPlaceholder()
          ? _value.userData
          // ignore: cast_nullable_to_non_nullable
          : userData as UserData?,
      currentQrStep:
          currentQrStep == const $CopyWithPlaceholder() || currentQrStep == null
              ? _value.currentQrStep
              // ignore: cast_nullable_to_non_nullable
              : currentQrStep as QrStep,
      isLoading: isLoading == const $CopyWithPlaceholder() || isLoading == null
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool,
      barcode: barcode == const $CopyWithPlaceholder()
          ? _value.barcode
          // ignore: cast_nullable_to_non_nullable
          : barcode as String?,
    );
  }
}

extension $QrStateCopyWith on QrState {
  /// Returns a callable class that can be used as follows: `instanceOfQrState.copyWith(...)` or like so:`instanceOfQrState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$QrStateCWProxy get copyWith => _$QrStateCWProxyImpl(this);
}
