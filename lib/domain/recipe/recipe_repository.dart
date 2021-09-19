import 'package:yummy/domain/recipe/recipe.dart';

abstract class RecipeRepository {
  Future<List<Recipe>> getRecipes();
}
