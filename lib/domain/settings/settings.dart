import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'settings.freezed.dart';
part 'settings.g.dart';

List<Language> languages = [
  Language(
    name: 'English',
    localeCode: 'en',
  ),
  Language(
    name: 'French',
    localeCode: 'fr',
  ),
];

@freezed
class Settings with _$Settings {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  factory Settings({
    required Language language,
    required ThemeMode themeMode,
  }) = _Settings;

  factory Settings.fromJson(Map<String, dynamic> json) =>
      _$SettingsFromJson(json);
}

@freezed
class Language with _$Language {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  factory Language({
    required String name,
    required String localeCode,
  }) = _Language;

  factory Language.fromJson(Map<String, dynamic> json) =>
      _$LanguageFromJson(json);
}
