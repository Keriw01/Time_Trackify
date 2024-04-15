// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDataImpl _$$UserDataImplFromJson(Map<String, dynamic> json) =>
    _$UserDataImpl(
      email: json['email'] as String,
      role: json['role'] as String,
      status: json['status'] as String,
      userName: json['userName'] as String?,
    );

Map<String, dynamic> _$$UserDataImplToJson(_$UserDataImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'role': instance.role,
      'status': instance.status,
      'userName': instance.userName,
    };
