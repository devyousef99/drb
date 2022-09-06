// ignore_for_file: prefer_collection_literals

import 'package:json_annotation/json_annotation.dart';
part 'itemCart.g.dart';

@JsonSerializable()
class itemCart {
  String? id;
  String? name;
  String? description;
  String? brand;
  String? category;
  String? buyPrice;
  String? stockBalance;
  String? type;
  List<ProductImage>? productImage;
  List<ProductCategory>? productCategory;

  itemCart(
      {this.id,
      this.name,
      this.description,
      this.brand,
      this.category,
      this.buyPrice,
      this.stockBalance,
      this.type,
      this.productImage,
      this.productCategory});

  itemCart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    brand = json['brand'];
    category = json['category'];
    buyPrice = json['buy_price'];
    stockBalance = json['stock_balance'];
    if (json['ProductImage'] != null) {
      productImage = <ProductImage>[];
      json['ProductImage'].forEach((v) {
        productImage!.add(ProductImage.fromJson(v));
      });
    }
    if (json['ProductCategory'] != null) {
      productCategory = <ProductCategory>[];
      json['ProductCategory'].forEach((v) {
        productCategory!.add(ProductCategory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['brand'] = brand;
    data['category'] = category;
    data['stock_balance'] = stockBalance;
    if (productImage != null) {
      data['ProductImage'] = productImage!.map((v) => v.toJson()).toList();
    }
    if (productCategory != null) {
      data['ProductCategory'] =
          productCategory!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductImage {
  int? id;
  String? productId;
  bool? based;
  String? file;
  String? created;
  String? modified;
  String? fileFullPath;

  ProductImage(
      {this.id,
      this.productId,
      this.based,
      this.file,
      this.created,
      this.modified,
      this.fileFullPath});

  ProductImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    based = json['default'];
    file = json['file'];
    created = json['created'];
    modified = json['modified'];
    fileFullPath = json['file_full_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['product_id'] = productId;
    data['default'] = based;
    data['file'] = file;
    data['created'] = created;
    data['modified'] = modified;
    data['file_full_path'] = fileFullPath;
    return data;
  }
}

class ProductCategory {
  String? id;
  String? name;
  String? description;
  String? categoryType;
  int? parentId;
  String? image;
  String? created;
  String? modified;
  String? imageFullPath;

  ProductCategory(
      {this.id,
      this.name,
      this.description,
      this.categoryType,
      this.parentId,
      this.image,
      this.created,
      this.modified,
      this.imageFullPath});

  ProductCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    categoryType = json['category_type'];
    parentId = json['parent_id'];
    image = json['image'];
    created = json['created'];
    modified = json['modified'];
    imageFullPath = json['image_full_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['category_type'] = categoryType;
    data['parent_id'] = parentId;
    data['image'] = image;
    data['created'] = created;
    data['modified'] = modified;
    data['image_full_path'] = imageFullPath;
    return data;
  }
}
