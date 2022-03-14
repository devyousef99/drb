import 'package:json_annotation/json_annotation.dart';

part 'products.g.dart';

@JsonSerializable()
class Products {
  int? id;
  String? itemName;
  String? itemDesc;
  int? itemPrice;
  int? itemQunatity;
  bool? inStock;
  String? itemImg;
  int? catId;
  int? itemSize;
  int? createdBy;

  Products(
      {this.id,
        this.itemName,
        this.itemDesc,
        this.itemPrice,
        this.itemQunatity,
        this.inStock,
        this.itemImg,
        this.catId,
        this.itemSize,
        this.createdBy});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    itemName = json['item_name'];
    itemDesc = json['item_desc'];
    itemPrice = json['item_price'];
    itemQunatity = json['item_qunatity'];
    inStock = json['in_stock'];
    itemImg = json['item_img'];
    catId = json['cat_id'];
    itemSize = json['item_size'];
    createdBy = json['created_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['item_name'] = this.itemName;
    data['item_desc'] = this.itemDesc;
    data['item_price'] = this.itemPrice;
    data['item_qunatity'] = this.itemQunatity;
    data['in_stock'] = this.inStock;
    data['item_img'] = this.itemImg;
    data['cat_id'] = this.catId;
    data['item_size'] = this.itemSize;
    data['created_by'] = this.createdBy;
    return data;
  }
}
