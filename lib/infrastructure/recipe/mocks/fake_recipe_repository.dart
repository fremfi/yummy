import 'package:mockito/mockito.dart';
import 'package:yummy/domain/recipe/recipe.dart';
import 'package:yummy/domain/recipe/recipe_repository.dart';

class FakeRecipeRepositoryImpl extends Fake implements RecipeRepository {
  @override
  Future<List<Recipe>> getRecipes() {
    return Future<List<Recipe>>.value([
      Recipe(title: "lorem", imageUrl: "lorem img", description: "lorem desc"),
    ]);
  }
}
