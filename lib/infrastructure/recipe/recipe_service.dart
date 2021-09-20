import 'package:yummy/domain/recipe/recipe.dart';
import 'package:yummy/domain/recipe/recipe_repository.dart';
import 'package:yummy/domain/recipe/recipe_service.dart';

class RecipeServiceImpl implements RecipeService {
  final RecipeRepository _recipeRepository;

  RecipeServiceImpl({required RecipeRepository recipeRepository})
      : _recipeRepository = recipeRepository;

  @override
  Future<List<Recipe>> getRecipes() {
    return _recipeRepository.getRecipes();
  }
}
