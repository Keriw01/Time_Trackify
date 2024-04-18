// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkLogImpl _$$WorkLogImplFromJson(Map<String, dynamic> json) =>
    _$WorkLogImpl(
      breaks: (json['breaks'] as List<dynamic>?)
          ?.map((e) => WorkBreak.fromJson(e as Map<String, dynamic>))
          .toList(),
      endWork: json['endWork'] == null
          ? null
          : WorkEvent.fromJson(json['endWork'] as Map<String, dynamic>),
      startWork: json['startWork'] == null
          ? null
          : WorkEvent.fromJson(json['startWork'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$WorkLogImplToJson(_$WorkLogImpl instance) =>
    <String, dynamic>{
      'breaks': instance.breaks,
      'endWork': instance.endWork,
      'startWork': instance.startWork,
    };
