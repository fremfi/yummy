import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:yummy/domain/recipe/recipe_service.dart';
import 'package:yummy/infrastructure/recipe/mocks/fake_recipe_repository.dart';
import 'package:yummy/infrastructure/recipe/recipe_repository.dart';
import 'package:yummy/infrastructure/recipe/recipe_service.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
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
  }
}
