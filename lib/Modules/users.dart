// ignore_for_file: unnecessary_cast, unnecessary_getters_setters, prefer_collection_literals

import 'package:json_annotation/json_annotation.dart';

part 'users.g.dart';

@JsonSerializable()
class Users {
  late int _id;
  late String _username;
  late String _firstName;
  late String _lastName;
  late String _email;
  late String _usrImg;
  late String _usrAddress;
  late String _usrStore;
  late int _usrType;

  Users({
    int? id,
    String? username,
    String? firstName,
    String? lastName,
    String? email,
    String? usrImg,
    int? usrAddress,
    int? usrStore,
    int? usrType,
  }) {
    if (id != null) {
      _id = this.id;
    }
    if (username != null) {
      _username = this.username;
    }
    if (firstName != null) {
      _firstName = this.firstName;
    }
    if (lastName != null) {
      _lastName = this.lastName;
    }
    if (email != null) {
      _email = this.email;
    }
    if (usrImg != null) {
      _usrImg = this.usrImg;
    }
    if (usrStore != null) {
      _usrStore = this.usrStore as String;
    }
    if (usrType != null) {
      _usrType = this.usrType;
    }
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get username => _username;
  set username(String username) => _username = username;
  String get firstName => _firstName;
  set firstName(String firstName) => _firstName = firstName;
  String get lastName => _lastName;
  set lastName(String lastName) => _lastName = lastName;
  String get email => _email;
  set email(String email) => _email = email;
  String get usrImg => _usrImg;
  set usrImg(String usrImg) => _usrImg = usrImg;
  String get usrAddress => _usrAddress;
  set usrAddress(String usrAddress) => _usrAddress = usrAddress;
  String get usrStore => _usrStore;
  set usrStore(String usrStore) => _usrStore = usrStore;
  int get usrType => _usrType;
  set usrType(int usrType) => _usrType = usrType;

  Users.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _username = json['username'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _email = json['email'];
    _usrImg = json['usr_img'];
    _usrAddress = json['usr_address'];
    _usrStore = json['usr_store'];
    _usrType = json['usr_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = _id;
    data['username'] = _username;
    data['first_name'] = _firstName;
    data['last_name'] = _lastName;
    data['email'] = _email;
    data['usr_img'] = _usrImg;
    data['usr_address'] = _usrAddress;
    data['usr_store'] = _usrStore;
    data['usr_type'] = _usrType;
    return data;
  }
}
