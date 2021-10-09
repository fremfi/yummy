import 'package:yummy/domain/settings/settings.dart';
import 'package:yummy/domain/settings/settings_repository.dart';
import 'package:yummy/domain/settings/settings_service.dart';

class SettingsServiceImpl implements SettingsService {
  final SettingsRepository _settingsRepository;

  SettingsServiceImpl({required SettingsRepository settingsRepository})
      : _settingsRepository = settingsRepository;
  @override
  Future<void> saveSettings(Settings settings) {
    return _settingsRepository.saveSettings(settings);
  }

  @override
  Settings getSettings() {
    return _settingsRepository.getSettings();
  }
}
