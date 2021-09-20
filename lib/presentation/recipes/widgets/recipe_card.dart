import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:yummy/domain/recipe/recipe.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;

  const RecipeCard({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: PhysicalModel(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          elevation: 10,
          child: Stack(
            children: [
              SizedBox(
                height: 300,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: <Widget>[
                    const Center(
                        child: CircularProgressIndicator(
                      color: Colors.grey,
                    )),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: recipe.imageUrl,
                        fit: BoxFit.cover,
                        height: 300,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 10,
                bottom: 20,
                // height: 100,
                child: Container(
                  // height: 100,
                  width: MediaQuery.of(context).size.width - 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          recipe.title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
