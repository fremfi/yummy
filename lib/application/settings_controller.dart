import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yummy/app_theme.dart';
import 'package:yummy/domain/settings/settings.dart';
import 'package:yummy/domain/settings/settings_service.dart';

class SettingsController extends GetxController {
  static SettingsController get to => Get.find();

  late Settings settings;

  List<ThemeMode> themeModes = [ThemeMode.light, ThemeMode.dark];

  final SettingsService _settingsService = Get.find<SettingsService>();

  @override
  void onInit() async {
    settings = _settingsService.getSettings();
    update();
    super.onInit();
  }

  void onLanguageChange(Language? language) {
    if (language != null) {
      Get.updateLocale(Locale(language.localeCode));
      settings = settings.copyWith(language: language);
      _settingsService.saveSettings(settings);
      update();
    }
  }

  void onThemeChange(ThemeMode? themeMode) {
    if (themeMode != null) {
      Get.changeTheme(themeMode == ThemeMode.light
          ? AppTheme.lightTheme
          : AppTheme.darkTheme);
      settings = settings.copyWith(themeMode: themeMode);
      _settingsService.saveSettings(settings);
      update();
    }
  }
}
