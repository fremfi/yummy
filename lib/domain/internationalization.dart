import 'package:get/get.dart';

class YummyTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          'minutes': 'minutes',
          'prep time': 'prep time',
          'cook time': 'cook time',
          'servings': 'servings',
          'ingredients': 'ingredients',
          'instructions': 'instructions',
        },
        'fr': {
          'minutes': 'minutes',
          'prep time': 'temps de préparation',
          'cook time': 'temps de cuisson',
          'servings': 'portions',
          'ingredients': 'ingrédients',
          'instructions': 'instructions',
        }
      };
}
