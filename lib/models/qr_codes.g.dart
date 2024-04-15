// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_codes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QrCodesImpl _$$QrCodesImplFromJson(Map<String, dynamic> json) =>
    _$QrCodesImpl(
      description: json['description'] as String,
      gate: json['gate'] as String,
      qrCode: json['qrCode'] as String,
      sector: json['sector'] as String,
      workstation: json['workstation'] as String?,
      status: json['status'] as String,
    );

Map<String, dynamic> _$$QrCodesImplToJson(_$QrCodesImpl instance) =>
    <String, dynamic>{
      'description': instance.description,
      'gate': instance.gate,
      'qrCode': instance.qrCode,
      'sector': instance.sector,
      'workstation': instance.workstation,
      'status': instance.status,
    };
