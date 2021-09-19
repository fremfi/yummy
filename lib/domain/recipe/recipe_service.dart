import 'package:yummy/domain/recipe/recipe.dart';

abstract class RecipeService {
  Future<List<Recipe>> getRecipes();
}
