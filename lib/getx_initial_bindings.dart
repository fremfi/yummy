import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yummy/domain/recipe/recipe_service.dart';
import 'package:yummy/domain/settings/settings_service.dart';
import 'package:yummy/infrastructure/recipe/mocks/fake_recipe_repository.dart';
import 'package:yummy/infrastructure/recipe/recipe_repository.dart';
import 'package:yummy/infrastructure/recipe/recipe_service.dart';
import 'package:yummy/infrastructure/settings/settings_repository.dart';
import 'package:yummy/infrastructure/settings/settings_service.dart';

import 'application/settings_controller.dart';

class InitialBinding implements Bindings {
  @override
  Future<void> dependencies() async {
    if (kDebugMode) {
      Get.put<RecipeService>(
        RecipeServiceImpl(recipeRepository: FakeRecipeRepositoryImpl()),
        permanent: true,
      );
    } else {
      Get.put<RecipeService>(
        RecipeServiceImpl(recipeRepository: RecipeRepositoryImpl()),
        permanent: true,
      );
    }
    Get.put<SettingsService>(
      SettingsServiceImpl(
        settingsRepository: SettingsRepositoryImpl(
          prefs: await SharedPreferences.getInstance(),
        ),
      ),
      permanent: true,
    );
    Get.put<SettingsController>(SettingsController(), permanent: true);
  }
}
