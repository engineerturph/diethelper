import 'package:flutter/material.dart';

import '../../constants.dart';

class RecipeTypeChooserDropdownButton extends StatefulWidget {
  const RecipeTypeChooserDropdownButton({Key? key}) : super(key: key);

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
      value: dropdownValue,
      style: kMiddleTextStyle,
      underline: Container(
        height: 0,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['Grams', '1 Portion(200g)', '1 Plate']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Center(child: Text(value)),
        );
      }).toList(),
    );
  }
}
