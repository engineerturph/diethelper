import 'package:diethelper/constants.dart';
import 'package:flutter/material.dart';
import 'package:diethelper/Data/foods_list.dart';

import '../Screens/recipe_screen.dart';

class RecipeBox extends StatefulWidget {
  RecipeBox({required this.index});
  int index;

  @override
  State<RecipeBox> createState() => _RecipeBoxState();
}

class _RecipeBoxState extends State<RecipeBox> {
  get kcalNum {
    return FoodsList[widget.index].kcal100g?[1];
  }

  String? kcalType(kcalNo) {
    if (kcalNo == FoodsList[widget.index].kcal100g?[1]) {
      return 'g';
    }
  }

  bool? isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          style: kButtonStyle,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => RecipeScreen()));
          },
          child: Container(
            child: Column(
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
                        '$kcalNum kcal',
                        style: kMiddleTextStyle.copyWith(color: Colors.blue),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 60.0),
                        child: Text(
                          '100 ${kcalType(kcalNum)}',
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
