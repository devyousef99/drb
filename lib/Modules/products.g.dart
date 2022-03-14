// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Products _$ProductsFromJson(Map<String, dynamic> json) => Products(
      id: json['id'] as int?,
      itemName: json['itemName'] as String?,
      itemDesc: json['itemDesc'] as String?,
      itemPrice: json['itemPrice'] as int?,
      itemQunatity: json['itemQunatity'] as int?,
      inStock: json['inStock'] as bool?,
      itemImg: json['itemImg'] as String?,
      catId: json['catId'] as int?,
      itemSize: json['itemSize'] as int?,
      createdBy: json['createdBy'] as int?,
    );

Map<String, dynamic> _$ProductsToJson(Products instance) => <String, dynamic>{
      'id': instance.id,
      'itemName': instance.itemName,
      'itemDesc': instance.itemDesc,
      'itemPrice': instance.itemPrice,
      'itemQunatity': instance.itemQunatity,
      'inStock': instance.inStock,
      'itemImg': instance.itemImg,
      'catId': instance.catId,
      'itemSize': instance.itemSize,
      'createdBy': instance.createdBy,
    };
