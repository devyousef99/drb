// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: unused_element

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cart _$CartFromJson(Map<String, dynamic> json) => Cart(
      refCode: json['refCode'] as String?,
      owner: json['owner'] as String?,
      isOrdered: json['isOrdered'] as bool?,
      dateOrdered: json['dateOrdered'] as String?,
      refrence: (json['refrence'] as List<dynamic>?)
          ?.map((e) => Refrence.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CartToJson(Cart instance) => <String, dynamic>{
      'refCode': instance.refCode,
      'owner': instance.owner,
      'isOrdered': instance.isOrdered,
      'dateOrdered': instance.dateOrdered,
      'refrence': instance.refrence,
    };
