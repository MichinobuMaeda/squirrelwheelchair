import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../repositories/firebase_util.dart';

part 'conf.g.dart';

@immutable
@JsonSerializable()
class Conf {
  final int dataVersion;
  final String uiVersion;

  const Conf(this.dataVersion, this.uiVersion);

  static Conf? fromDoc(DocumentSnapshot<Map<String, dynamic>>? doc) =>
      (doc == null || !doc.exists)
          ? null
          : Conf(
              getIntValue(doc, 'dataVersion'),
              getStringValue(doc, 'uiVersion'),
            );
  @override
  int get hashCode => Object.hash(
        dataVersion,
        uiVersion,
      );

  @override
  bool operator ==(Object other) {
    return other is Conf &&
        other.dataVersion == dataVersion &&
        other.uiVersion == uiVersion;
  }

  factory Conf.fromJson(Map<String, dynamic> json) => _$ConfFromJson(json);
  Map<String, dynamic> toJson() => _$ConfToJson(this);

  @override
  String toString() => toJson().toString();
}
