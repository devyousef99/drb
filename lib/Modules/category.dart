import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class Category {
  int? id;
  String? catName;

  Category({this.id, this.catName});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    catName = json['cat_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cat_name'] = this.catName;
    return data;
  }
}
