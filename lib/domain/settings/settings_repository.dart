import 'package:yummy/domain/settings/settings.dart';

abstract class SettingsRepository {
  Future<void> saveSettings(Settings settings);

  Settings getSettings();
}
