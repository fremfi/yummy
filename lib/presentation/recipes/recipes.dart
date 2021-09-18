import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yummy/routes/constants.dart';

class RecipesScreen extends StatelessWidget {
  const RecipesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yummy'),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.toNamed(recipeDetailsRoute);
          },
          child: const Text('Go to details'),
        ),
      ),
    );
  }
}
