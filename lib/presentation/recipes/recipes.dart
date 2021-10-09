import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yummy/application/recipes_controller.dart';
import 'package:yummy/domain/recipe/recipe.dart';
import 'package:yummy/presentation/recipes/widgets/recipe_card.dart';
import 'package:yummy/routes/constants.dart';

class RecipesScreen extends StatelessWidget {
  const RecipesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {
                  Get.toNamed(settingsRoute);
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Icon(
                    Icons.settings,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetBuilder<RecipesController>(
                init: RecipesController(),
                builder: (recipesController) {
                  List<Recipe> recipes = recipesController.recipes;
                  bool isRecipeLoading = recipesController.isRecipesLoading;
                  return isRecipeLoading
                      ? const Center(child: CircularProgressIndicator())
                      : ListView(
                          children: recipes
                              .map(
                                (Recipe recipe) => RecipeCard(
                                  recipe: recipe,
                                  onClick: () {
                                    Get.toNamed(recipeDetailsRoute,
                                        arguments: recipe);
                                  },
                                ),
                              )
                              .toList(),
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
