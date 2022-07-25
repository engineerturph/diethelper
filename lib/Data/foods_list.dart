import 'package:flutter/foundation.dart';
import 'food.dart';
import 'package:provider/provider.dart';

class FoodData extends ChangeNotifier {
  List<Food> FoodsList = [
    Food(
        name: 'Pizza',
        kcal100g: 344,
        proteingr: 13,
        carbohydrategr: 66,
        fatgr: 21,
        meal: Meals.noMeal),
    Food(
      name: 'Burger',
      kcal100g: 313,
      proteingr: 21,
      fatgr: 19,
      carbohydrategr: 60,
      meal: Meals.noMeal,
    ),
    Food(
      name: 'Donas',
      kcal100g: 310,
      proteingr: 20,
      carbohydrategr: 60,
      fatgr: 20,
      meal: Meals.noMeal,
    )
  ];
}
