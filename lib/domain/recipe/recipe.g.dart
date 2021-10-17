// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recipe _$RecipeFromJson(Map<String, dynamic> json) => Recipe(
      id: json['id'] as String?,
      title: json['title'] as String,
      imageUrl: json['image_url'] as String,
      description: json['description'] as String,
      prepTimeMinutes: json['prepTimeMinutes'] as int,
      cookTimeMinutes: json['cookTimeMinutes'] as int,
      servings: json['servings'] as String,
      instructions: (json['instructions'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
      ),
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$RecipeToJson(Recipe instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['title'] = instance.title;
  val['image_url'] = instance.imageUrl;
  val['description'] = instance.description;
  val['prepTimeMinutes'] = instance.prepTimeMinutes;
  val['cookTimeMinutes'] = instance.cookTimeMinutes;
  val['servings'] = instance.servings;
  val['instructions'] = instance.instructions;
  val['ingredients'] = instance.ingredients;
  return val;
}
