import 'package:common/common.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:theme/config.dart';
import 'package:todo_app/core/constants/_constants_export.dart';
import '../../firebase_options.dart';
import '../../main.dart';

Future<void> init() async {
  ThemeModeConfig.enableSave = true;
  ThemeModeConfig.defaultToLightTheme = true;
  sharedPreferences = await SharedPreferences.getInstance();
  Generals.uuid = sharedPreferences.getString(SharedPreferencesKeys.uuid);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  if (Generals.uuid == null) {
    final user = await FirebaseAuth.instance.signInAnonymously();
    Generals.uuid = user.user?.uid;
    sharedPreferences.setString(
      SharedPreferencesKeys.uuid,
      Generals.uuid ?? "",
    );
  }

  final doc = kDB.collection(Collections.TODO_APP).doc(Generals.uuid);
  COLLECTION_REFERENCE = doc.collection(Collections.TODOS);
}
