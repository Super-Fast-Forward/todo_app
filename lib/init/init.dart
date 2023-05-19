import 'package:common/common.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:theme/config.dart';
import '../firebase_options.dart';
import '../main.dart';

Future<void> init() async {
  ThemeModeConfig.enableSave = true;
  ThemeModeConfig.defaultToLightTheme = true;
  sharedPreferences = await SharedPreferences.getInstance();
  String? uuid = sharedPreferences.getString("UUID");

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  if (uuid == null) {
    final user = await FirebaseAuth.instance.signInAnonymously();
    uuid = user.user?.uid;
    sharedPreferences.setString("UUID", uuid ?? "");
  }

  final doc = kDB.collection(COLLECTION_NAME).doc(uuid);

  COLLECTION_REFERENCE = doc.collection("Todos");
}
