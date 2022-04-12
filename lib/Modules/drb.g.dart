// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: unused_element

part of 'drb.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Drb _$DrbFromJson(Map<String, dynamic> json) => Drb(
      drbName: json['drbName'] as String?,
      drbDescription: json['drbDescription'] as String?,
      drbImg: json['drbImg'] as String?,
      drbHost: json['drbHost'] as String?,
      drbDetail: (json['drbDetail'] as List<dynamic>?)
          ?.map((e) => DrbDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DrbToJson(Drb instance) => <String, dynamic>{
      'drbName': instance.drbName,
      'drbDescription': instance.drbDescription,
      'drbImg': instance.drbImg,
      'drbHost': instance.drbHost,
      'drbDetail': instance.drbDetail,
    };
