import 'package:diethelper/Widgets/main%20screen%20widgets/show_calories_taken.dart';
import 'package:diethelper/constants.dart';
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
                '${context.watch<FoodData>().totalKcal}/${context.watch<FoodData>().limitKcal} kcal',
                style: kMiddleTextStyle),
            Text(
              'Remaining = ${context.watch<FoodData>().remainingKcal} kcal',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
              child: ShowCaloriesTaken(
                totalWidth: 280.0,
              ),
            ),
            ListView(
              shrinkWrap: true,
              children: [
                context
                            .watch<FoodData>()
                            .mealFoodsMap[Meals.Morning]
                            ?.isEmpty ??
                        false
                    ? MealBox(
                        innerText: 'Breakfast',
                        mealData: Meals.Morning,
                      )
                    : MealWithRecipe(
                        mealValue: Meals.Morning,
                        mealWidget: MealBox(
                          innerText: 'Breakfast',
                          mealData: Meals.Morning,
                        )),
                context
                            .watch<FoodData>()
                            .mealFoodsMap[Meals.Afternoon]
                            ?.isEmpty ??
                        false
                    ? MealBox(
                        innerText: 'Lunch',
                        mealData: Meals.Morning,
                      )
                    : MealWithRecipe(
                        mealValue: Meals.Afternoon,
                        mealWidget: MealBox(
                          innerText: 'Lunch',
                          mealData: Meals.Morning,
                        )),
                context.watch<FoodData>().mealFoodsMap[Meals.Night]?.isEmpty ??
                        false
                    ? MealBox(
                        innerText: 'Dinner',
                        mealData: Meals.Morning,
                      )
                    : MealWithRecipe(
                        mealValue: Meals.Night,
                        mealWidget: MealBox(
                          innerText: 'Dinner',
                          mealData: Meals.Morning,
                        )),
                context.watch<FoodData>().mealFoodsMap[Meals.Extra]?.isEmpty ??
                        false
                    ? MealBox(
                        innerText: 'Extra',
                        mealData: Meals.Morning,
                      )
                    : MealWithRecipe(
                        mealValue: Meals.Extra,
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
