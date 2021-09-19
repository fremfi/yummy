import 'package:yummy/domain/recipe/recipe.dart';
import 'package:yummy/domain/recipe/recipe_repository.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  @override
  Future<List<Recipe>> getRecipes() {
    // TODO: Get recipes from the database
    return Future<List<Recipe>>.value([]);
  }
}
