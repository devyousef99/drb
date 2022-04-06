// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Products _$ProductsFromJson(Map<String, dynamic> json) => Products(
      id: json['id'] as int?,
      owner: json['owner'] as String?,
      detail: (json['detail'] as List<dynamic>?)
          ?.map((e) => Detail.fromJson(e as Map<String, dynamic>))
          .toList(),
      prName: json['prName'] as String?,
      prDescription: json['prDescription'] as String?,
      createAt: json['createAt'] as String?,
      updateAt: json['updateAt'] as String?,
      cat: json['cat'] as int?,
    );

Map<String, dynamic> _$ProductsToJson(Products instance) => <String, dynamic>{
      'id': instance.id,
      'owner': instance.owner,
      'detail': instance.detail,
      'prName': instance.prName,
      'prDescription': instance.prDescription,
      'createAt': instance.createAt,
      'updateAt': instance.updateAt,
      'cat': instance.cat,
    };
