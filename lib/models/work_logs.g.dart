// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_logs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkLogsImpl _$$WorkLogsImplFromJson(Map<String, dynamic> json) =>
    _$WorkLogsImpl(
      workLogs: (json['Logs'] as List<dynamic>?)
          ?.map((e) => WorkLog.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$WorkLogsImplToJson(_$WorkLogsImpl instance) =>
    <String, dynamic>{
      'Logs': instance.workLogs,
    };
