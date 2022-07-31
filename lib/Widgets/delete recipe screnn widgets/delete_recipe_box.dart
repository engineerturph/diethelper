import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Data/foods_list.dart';
import '../../constants.dart';

class DeleteRecipeBox extends StatelessWidget {
  DeleteRecipeBox({required this.index});

  int index;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
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
                      value: context.watch<FoodData>().deleteValues[index],
                      onChanged: (bool? newValue) {
                        context.read<FoodData>().addToDelete(index);
                      })
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${context.watch<FoodData>().FoodsList[index].curKcal} kcal',
                      style: kMiddleTextStyle.copyWith(color: Colors.blue),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 60.0),
                      child: Text(
                        '${context.watch<FoodData>().FoodsList[index].curNum} ${context.watch<FoodData>().FoodsList[index].unitString}',
                        style: kMiddleTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(color: Colors.grey)
      ],
    );
  }
}
