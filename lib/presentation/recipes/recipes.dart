import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yummy/application/recipes_controller.dart';
import 'package:yummy/domain/recipe/recipe.dart';
import 'package:yummy/presentation/recipes/widgets/recipe_card.dart';

class RecipesScreen extends StatelessWidget {
  const RecipesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yummy'),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: GetBuilder<RecipesController>(
        init: RecipesController(),
        builder: (recipesController) {
          List<Recipe> recipes = recipesController.recipes;
          bool isRecipeLoading = recipesController.isRecipesLoading;
          return isRecipeLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView(
                  children: recipes
                      .map(
                        (Recipe recipe) => RecipeCard(recipe: recipe),
                      )
                      .toList(),
                );
        },
      ),
    );
  }
}
