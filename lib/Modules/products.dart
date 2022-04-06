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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['owner'] = this.owner;
    if (this.detail != null) {
      data['detail'] = this.detail!.map((v) => v.toJson()).toList();
    }
    data['pr_name'] = this.prName;
    data['pr_description'] = this.prDescription;
    data['create_at'] = this.createAt;
    data['update_at'] = this.updateAt;
    data['cat'] = this.cat;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pr_price'] = this.prPrice;
    data['in_stock'] = this.inStock;
    data['pr_size'] = this.prSize;
    data['pr_qunatity'] = this.prQunatity;
    data['pr_type'] = this.prType;
    data['pr_img'] = this.prImg;
    return data;
  }
}