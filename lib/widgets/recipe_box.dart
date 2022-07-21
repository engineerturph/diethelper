import 'package:diethelper/constants.dart';
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
            Text(
              'Pizza',
              style: kMiddleTextStyle,
            ),
            Checkbox(
                activeColor: Colors.grey,
                checkColor: Colors.black,
                value: isChecked,
                onChanged: (bool? newValue) {
                  setState(() {
                    isChecked = newValue;
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
                '186 kcal',
                style: kMiddleTextStyle.copyWith(color: Colors.blue),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 60.0),
                child: Text(
                  '1 kase',
                  style: kMiddleTextStyle,
                ),
              )
            ],
          ),
        ),
        Divider(color: Colors.grey)
      ],
    );
  }
}
