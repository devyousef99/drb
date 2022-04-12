// ignore_for_file: prefer_collection_literals

import 'package:json_annotation/json_annotation.dart';

part 'products.g.dart';

@JsonSerializable()
class Products {
  int? id;
  String? owner;
  List<Detail>? detail;
  String? prName;
  String? prDescription;
  String? createAt;
  String? updateAt;
  int? cat;

  Products(
      {this.id,
      this.owner,
      this.detail,
      this.prName,
      this.prDescription,
      this.createAt,
      this.updateAt,
      this.cat});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    owner = json['owner'];
    if (json['detail'] != null) {
      detail = <Detail>[];
      json['detail'].forEach((v) {
        detail!.add(Detail.fromJson(v));
      });
    }
    prName = json['pr_name'];
    prDescription = json['pr_description'];
    createAt = json['create_at'];
    updateAt = json['update_at'];
    cat = json['cat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['owner'] = owner;
    if (detail != null) {
      data['detail'] = detail!.map((v) => v.toJson()).toList();
    }
    data['pr_name'] = prName;
    data['pr_description'] = prDescription;
    data['create_at'] = createAt;
    data['update_at'] = updateAt;
    data['cat'] = cat;
    return data;
  }
}

class Detail {
  String? prPrice;
  bool? inStock;
  int? prSize;
  int? prQunatity;
  String? prType;
  String? prImg;

  Detail(
      {this.prPrice,
      this.inStock,
      this.prSize,
      this.prQunatity,
      this.prType,
      this.prImg});

  Detail.fromJson(Map<String, dynamic> json) {
    prPrice = json['pr_price'];
    inStock = json['in_stock'];
    prSize = json['pr_size'];
    prQunatity = json['pr_qunatity'];
    prType = json['pr_type'];
    prImg = json['pr_img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['pr_price'] = prPrice;
    data['in_stock'] = inStock;
    data['pr_size'] = prSize;
    data['pr_qunatity'] = prQunatity;
    data['pr_type'] = prType;
    data['pr_img'] = prImg;
    return data;
  }
}
