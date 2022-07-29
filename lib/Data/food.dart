enum Meals { noMeal, Morning, Afternoon, Night, Extra }

enum Units { gram, slice, portion }

class Food {
  Food(
      {required this.name,
      required this.kcal100g,
      required this.proteingr,
      required this.fatgr,
      required this.carbohydrategr,
      required this.curKcal,
      required this.meal,
      this.recipeCode});
  final String name;
  Meals meal = Meals.noMeal;
  int kcal100g = 0;
  int curKcal = 0;
  int proteingr;
  int carbohydrategr;
  int fatgr;
  int curNum = 100;
  Units curUnit = Units.gram;
  int? recipeCode;
  get isAdded {
    if (meal == Meals.noMeal) {
      return false;
    } else {
      return true;
    }
  }

  set isAdded(setter) {
    if (setter == true) {
      meal = Meals.Extra;
    } else {
      meal = Meals.noMeal;
    }
  }

  get unitString {
    if (curUnit == Units.gram) {
      return 'g';
    }
    if (curUnit == Units.slice) {
      return 'slice';
    }
    if (curUnit == Units.portion) {
      return 'portion';
    }
  }
}
