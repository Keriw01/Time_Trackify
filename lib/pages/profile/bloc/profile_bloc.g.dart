// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ProfileStateCWProxy {
  ProfileState isLoading(bool isLoading);

  ProfileState errorMessage(String? errorMessage);

  ProfileState userData(UserData? userData);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ProfileState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ProfileState(...).copyWith(id: 12, name: "My name")
  /// ````
  ProfileState call({
    bool? isLoading,
    String? errorMessage,
    UserData? userData,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfProfileState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfProfileState.copyWith.fieldName(...)`
class _$ProfileStateCWProxyImpl implements _$ProfileStateCWProxy {
  const _$ProfileStateCWProxyImpl(this._value);

  final ProfileState _value;

  @override
  ProfileState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override
  ProfileState errorMessage(String? errorMessage) =>
      this(errorMessage: errorMessage);

  @override
  ProfileState userData(UserData? userData) => this(userData: userData);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ProfileState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ProfileState(...).copyWith(id: 12, name: "My name")
  /// ````
  ProfileState call({
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? errorMessage = const $CopyWithPlaceholder(),
    Object? userData = const $CopyWithPlaceholder(),
  }) {
    return ProfileState(
      isLoading: isLoading == const $CopyWithPlaceholder() || isLoading == null
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool,
      errorMessage: errorMessage == const $CopyWithPlaceholder()
          ? _value.errorMessage
          // ignore: cast_nullable_to_non_nullable
          : errorMessage as String?,
      userData: userData == const $CopyWithPlaceholder()
          ? _value.userData
          // ignore: cast_nullable_to_non_nullable
          : userData as UserData?,
    );
  }
}

extension $ProfileStateCopyWith on ProfileState {
  /// Returns a callable class that can be used as follows: `instanceOfProfileState.copyWith(...)` or like so:`instanceOfProfileState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ProfileStateCWProxy get copyWith => _$ProfileStateCWProxyImpl(this);
}
