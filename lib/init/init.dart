import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:common/common.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:theme/config.dart';
import '../firebase_options.dart';

// ignore: constant_identifier_names
const COLLECTION_NAME = "Todo_App";
// ignore: non_constant_identifier_names
late final CollectionReference COLLECTION_REFERENCE;

late final UserCredential user;

late final bool isUserFirstLogin;

Future<void> init() async {
  ThemeModeConfig.enableSave = true;
  ThemeModeConfig.defaultToLightTheme = true;

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  user = await FirebaseAuth.instance.signInAnonymously();

  final doc = kDB.collection(COLLECTION_NAME).doc(user.user?.uid);

  isUserFirstLogin = await doc.get().then(
        (doc) => !doc.exists,
      );

  print(isUserFirstLogin);

  if (isUserFirstLogin) {
    doc.set({
      "LastLoginAsUTC": DateTime.now().toUtc(),
      "FirstLoginDateUTC": DateTime.now().toUtc()
    });
  } else {
    doc.set({
      "LastLoginAsUTC": DateTime.now().toUtc(),
    });
  }

  COLLECTION_REFERENCE = doc.collection("Todos");
}
