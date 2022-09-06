// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clients.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Clients _$ClientsFromJson(Map<String, dynamic> json) => Clients(
      client: json['client'] == null
          ? null
          : Client.fromJson(json['client'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ClientsToJson(Clients instance) => <String, dynamic>{
      'client': instance.client,
    };
