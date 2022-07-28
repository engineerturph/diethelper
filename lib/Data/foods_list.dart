import 'package:flutter/foundation.dart';
import 'food.dart';

class FoodData extends ChangeNotifier {
  var mealFoodsMap = {
    Meals.Morning: <Food>[],
    Meals.Afternoon: <Food>[],
    Meals.Night: <Food>[],
    Meals.Extra: <Food>[]
  };
  List<Food> BreakFastFoods = [];
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

  addFoodToMeal(index, Meals mealType) {
    if (FoodsList[index].meal != Meals.noMeal) {
      FoodsList[index].meal = Meals.noMeal;
      mealFoodsMap[mealType]!.removeAt(mealFoodsMap[mealType]!.length - 1);
      print('b');
    } else if (mealType == Meals.Morning) {
      FoodsList[index].meal = Meals.Morning;
      mealFoodsMap[mealType]!.add(FoodsList[index]);
      print(mealFoodsMap[mealType]);
    } else if (mealType == Meals.Afternoon) {
      FoodsList[index].meal = Meals.Afternoon;
      mealFoodsMap[mealType]!.add(FoodsList[index]);
    } else if (mealType == Meals.Night) {
      FoodsList[index].meal = Meals.Night;
      mealFoodsMap[mealType]!.add(FoodsList[index]);
    } else if (mealType == Meals.Extra) {
      FoodsList[index].meal = Meals.Night;
      mealFoodsMap[mealType]!.add(FoodsList[index]);
    }
    notifyListeners();
  }

  resetFoods() {
    for (var i = 0; i < FoodsList.length; i++) {
      FoodsList[i].meal = Meals.noMeal;
    }
    notifyListeners();
  }
}
