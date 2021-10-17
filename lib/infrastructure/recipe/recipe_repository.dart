import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yummy/domain/recipe/recipe.dart';
import 'package:yummy/domain/recipe/recipe_repository.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final CollectionReference _recipesCollectionReference =
      FirebaseFirestore.instance.collection('recipes');

  @override
  Future<List<Recipe>> getRecipes() async {
    List<Recipe> recipes = [];
    QuerySnapshot querySnapshot = await _recipesCollectionReference.get();

    for (var doc in querySnapshot.docs) {
      recipes.add(Recipe.fromJson(doc.data()! as Map<String, dynamic>));
    }
    return recipes;
    // return Future<List<Recipe>>.value([]);
  }
}
