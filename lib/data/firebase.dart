import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../version.dart';
import 'firebase_options.dart';

const String webRecaptchaSiteKey = '6LcTNAYmAAAAAInSA8mcOLYXiIhVcBE6S1SxlPGH';

Future<void> initializeFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  if (version == 'for test') {
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
