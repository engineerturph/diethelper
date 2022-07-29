import 'package:diethelper/constants.dart';
import 'package:flutter/material.dart';
import 'package:diethelper/Data/foods_list.dart';
import 'package:provider/provider.dart';
import '../../Data/food.dart';
import '../../Screens/recipe_screen.dart';

class RecipeBox extends StatefulWidget {
  RecipeBox({required this.index, required this.mealType});
  Meals mealType;
  int index;
  @override
  State<RecipeBox> createState() => _RecipeBoxState();
}

class _RecipeBoxState extends State<RecipeBox> {
  FoodData foodData = FoodData();

  bool? isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          style: kButtonStyle,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RecipeScreen(widget.index)));
          },
          child: Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      context
                          .watch<FoodData>()
                          .searchedFoods[widget.index]
                          .name,
                      style: kMiddleTextStyle,
                    ),
                    Checkbox(
                        activeColor: Colors.grey,
                        checkColor: Colors.black,
                        value: context
                            .watch<FoodData>()
                            .searchedFoods[widget.index]
                            .isAdded,
                        onChanged: (bool? newValue) {
                          context
                              .read<FoodData>()
                              .addFoodToMeal(widget.index, widget.mealType);
                        })
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${context.watch<FoodData>().searchedFoods[widget.index].curKcal} kcal',
                        style: kMiddleTextStyle.copyWith(color: Colors.blue),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 60.0),
                        child: Text(
                          '${context.watch<FoodData>().searchedFoods[widget.index].curNum} ${context.watch<FoodData>().searchedFoods[widget.index].unitString}',
                          style: kMiddleTextStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Divider(color: Colors.grey)
      ],
    );
  }
}
