import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_provider.g.dart';

@immutable
class FirebaseServices {
  final FirebaseAuth auth;
  final FirebaseFirestore db;
  final FirebaseStorage storage;
  final FirebaseFunctions functions;

  const FirebaseServices(this.auth, this.db, this.storage, this.functions);
}

@Riverpod(keepAlive: true)
FirebaseServices firebase(FirebaseRef ref) => FirebaseServices(
      FirebaseAuth.instance,
      FirebaseFirestore.instance,
      FirebaseStorage.instance,
      FirebaseFunctions.instance,
    );
