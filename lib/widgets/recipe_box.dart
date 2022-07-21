import 'package:flutter/material.dart';

class RecipeBox extends StatefulWidget {
  const RecipeBox({Key? key}) : super(key: key);

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
            Text('Pizza'),
            Checkbox(
                checkColor: Colors.black,
                value: isChecked,
                onChanged: (bool? newValue) {
                  setState(() {
                    isChecked = newValue;
                  });
                })
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text('186 kcal'), Text('1 kase')],
        ),
        Divider(color: Colors.grey)
      ],
    );
  }
}
