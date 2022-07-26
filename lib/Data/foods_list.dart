import 'package:flutter/foundation.dart';
import 'food.dart';

class FoodData extends ChangeNotifier {
  List<Food> FoodsList = [
    Food(
        name: 'Pizza',
        kcal100g: 344,
        proteingr: 13,
        carbohydrategr: 66,
        fatgr: 21,
        meal: Meals.noMeal,
        recipeCode: 0),
    Food(
        name: 'Burger',
        kcal100g: 313,
        proteingr: 21,
        fatgr: 19,
        carbohydrategr: 60,
        meal: Meals.noMeal,
        recipeCode: 1),
    Food(
        name: 'Donas',
        kcal100g: 310,
        proteingr: 20,
        carbohydrategr: 60,
        fatgr: 20,
        meal: Meals.noMeal,
        recipeCode: 2)
  ];
  adRecipe(Food food) {
    FoodsList.add(food);
    notifyListeners();
  }

  addFoodToMeal(index) {
    if (FoodsList[index].meal != Meals.noMeal) {
      FoodsList[index].meal = Meals.noMeal;
    } else {
      FoodsList[index].meal = Meals.Extra;
    }
    notifyListeners();
  }
}
