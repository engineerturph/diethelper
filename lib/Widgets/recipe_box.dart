import 'package:diethelper/constants.dart';
import 'package:flutter/material.dart';
import 'package:diethelper/Data/foods_list.dart';
import 'package:provider/provider.dart';
import '../Screens/recipe_screen.dart';

class RecipeBox extends StatefulWidget {
  RecipeBox({required this.index});
  int index;
  @override
  State<RecipeBox> createState() => _RecipeBoxState();
}

class _RecipeBoxState extends State<RecipeBox> {
  FoodData foodData = FoodData();
  get kcalNum {
    return context.watch<FoodData>().FoodsList[widget.index].kcal100g;
  }

  String? kcalType(kcalNo) {
    if (kcalNo == foodData.FoodsList[widget.index].kcal100g) {
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
                      context.watch<FoodData>().FoodsList[widget.index].name,
                      style: kMiddleTextStyle,
                    ),
                    Checkbox(
                        activeColor: Colors.grey,
                        checkColor: Colors.black,
                        value: context
                            .watch<FoodData>()
                            .FoodsList[widget.index]
                            .isAdded,
                        onChanged: (bool? newValue) {
                          setState(() {
                            context
                                .watch<FoodData>()
                                .FoodsList[widget.index]
                                .isAdded = newValue ?? false;
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
                        '${context.watch<FoodData>().FoodsList[widget.index].kcal100g} kcal',
                        style: kMiddleTextStyle.copyWith(color: Colors.blue),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 60.0),
                        child: Text(
                          '100 ${kcalType(context.watch<FoodData>().FoodsList[widget.index].kcal100g)}',
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
