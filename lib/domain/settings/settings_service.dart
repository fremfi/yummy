import 'package:yummy/domain/settings/settings.dart';

abstract class SettingsService {
  Future<void> saveSettings(Settings settings);

  Settings getSettings();
}
