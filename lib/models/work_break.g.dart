// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_break.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkBreak _$WorkBreakFromJson(Map<String, dynamic> json) => WorkBreak(
      qrCode: json['qrCode'] as String,
      startTime: json['startTime'] == null
          ? null
          : DateTime.parse(json['startTime'] as String),
      endTime: json['endTime'] == null
          ? null
          : DateTime.parse(json['endTime'] as String),
    );

Map<String, dynamic> _$WorkBreakToJson(WorkBreak instance) => <String, dynamic>{
      'qrCode': instance.qrCode,
      'startTime': instance.startTime?.toIso8601String(),
      'endTime': instance.endTime?.toIso8601String(),
    };
