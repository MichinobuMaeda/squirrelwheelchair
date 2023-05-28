import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../env.dart';
import 'firebase_options.dart';

Future<void> initializeFirebase({bool test = false}) async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  if (test) {
    await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
    FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
    await FirebaseStorage.instance.useStorageEmulator('localhost', 9199);
    FirebaseFunctions.instance.useFunctionsEmulator('localhost', 5001);
  } else {
    await FirebaseAppCheck.instance.activate(
      webRecaptchaSiteKey: webRecaptchaSiteKey,
    );
  }
}

T? getNullableValue<T>(
  DocumentSnapshot<Map<String, dynamic>>? doc,
  String key,
) =>
    doc?.data()?.containsKey(key) == true ? doc!.get(key) : null;

T getValue<T>(
  DocumentSnapshot<Map<String, dynamic>>? doc,
  String key,
  T defaultValue,
) =>
    getNullableValue<T?>(doc, key) ?? defaultValue;

String getStringValue(
  DocumentSnapshot<Map<String, dynamic>>? doc,
  String key,
) =>
    getValue<String>(doc, key, '');

int getIntValue(
  DocumentSnapshot<Map<String, dynamic>>? doc,
  String key,
) =>
    getValue<int>(doc, key, 0);

double getDoubleValue(
  DocumentSnapshot<Map<String, dynamic>>? doc,
  String key,
) =>
    getValue<double>(doc, key, 0.0);

bool getBoolValue(
  DocumentSnapshot<Map<String, dynamic>>? doc,
  String key,
) =>
    getValue<bool>(doc, key, false);

DateTime? getDateTimeValue(
  DocumentSnapshot<Map<String, dynamic>>? doc,
  String key,
) =>
    getNullableValue<Timestamp>(doc, key)?.toDate();
