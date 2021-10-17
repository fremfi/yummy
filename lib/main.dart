import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yummy/app_theme.dart';
import 'package:yummy/routes/constants.dart';
import 'package:yummy/routes/get_pages.dart';

import 'domain/internationalization.dart';
import 'domain/settings/settings.dart';
import 'domain/settings/settings_service.dart';
import 'getx_initial_bindings.dart';
import 'infrastructure/settings/settings_repository.dart';
import 'infrastructure/settings/settings_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var settingsService = SettingsServiceImpl(
    settingsRepository: SettingsRepositoryImpl(
      prefs: await SharedPreferences.getInstance(),
    ),
  );
  Get.put<SettingsService>(
    settingsService,
    permanent: true,
  );
  Settings settings = settingsService.getSettings();

  if (!kIsWeb) {
    await Firebase.initializeApp();
  }
  runApp(
    MyApp(settings: settings),
  );
}

class MyApp extends StatelessWidget {
  final Settings settings;
  const MyApp({Key? key, required this.settings}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      settings.themeMode == ThemeMode.light
          ? SystemUiOverlayStyle.dark
          : SystemUiOverlayStyle.light,
    );

    return GetMaterialApp(
      key: const Key('Get Material App'),
      title: 'Yummy',
      initialBinding: InitialBinding(),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: settings.themeMode,
      initialRoute: recipesRoute,
      getPages: getGetPages(),
      navigatorKey: Get.key,
      translations: YummyTranslations(),
      locale: Locale(settings.language.localeCode),
      fallbackLocale: const Locale('en'),
    );
  }
}
