import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../repositories/firebase_util.dart';

part 'account.g.dart';

@immutable
@JsonSerializable()
class Account {
  final String id;
  final String name;
  final String email;
  final bool admin;
  final bool valid;
  final DateTime? deletedAt;

  const Account(
    this.id,
    this.name,
    this.email,
    this.admin,
    this.valid,
    this.deletedAt,
  );

  static Account? fromDoc(DocumentSnapshot<Map<String, dynamic>>? doc) =>
      (doc == null || !doc.exists)
          ? null
          : Account(
              doc.id,
              getStringValue(doc, 'name'),
              getStringValue(doc, 'email'),
              getBoolValue(doc, 'admin'),
              getBoolValue(doc, 'valid'),
              getDateTimeValue(doc, 'deletedAt'),
            );

  bool get alive => valid == true && deletedAt == null;

  @override
  int get hashCode => Object.hash(
        id,
        name,
        email,
        admin,
        valid,
        deletedAt,
      );

  @override
  bool operator ==(Object other) =>
      other is Account &&
      other.id == id &&
      other.name == name &&
      other.email == email &&
      other.admin == admin &&
      other.valid == valid &&
      other.deletedAt == deletedAt;

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);
  Map<String, dynamic> toJson() => _$AccountToJson(this);

  @override
  String toString() => toJson().toString();
}
