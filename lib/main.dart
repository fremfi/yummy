import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yummy/app_theme.dart';
import 'package:yummy/routes/constants.dart';
import 'package:yummy/routes/get_pages.dart';

import 'domain/internationalization.dart';
import 'domain/settings/settings.dart';
import 'getx_initial_bindings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  Settings settings = prefs.getString('settings') != null
      ? Settings.fromJson(jsonDecode(prefs.getString('settings')!))
      : Settings(themeMode: ThemeMode.light, language: languages[0]);
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
