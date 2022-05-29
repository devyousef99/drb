// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      evName: json['evName'] as String?,
      evDescription: json['evDescription'] as String?,
      evImg: json['evImg'] as String?,
      evHost: json['evHost'] as String?,
      evDetail: (json['evDetail'] as List<dynamic>?)
          ?.map((e) => EvDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'evName': instance.evName,
      'evDescription': instance.evDescription,
      'evImg': instance.evImg,
      'evHost': instance.evHost,
      'evDetail': instance.evDetail,
    };
