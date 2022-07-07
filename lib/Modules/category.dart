// ignore_for_file: prefer_collection_literals

import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class Category {
  String? result;
  int? code;
  List<Data>? data;
  Pagination? pagination;

  Category({this.result, this.code, this.data, this.pagination});

  Category.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    code = json['code'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    return data;
  }
}

class Data {
  CategoriesCategory? categoriesCategory;

  Data({this.categoriesCategory});

  Data.fromJson(Map<String, dynamic> json) {
    categoriesCategory = json['CategoriesCategory'] != null
        ? new CategoriesCategory.fromJson(json['CategoriesCategory'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categoriesCategory != null) {
      data['CategoriesCategory'] = this.categoriesCategory!.toJson();
    }
    return data;
  }
}

class CategoriesCategory {
  String? id;
  String? name;
  Null? description;
  String? categoryType;
  Null? parentId;
  String? created;
  String? modified;
  Null? image;
  Null? displayOrder;
  Null? macAddress;
  Null? metadata1;
  Null? classificationId2;
  Null? metadata2;
  Null? classificationId3;
  Null? metadata3;
  Null? classificationId1;
  String? branchId;
  String? status;

  CategoriesCategory(
      {this.id,
      this.name,
      this.description,
      this.categoryType,
      this.parentId,
      this.created,
      this.modified,
      this.image,
      this.displayOrder,
      this.macAddress,
      this.metadata1,
      this.classificationId2,
      this.metadata2,
      this.classificationId3,
      this.metadata3,
      this.classificationId1,
      this.branchId,
      this.status});

  CategoriesCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    categoryType = json['category_type'];
    parentId = json['parent_id'];
    created = json['created'];
    modified = json['modified'];
    image = json['image'];
    displayOrder = json['display_order'];
    macAddress = json['mac_address'];
    metadata1 = json['metadata1'];
    classificationId2 = json['classification_id2'];
    metadata2 = json['metadata2'];
    classificationId3 = json['classification_id3'];
    metadata3 = json['metadata3'];
    classificationId1 = json['classification_id1'];
    branchId = json['branch_id'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['category_type'] = this.categoryType;
    data['parent_id'] = this.parentId;
    data['created'] = this.created;
    data['modified'] = this.modified;
    data['image'] = this.image;
    data['display_order'] = this.displayOrder;
    data['mac_address'] = this.macAddress;
    data['metadata1'] = this.metadata1;
    data['classification_id2'] = this.classificationId2;
    data['metadata2'] = this.metadata2;
    data['classification_id3'] = this.classificationId3;
    data['metadata3'] = this.metadata3;
    data['classification_id1'] = this.classificationId1;
    data['branch_id'] = this.branchId;
    data['status'] = this.status;
    return data;
  }
}

class Pagination {
  Null? prev;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['prev'] = this.prev;
    data['next'] = this.next;
    data['page'] = this.page;
    data['page_count'] = this.pageCount;
    data['total_results'] = this.totalResults;
    return data;
  }
}
