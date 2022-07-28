import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Data/foods_list.dart';
import '../../constants.dart';

class RecipeBoxMain extends StatefulWidget {
  RecipeBoxMain({required this.index, required this.mealValue});
  int index;
  String mealValue;
  @override
  State<RecipeBoxMain> createState() => _RecipeBoxMainState();
}

class _RecipeBoxMainState extends State<RecipeBoxMain> {
  String? kcalType(kcalNo) {
    if (kcalNo ==
        context
            .watch<FoodData>()
            .mealFoodsMap[widget.mealValue]![widget.index]
            .kcal100g) {
      return 'g';
    }
  }

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
                      '100 ${kcalType(context.read<FoodData>().mealFoodsMap[widget.mealValue]![widget.index].kcal100g)} ${context.read<FoodData>().mealFoodsMap[widget.mealValue]![widget.index].name}',
                      style: kMiddleTextStyle,
                    ),
                    Text(
                      '${context.read<FoodData>().mealFoodsMap[widget.mealValue]![widget.index].kcal100g} kcal',
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
