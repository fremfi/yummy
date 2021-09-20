import 'package:get/get.dart';
import 'package:yummy/domain/recipe/recipe.dart';
import 'package:yummy/domain/recipe/recipe_service.dart';

class RecipesController extends GetxController {
  static RecipesController get to => Get.find();

  List<Recipe> recipes = [];
  bool isRecipesLoading = true;

  final RecipeService _recipeService = Get.find<RecipeService>();

  @override
  void onInit() {
    getRecipes();
    super.onInit();
  }

  Future<void> getRecipes() async {
    recipes = await _recipeService.getRecipes();
    isRecipesLoading = false;
    update();
  }
}
