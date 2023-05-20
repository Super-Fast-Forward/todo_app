import 'package:todo_app/core/_core_export.dart';

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
