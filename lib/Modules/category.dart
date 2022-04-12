// ignore_for_file: prefer_collection_literals

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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['cat_name'] = catName;
    return data;
  }
}
