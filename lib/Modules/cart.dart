import 'products.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart.g.dart';

@JsonSerializable()
class Cart {
  String? refCode;
  String? owner;
  bool? isOrdered;
  String? dateOrdered;
  List<Refrence>? refrence;

  Cart(
      {this.refCode,
        this.owner,
        this.isOrdered,
        this.dateOrdered,
        this.refrence});

  Cart.fromJson(Map<String, dynamic> json) {
    refCode = json['ref_code'];
    owner = json['owner'];
    isOrdered = json['is_ordered'];
    dateOrdered = json['date_ordered'];
    if (json['refrence'] != null) {
      refrence = <Refrence>[];
      json['refrence'].forEach((v) {
        refrence!.add(new Refrence.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ref_code'] = this.refCode;
    data['owner'] = this.owner;
    data['is_ordered'] = this.isOrdered;
    data['date_ordered'] = this.dateOrdered;
    if (this.refrence != null) {
      data['refrence'] = this.refrence!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Refrence {
  List<Products>? product;
  int? price;
  String? size;
  int? quantity;

  int totalPrice(){
    // add your price calculation logic
    return price! * quantity!;
  }

  Refrence({this.product, this.price, this.size, this.quantity});

  Refrence.fromJson(Map<String, dynamic> json) {
    if (json['product'] != null) {
      product = <Products>[];
      json['product'].forEach((v) {
        product!.add(new Products.fromJson(v));
      });
    }
    price = json['price'];
    size = json['size'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.product != null) {
      data['product'] = this.product!.map((v) => v.toJson()).toList();
    }
    data['price'] = this.price;
    data['size'] = this.size;
    data['quantity'] = this.quantity;
    return data;
  }
}