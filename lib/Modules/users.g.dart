// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Users _$UsersFromJson(Map<String, dynamic> json) => Users(
      id: json['id'] as int?,
      username: json['username'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      usrImg: json['usrImg'] as String?,
      usrAddress: json['usrAddress'] as int?,
      usrStore: json['usrStore'] as int?,
      usrType: json['usrType'] as int?,
    );

Map<String, dynamic> _$UsersToJson(Users instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'usrImg': instance.usrImg,
      'usrAddress': instance.usrAddress,
      'usrStore': instance.usrStore,
      'usrType': instance.usrType,
    };
