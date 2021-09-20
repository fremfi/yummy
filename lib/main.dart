import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yummy/routes/constants.dart';
import 'package:yummy/routes/get_pages.dart';

import 'getx_initial_bindings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Yummy',
      initialBinding: InitialBinding(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: recipesRoute,
      getPages: getGetPages(),
    );
  }
}
