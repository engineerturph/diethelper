import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../constants.dart';

class RecipeScreen extends StatefulWidget {
  const RecipeScreen({Key? key}) : super(key: key);

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            child: ListView(
              shrinkWrap: true,
              children: [
                Text('Pizza'),
                Text('Add to meal'),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Row(
                    children: [
                      Icon(FeatherIcons.plus),
                      Expanded(
                        child: TextField(
                          decoration: kTextFieldDecoration.copyWith(
                              hintText: 'Recipe Name'),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Row(
                    children: [
                      Icon(FeatherIcons.chevronLeft),
                      Expanded(
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: kSecondaryColor,
                            ),
                            width: 200.0,
                            height: 40.0,
                            child: MyStatefulWidget()),
                      ),
                    ],
                  ),
                ),
                Container()
              ],
            ),
            decoration: BoxDecoration(
              color: kMainColor,
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
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
