import 'package:mockito/mockito.dart';
import 'package:yummy/domain/recipe/recipe.dart';
import 'package:yummy/domain/recipe/recipe_repository.dart';

class FakeRecipeRepositoryImpl extends Fake implements RecipeRepository {
  @override
  Future<List<Recipe>> getRecipes() {
    return Future<List<Recipe>>.value([
      Recipe(
        title: "Orange Chicken",
        imageUrl:
            "https://www.chelseasmessyapron.com/wp-content/uploads/2020/10/ORANGE-CHICKEN-6.jpg",
        description:
            "This easy, saucy Orange Chicken can be on the table in 30 minutes or less! The citrusy sauce tastes just like Panda Express -- it's sweet and tangy with a touch of spice.",
      ),
      Recipe(
        title: "Sheet Pan Sausage And Veggies",
        imageUrl:
            "https://www.chelseasmessyapron.com/wp-content/uploads/2016/09/Sausage-and-Veggies-2.jpg",
        description:
            "Sheet Pan Sausage and Veggies makes for the best simple, filling, and nutritious dinner with virtually no cleanup! A killer seasoning blend gets tossed with your favorite veggies and smoked sausage and roasted to perfection. Top with freshly grated Parmesan cheese and enjoy as is or over a cooked grain.",
      ),
      Recipe(
        title: "Applebee's Chicken Salad",
        imageUrl:
            "https://www.chelseasmessyapron.com/wp-content/uploads/2021/07/Applebees-Chicken-Salad-5.jpeg",
        description:
            "This easy restaurant copycat Applebee's Chicken Salad combines romaine and coleslaw with crispy chicken, sliced almonds, crunchy chow mein noodles, sweet mandarin oranges, and an irresistible creamy & sweet dressing.",
      ),
    ]);
  }
}
