import 'package:json_annotation/json_annotation.dart';

part 'recipe.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class Recipe {
  final String? id;
  final String title;
  @JsonKey(name: "image_url")
  final String imageUrl;
  final String description;
  Recipe({
    this.id,
    required this.title,
    required this.imageUrl,
    required this.description,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
  Map<String, dynamic> toJson() => _$RecipeToJson(this);
}
