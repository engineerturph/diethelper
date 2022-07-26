enum Meals { noMeal, Morning, Afternoon, Night, Extra }

class Food {
  Food({
    required this.name,
    required this.kcal100g,
    required this.proteingr,
    required this.fatgr,
    required this.carbohydrategr,
    this.slicegr,
    this.portiongr,
    required this.meal,
    this.recipeCode,
  });
  final String name;
  Meals meal = Meals.noMeal;
  int kcal100g = 0;
  int proteingr;
  int carbohydrategr;
  int fatgr;
  int? slicegr = 0;
  int? portiongr = 0;
  int? recipeCode = 0; //Simdilik ise yaramiyor ama ilerde yarar belki
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
}
