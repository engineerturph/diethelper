enum Meals { noMeal, Morning, Afternoon, Night, Extra }

class Food {
  Food(
      {required this.name,
      kcal100g,
      required this.proteingr,
      required this.fatgr,
      required this.carbohydrategr,
      slicegr,
      portiongr,
      required this.meal}) {
    this.kcal100g?[1] = kcal100g;
    this.portiongr?[1] = portiongr;
    this.slicegr?[1] = slicegr;
  }
  final String name;
  Meals meal = Meals.noMeal;
  List? kcal100g = ['g', 0];
  int proteingr;
  int carbohydrategr;
  int fatgr;
  List? slicegr = ['Slice', 0];
  List? portiongr = ['Portion', 0];
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
