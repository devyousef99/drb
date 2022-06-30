// ignore_for_file: prefer_collection_literals

import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class Category {
  int? code;
  String? result;
  List<Data>? data;
  Pagination? pagination;

  Category({this.code, this.result, this.data, this.pagination});

  Category.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    result = json['result'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['code'] = code;
    data['result'] = result;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
    }
    return data;
  }
}

class Data {
  ProductCategory? productCategory;

  Data({this.productCategory});

  Data.fromJson(Map<String, dynamic> json) {
    productCategory = json['ProductCategory'] != null
        ? ProductCategory.fromJson(json['ProductCategory'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (productCategory != null) {
      data['ProductCategory'] = productCategory!.toJson();
    }
    return data;
  }
}

class ProductCategory {
  int? id;
  String? name;
  String? description;
  int? categoryType;
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

class Pagination {
  String? prev;
  String? next;
  int? page;
  int? pageCount;
  int? totalResults;

  Pagination(
      {this.prev, this.next, this.page, this.pageCount, this.totalResults});

  Pagination.fromJson(Map<String, dynamic> json) {
    prev = json['prev'];
    next = json['next'];
    page = json['page'];
    pageCount = json['page_count'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['prev'] = prev;
    data['next'] = next;
    data['page'] = page;
    data['page_count'] = pageCount;
    data['total_results'] = totalResults;
    return data;
  }
}
