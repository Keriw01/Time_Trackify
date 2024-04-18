// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkEvent _$WorkEventFromJson(Map<String, dynamic> json) => WorkEvent(
      qrCode: json['qrCode'] as String,
      time: DateTime.parse(json['time'] as String),
    );

Map<String, dynamic> _$WorkEventToJson(WorkEvent instance) => <String, dynamic>{
      'qrCode': instance.qrCode,
      'time': instance.time.toIso8601String(),
    };
