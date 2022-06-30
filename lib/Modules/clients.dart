// ignore_for_file: unnecessary_cast, unnecessary_getters_setters, prefer_collection_literals

import 'package:json_annotation/json_annotation.dart';

part 'clients.g.dart';

@JsonSerializable()
class Clients {
  int? code;
  String? result;
  List<Data>? data;
  Pagination? pagination;

  Clients({this.code, this.result, this.data, this.pagination});

  Clients.fromJson(Map<String, dynamic> json) {
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
  Client? client;

  Data({this.client});

  Data.fromJson(Map<String, dynamic> json) {
    client = json['Client'] != null ? Client.fromJson(json['Client']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (client != null) {
      data['Client'] = client!.toJson();
    }
    return data;
  }
}

class Client {
  int? id;
  bool? isOffline;
  String? clientNumber;
  int? staffId;
  String? businessName;
  String? firstName;
  String? lastName;
  String? email;
  String? address1;
  String? address2;
  String? city;
  String? state;
  String? postalCode;
  String? phone1;
  String? phone2;
  String? countryCode;
  String? notes;
  bool? activeSecondaryAddress;
  String? secondaryName;
  String? secondaryAddress1;
  String? secondaryAddress2;
  String? secondaryCity;
  String? secondaryState;
  String? secondaryPostalCode;
  String? secondaryCountryCode;
  String? defaultCurrencyCode;
  String? lastLogin;
  bool? suspend;
  String? lastIp;
  String? created;
  String? modified;
  Null? followUpStatus;
  String? category;
  int? groupPriceId;
  int? timezone;
  String? bn1;
  String? bn1Label;
  String? bn2Label;
  String? bn2;
  Null? startingBalance;
  int? type;
  String? birthDate;
  int? gender;
  String? mapLocation;
  int? creditLimit;
  int? creditPeriod;

  Client(
      {this.id,
      this.isOffline,
      this.clientNumber,
      this.staffId,
      this.businessName,
      this.firstName,
      this.lastName,
      this.email,
      this.address1,
      this.address2,
      this.city,
      this.state,
      this.postalCode,
      this.phone1,
      this.phone2,
      this.countryCode,
      this.notes,
      this.activeSecondaryAddress,
      this.secondaryName,
      this.secondaryAddress1,
      this.secondaryAddress2,
      this.secondaryCity,
      this.secondaryState,
      this.secondaryPostalCode,
      this.secondaryCountryCode,
      this.defaultCurrencyCode,
      this.lastLogin,
      this.suspend,
      this.lastIp,
      this.created,
      this.modified,
      this.followUpStatus,
      this.category,
      this.groupPriceId,
      this.timezone,
      this.bn1,
      this.bn1Label,
      this.bn2Label,
      this.bn2,
      this.startingBalance,
      this.type,
      this.birthDate,
      this.gender,
      this.mapLocation,
      this.creditLimit,
      this.creditPeriod});

  Client.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isOffline = json['is_offline'];
    clientNumber = json['client_number'];
    staffId = json['staff_id'];
    businessName = json['business_name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    address1 = json['address1'];
    address2 = json['address2'];
    city = json['city'];
    state = json['state'];
    postalCode = json['postal_code'];
    phone1 = json['phone1'];
    phone2 = json['phone2'];
    countryCode = json['country_code'];
    notes = json['notes'];
    activeSecondaryAddress = json['active_secondary_address'];
    secondaryName = json['secondary_name'];
    secondaryAddress1 = json['secondary_address1'];
    secondaryAddress2 = json['secondary_address2'];
    secondaryCity = json['secondary_city'];
    secondaryState = json['secondary_state'];
    secondaryPostalCode = json['secondary_postal_code'];
    secondaryCountryCode = json['secondary_country_code'];
    defaultCurrencyCode = json['default_currency_code'];
    lastLogin = json['last_login'];
    suspend = json['suspend'];
    lastIp = json['last_ip'];
    created = json['created'];
    modified = json['modified'];
    followUpStatus = json['follow_up_status'];
    category = json['category'];
    groupPriceId = json['group_price_id'];
    timezone = json['timezone'];
    bn1 = json['bn1'];
    bn1Label = json['bn1_label'];
    bn2Label = json['bn2_label'];
    bn2 = json['bn2'];
    startingBalance = json['starting_balance'];
    type = json['type'];
    birthDate = json['birth_date'];
    gender = json['gender'];
    mapLocation = json['map_location'];
    creditLimit = json['credit_limit'];
    creditPeriod = json['credit_period'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['is_offline'] = isOffline;
    data['client_number'] = clientNumber;
    data['staff_id'] = staffId;
    data['business_name'] = businessName;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['address1'] = address1;
    data['address2'] = address2;
    data['city'] = city;
    data['state'] = state;
    data['postal_code'] = postalCode;
    data['phone1'] = phone1;
    data['phone2'] = phone2;
    data['country_code'] = countryCode;
    data['notes'] = notes;
    data['active_secondary_address'] = activeSecondaryAddress;
    data['secondary_name'] = secondaryName;
    data['secondary_address1'] = secondaryAddress1;
    data['secondary_address2'] = secondaryAddress2;
    data['secondary_city'] = secondaryCity;
    data['secondary_state'] = secondaryState;
    data['secondary_postal_code'] = secondaryPostalCode;
    data['secondary_country_code'] = secondaryCountryCode;
    data['default_currency_code'] = defaultCurrencyCode;
    data['last_login'] = lastLogin;
    data['suspend'] = suspend;
    data['last_ip'] = lastIp;
    data['created'] = created;
    data['modified'] = modified;
    data['follow_up_status'] = followUpStatus;
    data['category'] = category;
    data['group_price_id'] = groupPriceId;
    data['timezone'] = timezone;
    data['bn1'] = bn1;
    data['bn1_label'] = bn1Label;
    data['bn2_label'] = bn2Label;
    data['bn2'] = bn2;
    data['starting_balance'] = startingBalance;
    data['type'] = type;
    data['birth_date'] = birthDate;
    data['gender'] = gender;
    data['map_location'] = mapLocation;
    data['credit_limit'] = creditLimit;
    data['credit_period'] = creditPeriod;
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
