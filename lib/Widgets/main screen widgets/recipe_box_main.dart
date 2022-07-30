import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Data/food.dart';
import '../../Data/foods_list.dart';
import '../../constants.dart';

class RecipeBoxMain extends StatefulWidget {
  RecipeBoxMain({required this.index, required this.mealValue});
  int index;
  Meals mealValue;
  @override
  State<RecipeBoxMain> createState() => _RecipeBoxMainState();
}

class _RecipeBoxMainState extends State<RecipeBoxMain> {
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
                      '${context.watch<FoodData>().mealFoodsMap[widget.mealValue]![widget.index].curNum} ${context.read<FoodData>().mealFoodsMap[widget.mealValue]![widget.index].unitString} ${context.read<FoodData>().mealFoodsMap[widget.mealValue]![widget.index].name}',
                      style: kMiddleTextStyle,
                    ),
                    Text(
                      '${context.read<FoodData>().mealFoodsMap[widget.mealValue]![widget.index].curKcal} kcal',
                      style: kMiddleTextStyle.copyWith(color: Colors.blue),
                    )
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
