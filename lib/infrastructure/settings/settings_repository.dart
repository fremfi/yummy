import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yummy/domain/settings/settings.dart';
import 'package:yummy/domain/settings/settings_repository.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final SharedPreferences _prefs;

  SettingsRepositoryImpl({required SharedPreferences prefs}) : _prefs = prefs;

  @override
  Future<void> saveSettings(Settings settings) {
    return _prefs.setString('settings', json.encode(settings));
  }

  @override
  Settings getSettings() {
    return _prefs.getString('settings') != null
        ? Settings.fromJson(jsonDecode(_prefs.getString('settings')!))
        : Settings(themeMode: ThemeMode.light, language: languages[0]);
  }
}
