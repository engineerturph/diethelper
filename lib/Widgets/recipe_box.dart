import 'package:diethelper/constants.dart';
import 'package:flutter/material.dart';
import 'package:diethelper/Data/foods_list.dart';

class RecipeBox extends StatefulWidget {
  RecipeBox({required this.index});
  int index;

  @override
  State<RecipeBox> createState() => _RecipeBoxState();
}

class _RecipeBoxState extends State<RecipeBox> {
  bool? isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              FoodsList[widget.index].name,
              style: kMiddleTextStyle,
            ),
            Checkbox(
                activeColor: Colors.grey,
                checkColor: Colors.black,
                value: FoodsList[widget.index].isAdded,
                onChanged: (bool? newValue) {
                  setState(() {
                    FoodsList[widget.index].isAdded = newValue ?? false;
                  });
                })
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${FoodsList[widget.index].kcalList[0]} kcal',
                style: kMiddleTextStyle.copyWith(color: Colors.blue),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 60.0),
                child: Text(
                  '1 ${FoodsList[widget.index].typeList[0]}',
                  style: kMiddleTextStyle,
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
