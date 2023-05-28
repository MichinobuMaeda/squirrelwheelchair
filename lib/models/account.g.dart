// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) => Account(
      json['id'] as String,
      json['name'] as String,
      json['email'] as String,
      json['admin'] as bool,
      json['valid'] as bool,
      json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
    );

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'admin': instance.admin,
      'valid': instance.valid,
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };
