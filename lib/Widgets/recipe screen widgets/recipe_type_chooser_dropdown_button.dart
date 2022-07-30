import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Data/foods_list.dart';
import '../../constants.dart';

class RecipeTypeChooserDropdownButton extends StatefulWidget {
  RecipeTypeChooserDropdownButton(this.index);
  int index;

  @override
  State<RecipeTypeChooserDropdownButton> createState() =>
      _RecipeTypeChooserDropdownButtonState();
}

class _RecipeTypeChooserDropdownButtonState
    extends State<RecipeTypeChooserDropdownButton> {
  String dropdownValue = 'Grams';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      alignment: Alignment.center,
      value: context.watch<FoodData>().dropdownValue,
      style: kMiddleTextStyle,
      underline: Container(
        height: 0,
      ),
      onChanged: (value) {
        context.read<FoodData>().DropdownButtonFunction(value, widget.index);
      },
      items: <String>['Grams', 'Portion(200g)', 'Plate(120g)']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Center(child: Text(value)),
        );
      }).toList(),
    );
  }
}
