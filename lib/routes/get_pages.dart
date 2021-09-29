import 'package:get/get.dart';
import 'package:yummy/presentation/recipes/recipes.dart';
import 'package:yummy/presentation/recipes_details/recipe_details.dart';
import 'package:yummy/routes/constants.dart';

List<GetPage<dynamic>> getGetPages() {
  return [
    GetPage(
      name: recipesRoute,
      page: () => const RecipesScreen(),
      transition: Transition.fade,
    ),
    GetPage(
      name: recipeDetailsRoute,
      page: () => const RecipeDetailsScreen(),
      transition: Transition.downToUp,
    ),
  ];
}
