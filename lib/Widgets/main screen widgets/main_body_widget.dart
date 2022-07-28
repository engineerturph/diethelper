import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Data/food.dart';
import '../../Data/foods_list.dart';
import 'meal_box.dart';
import 'meal_with_recipe.dart';

class MainBodyWidget extends StatefulWidget {
  @override
  State<MainBodyWidget> createState() => _MainBodyWidgetState();
}

class _MainBodyWidgetState extends State<MainBodyWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '1280/2000 kcal',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.white,
                ),
                height: 30.0,
                width: 280.0,
                margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 40.0),
              ),
            ),
            ListView(
              shrinkWrap: true,
              children: [
                context
                            .read<FoodData>()
                            .mealFoodsMap['breakfastFoods']
                            ?.isEmpty ??
                        false
                    ? MealBox(
                        innerText: 'Breakfast',
                        mealData: Meals.Morning,
                      )
                    : MealWithRecipe(
                        mealValue: 'breakfastFoods',
                        mealWidget: MealBox(
                          innerText: 'Breakfast',
                          mealData: Meals.Morning,
                        )),
                context.read<FoodData>().mealFoodsMap['lunchFoods']?.isEmpty ??
                        false
                    ? MealBox(
                        innerText: 'Lunch',
                        mealData: Meals.Morning,
                      )
                    : MealWithRecipe(
                        mealValue: 'lunchFoods',
                        mealWidget: MealBox(
                          innerText: 'Lunch',
                          mealData: Meals.Morning,
                        )),
                context.read<FoodData>().mealFoodsMap['dinnerFoods']?.isEmpty ??
                        false
                    ? MealBox(
                        innerText: 'Dinner',
                        mealData: Meals.Morning,
                      )
                    : MealWithRecipe(
                        mealValue: 'dinnerFoods',
                        mealWidget: MealBox(
                          innerText: 'Dinner',
                          mealData: Meals.Morning,
                        )),
                context.read<FoodData>().mealFoodsMap['extraFoods']?.isEmpty ??
                        false
                    ? MealBox(
                        innerText: 'Extra',
                        mealData: Meals.Morning,
                      )
                    : MealWithRecipe(
                        mealValue: 'extraFoods',
                        mealWidget: MealBox(
                          innerText: 'Extra',
                          mealData: Meals.Morning,
                        )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
