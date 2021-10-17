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
            "This easy, saucy Orange Chicken can be on the table in 30 minutes "
            "or less! The citrusy sauce tastes just like Panda Express -- "
            "it's sweet and tangy with a touch of spice.",
        cookTimeMinutes: 12,
        prepTimeMinutes: 18,
        servings: "4",
        ingredients: [
          "1 pound (16 oz.) **frozen breaded chicken tenders**",
          "2 tablespoons + 2 teaspoons **toasted sesame oil,** separated",
          "2 tablespoons **minced garlic**",
          "1 teaspoon **ginger paste**",
          "1/2 teaspoon **red pepper flakes**",
          "1/2 cup each: **white sugar, light brown sugar**",
          "1/2 cup **white vinegar**",
          "1-2 large **oranges** (1/2 cup juice & 1-2 teaspoons zest)",
          "1/4 cup **regular soy sauce**",
          "1/4 cup **cornstarch** mixed with 1/4 cup water",
        ],
        instructions: {
          "default": [
            "**CHICKEN:** Start by preparing chicken tenders according to package "
                "directions (We like air frying them best -- they're done "
                "in about 11-12 minutes!). Let cool to warm and then cut into "
                "bite-sized pieces and add to a large bowl.",
            "**SAUCE:** Meanwhile, set a medium-sized pot over medium-high heat and "
                "add 2 tablespoons of sesame oil. Once the oil begins to shimmer, "
                "add garlic, ginger and red pepper flakes. Cook, stirring constantly "
                "for 30 seconds. Then add in the brown sugar, white sugar,"
                " and 1-2 teaspoons orange zest (zest is optional -- we love it, "
                "but takes an extra minute, so you choose! Add more for a stronger "
                "orange flavor and less for a milder taste). Stir to moisten the sugar "
                "and then add in the orange juice. Stir until sugar is dissolved. "
                "Then add in the vinegar and soy sauce. Stir to combine.",
            "**THICKEN SAUCE:** In a separate small bowl, use a small whisk or fork to mix the "
                "cornstarch and water until the mixture is completely smooth. "
                "Pour all of this mixture into the sauce and stir. "
                "Continue to cook the sauce until it thickens to the "
                "consistency of syrup. Taste and adjust the sauce to personal "
                "preference, adding more red pepper flakes for a spicier sauce "
                "or a pinch of salt if needed.",
            "**ENJOY:** Pour as much sauce as you'd like over the cut-up chicken pieces "
                "(you may not want it all depending on how saucy or un-saucy "
                "you prefer your meal). Drizzle the remaining 2 teaspoons "
                "sesame oil on top of coated chicken. Gently toss and serve "
                "immediately. We like to serve over cooked rice with sesame "
                "seeds and thinly sliced green onions.",
          ]
        },
      ),
    ]);
  }
}
