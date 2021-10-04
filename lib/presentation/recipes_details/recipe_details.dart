import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:yummy/domain/recipe/recipe.dart';

class RecipeDetailsScreen extends StatelessWidget {
  const RecipeDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Recipe recipe = Get.arguments as Recipe;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            snap: true,
            floating: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(recipe.title, textScaleFactor: 1),
              background: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: recipe.imageUrl,
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height / 3 + 20,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      recipe.description,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 20),
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "PREP TIME: ${recipe.prepTimeMinutes} minutes",
                          style: const TextStyle(fontSize: 16),
                        ),
                        Text(
                          "COOK TIME: ${recipe.cookTimeMinutes} minutes",
                          style: const TextStyle(fontSize: 16),
                        ),
                        Text(
                          "SERVINGS: ${recipe.servings}",
                          style: const TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "INGREDIENTS",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Markdown(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      data: recipe.ingredients
                          .map((x) => "- $x\n")
                          .reduce((x, y) => "$x$y"),
                      styleSheet: MarkdownStyleSheet(
                        p: const TextStyle(fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "INSTRUCTIONS",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Markdown(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      data: recipe.instructions
                          .map((x) =>
                              "${recipe.instructions.indexOf(x) + 1}. $x\n")
                          .reduce((x, y) => "$x$y"),
                      styleSheet: MarkdownStyleSheet(
                        p: const TextStyle(fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
