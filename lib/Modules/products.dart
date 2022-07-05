import 'package:json_annotation/json_annotation.dart';

part 'products.g.dart';

@JsonSerializable()
class Products {
  int? code;
  String? result;
  List<Data>? data;
  Pagination? pagination;

  Products({this.code, this.result, this.data, this.pagination});

  Products.fromJson(Map<String, dynamic> json) {
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
  Product? product;

  Data({this.product});

  Data.fromJson(Map<String, dynamic> json) {
    product =
        json['Product'] != null ? Product.fromJson(json['Product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (product != null) {
      data['Product'] = product!.toJson();
    }
    return data;
  }
}

class Product {
  String? id;
  String? staffId;
  String? name;
  String? description;
  String? unitPrice;
  int? tax1;
  int? tax2;
  String? supplierId;
  String? brand;
  String? category;
  String? tags;
  String? buyPrice;
  String? productCode;
  String? trackStock;
  String? stockBalance;
  String? lowStockThershold;
  String? barcode;
  String? notes;
  String? deactivate;
  String? created;
  String? modified;
  Null? followUpStatus;
  String? updatedPrice;
  String? averagePrice;
  String? type;
  Null? minimumPrice;
  Null? profitMargin;
  Null? discount;
  Null? discountType;
  int? durationMinutes;
  int? availabeOnline;
  int? rawStoreId;
  List<ProductImage>? productImage;
  List<ProductCategory>? productCategory;

  Product(
      {this.id,
      this.staffId,
      this.name,
      this.description,
      this.unitPrice,
      this.tax1,
      this.tax2,
      this.supplierId,
      this.brand,
      this.category,
      this.tags,
      this.buyPrice,
      this.productCode,
      this.trackStock,
      this.stockBalance,
      this.lowStockThershold,
      this.barcode,
      this.notes,
      this.deactivate,
      this.created,
      this.modified,
      this.followUpStatus,
      this.updatedPrice,
      this.averagePrice,
      this.type,
      this.minimumPrice,
      this.profitMargin,
      this.discount,
      this.discountType,
      this.durationMinutes,
      this.availabeOnline,
      this.rawStoreId,
      this.productImage,
      this.productCategory});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    staffId = json['staff_id'];
    name = json['name'];
    description = json['description'];
    unitPrice = json['unit_price'];
    tax1 = json['tax1'];
    tax2 = json['tax2'];
    supplierId = json['supplier_id'];
    brand = json['brand'];
    category = json['category'];
    tags = json['tags'];
    buyPrice = json['buy_price'];
    productCode = json['product_code'];
    trackStock = json['track_stock'];
    stockBalance = json['stock_balance'];
    lowStockThershold = json['low_stock_thershold'];
    barcode = json['barcode'];
    notes = json['notes'];
    deactivate = json['deactivate'];
    created = json['created'];
    modified = json['modified'];
    followUpStatus = json['follow_up_status'];
    updatedPrice = json['updated_price'];
    averagePrice = json['average_price'];
    type = json['type'];
    minimumPrice = json['minimum_price'];
    profitMargin = json['profit_margin'];
    discount = json['discount'];
    discountType = json['discount_type'];
    durationMinutes = json['duration_minutes'];
    availabeOnline = json['availabe_online'];
    rawStoreId = json['raw_store_id'];
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
    data['staff_id'] = staffId;
    data['name'] = name;
    data['description'] = description;
    data['unit_price'] = unitPrice;
    data['tax1'] = tax1;
    data['tax2'] = tax2;
    data['supplier_id'] = supplierId;
    data['brand'] = brand;
    data['category'] = category;
    data['tags'] = tags;
    data['buy_price'] = buyPrice;
    data['product_code'] = productCode;
    data['track_stock'] = trackStock;
    data['stock_balance'] = stockBalance;
    data['low_stock_thershold'] = lowStockThershold;
    data['barcode'] = barcode;
    data['notes'] = notes;
    data['deactivate'] = deactivate;
    data['created'] = created;
    data['modified'] = modified;
    data['follow_up_status'] = followUpStatus;
    data['updated_price'] = updatedPrice;
    data['average_price'] = averagePrice;
    data['type'] = type;
    data['minimum_price'] = minimumPrice;
    data['profit_margin'] = profitMargin;
    data['discount'] = discount;
    data['discount_type'] = discountType;
    data['duration_minutes'] = durationMinutes;
    data['availabe_online'] = availabeOnline;
    data['raw_store_id'] = rawStoreId;
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
  int? productId;
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
