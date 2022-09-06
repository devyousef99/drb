// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itemCart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

itemCart _$itemCartFromJson(Map<String, dynamic> json) => itemCart(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      brand: json['brand'] as String?,
      category: json['category'] as String?,
      buyPrice: json['buyPrice'] as String?,
      stockBalance: json['stockBalance'] as String?,
      type: json['type'] as String?,
      productImage: (json['productImage'] as List<dynamic>?)
          ?.map((e) => ProductImage.fromJson(e as Map<String, dynamic>))
          .toList(),
      productCategory: (json['productCategory'] as List<dynamic>?)
          ?.map((e) => ProductCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$itemCartToJson(itemCart instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'brand': instance.brand,
      'category': instance.category,
      'buyPrice': instance.buyPrice,
      'stockBalance': instance.stockBalance,
      'type': instance.type,
      'productImage': instance.productImage,
      'productCategory': instance.productCategory,
    };
