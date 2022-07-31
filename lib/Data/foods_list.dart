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
        curKcal: 344,
        proteingr: 13,
        carbohydrategr: 66,
        fatgr: 21,
        meal: Meals.noMeal,
        recipeCode: 0),
    Food(
        name: 'Burger',
        kcal100g: 313,
        curKcal: 313,
        proteingr: 21,
        fatgr: 19,
        carbohydrategr: 60,
        meal: Meals.noMeal,
        recipeCode: 1),
    Food(
        name: 'Donas',
        kcal100g: 310,
        curKcal: 310,
        proteingr: 20,
        carbohydrategr: 60,
        fatgr: 20,
        meal: Meals.noMeal,
        recipeCode: 2)
  ];
  List<Food> searchedFoods = [];
  int totalKcal = 0;
  int limitKcal = 2000;
  get totalLimitRatio {
    int ratio = (totalKcal / limitKcal * 10).round();
    if (ratio == 1) {
      return 0.15;
    }
    if (ratio > 10) {
      ratio = 10;
    }
    return ratio / 10.0;
  }

  get remainingKcal {
    return limitKcal - totalKcal;
  }

  get kcalTargetReached {
    if (limitKcal - totalKcal > 0) {
      return false;
    } else {
      return true;
    }
  }

  void searchFood(String value) {
    searchedFoods = [];
    List<Food> innerTempFoodArr = [];
    innerTempFoodArr = FoodsList.where(
            (food) => food.name.toLowerCase().contains(value.toLowerCase()))
        .toList();
    searchedFoods.addAll(innerTempFoodArr);
    notifyListeners();
  }

  List<Food> tempFoodArr = [];
  adRecipe(Food food) {
    FoodsList.add(food);
    notifyListeners();
  }

  addFoodToMeal(index, Meals mealType) {
    if (searchedFoods[index].meal != Meals.noMeal) {
      searchedFoods[index].meal = Meals.noMeal;
      tempFoodArr.removeWhere((food) => food.meal == Meals.noMeal);
    } else if (mealType == Meals.Morning) {
      searchedFoods[index].meal = Meals.Morning;
      tempFoodArr.add(searchedFoods[index]);
    } else if (mealType == Meals.Afternoon) {
      searchedFoods[index].meal = Meals.Afternoon;
      tempFoodArr.add(searchedFoods[index]);
    } else if (mealType == Meals.Night) {
      searchedFoods[index].meal = Meals.Night;
      tempFoodArr.add(searchedFoods[index]);
    } else if (mealType == Meals.Extra) {
      searchedFoods[index].meal = Meals.Night;
      tempFoodArr.add(searchedFoods[index]);
    }
    notifyListeners();
  }

  saveFoods(Meals mealType) {
    print(tempFoodArr);
    for (var i = 0; i < tempFoodArr.length; i++) {
      Food cloneFood = Food(
        kcal100g: tempFoodArr[i].kcal100g,
        name: tempFoodArr[i].name,
        proteingr: tempFoodArr[i].proteingr,
        fatgr: tempFoodArr[i].fatgr,
        carbohydrategr: tempFoodArr[i].carbohydrategr,
        curKcal: tempFoodArr[i].curKcal,
        meal: tempFoodArr[i].meal,
        recipeCode: tempFoodArr[i].recipeCode,
      );
      cloneFood.curNum = tempFoodArr[i].curNum;
      cloneFood.curUnit = tempFoodArr[i].curUnit;
      mealFoodsMap[mealType]!.add(cloneFood);
    }
    for (var i = 0; i < tempFoodArr.length; i++) {
      tempFoodArr[i].meal = Meals.noMeal;
    }
    tempFoodArr = [];
    print(mealFoodsMap[mealType]);
    notifyListeners();
  }

  calculateKcal() {
    totalKcal = 0;
    for (var i = 0; i < mealFoodsMap[Meals.Morning]!.length; i++) {
      totalKcal += mealFoodsMap[Meals.Morning]![i].curKcal;
    }
    for (var i = 0; i < mealFoodsMap[Meals.Afternoon]!.length; i++) {
      totalKcal += mealFoodsMap[Meals.Afternoon]![i].curKcal;
    }
    for (var i = 0; i < mealFoodsMap[Meals.Night]!.length; i++) {
      totalKcal += mealFoodsMap[Meals.Night]![i].curKcal;
    }
    for (var i = 0; i < mealFoodsMap[Meals.Extra]!.length; i++) {
      totalKcal += mealFoodsMap[Meals.Extra]![i].curKcal;
    }
    notifyListeners();
  }

  calculateRecipeKcal(int index) {
    int TextfieldValue = recipeTextFieldValue;
    int kcal100g = searchedFoods[index].kcal100g;
    if (searchedFoods[index].curUnit == Units.gram) {
      searchedFoods[index].curKcal = (TextfieldValue / 100 * kcal100g).round();
      searchedFoods[index].curNum = TextfieldValue;
    }
    if (searchedFoods[index].curUnit == Units.plate) {
      searchedFoods[index].curKcal =
          (TextfieldValue / 100 * kcal100g * 120).round();
      searchedFoods[index].curNum = TextfieldValue;
    }
    if (searchedFoods[index].curUnit == Units.portion) {
      searchedFoods[index].curKcal =
          (TextfieldValue / 100 * kcal100g * 200).round();
      searchedFoods[index].curNum = TextfieldValue;
    }
    notifyListeners();
  }

  //Animation datas in FoodData
  //Recipe screen animation datas
  int recipeTextFieldValue = 100;
  void changeTextField(int value) {
    recipeTextFieldValue = value;
    notifyListeners();
  }

  //Recipe type chooser
  String dropdownValue = 'Grams';

  void DropdownButtonFunction(String? newValue, int index) {
    dropdownValue = newValue!;
    if (newValue == 'Grams') {
      searchedFoods[index].curUnit = Units.gram;
    }
    if (newValue == 'Portion(200g)') {
      searchedFoods[index].curUnit = Units.portion;
    }
    if (newValue == 'Plate(120g)') {
      searchedFoods[index].curUnit = Units.plate;
    }
    notifyListeners();
  }

  List<bool> deleteList = [];
  List<int> deleteIndexList = [];
  get deleteValues {
    for (var i = 0; i < FoodsList.length; i++) {
      deleteList.add(false);
    }
    return deleteList;
  }

  addToDelete(index) {
    if (deleteList[index] == false) {
      deleteList[index] = true;
      deleteIndexList.add(index);
    } else {
      deleteList[index] = false;
      deleteIndexList.remove(index);
    }
    print(deleteIndexList);
    notifyListeners();
  }

  deleteFromList() {
    for (var i = 0; i < deleteIndexList.length; i++) {
      FoodsList.removeAt(deleteIndexList[i]);
    }
  }
}
