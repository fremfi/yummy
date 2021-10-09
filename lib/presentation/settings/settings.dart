import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yummy/application/settings_controller.dart';
import 'package:yummy/domain/settings/settings.dart';
import 'package:yummy/extensions.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        elevation: 0,
      ),
      body: GetBuilder<SettingsController>(
        init: SettingsController(),
        builder: (settingssController) {
          return Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Select language:',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                DropdownButton<Language>(
                  value: settingssController.settings.language,
                  icon: const Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                  underline: Container(
                    height: 2,
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                  onChanged: settingssController.onLanguageChange,
                  items: languages.map<DropdownMenuItem<Language>>(
                    (Language language) {
                      return DropdownMenuItem<Language>(
                        value: language,
                        child: Text(language.name),
                      );
                    },
                  ).toList(),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Select theme:',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                DropdownButton<ThemeMode>(
                  value: settingssController.settings.themeMode,
                  icon: const Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                  underline: Container(
                    height: 2,
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                  onChanged: settingssController.onThemeChange,
                  items: settingssController.themeModes
                      .map<DropdownMenuItem<ThemeMode>>(
                    (ThemeMode themeMode) {
                      return DropdownMenuItem<ThemeMode>(
                        value: themeMode,
                        child: Text(themeMode.toShortString().capitalize!),
                      );
                    },
                  ).toList(),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
