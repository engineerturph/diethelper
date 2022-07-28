import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Data/foods_list.dart';
import '../../constants.dart';

class RecipeBoxMain extends StatelessWidget {
  RecipeBoxMain({required this.index});
  int index;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      context.watch<FoodData>().FoodsList[index].name,
                      style: kMiddleTextStyle,
                    ),
                    Checkbox(
                        activeColor: Colors.grey,
                        checkColor: Colors.black,
                        value:
                            context.watch<FoodData>().FoodsList[index].isAdded,
                        onChanged: (bool? newValue) {
                          context.read<FoodData>().addFoodToMeal(index);
                        })
                  ],
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
