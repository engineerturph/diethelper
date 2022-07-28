import 'package:diethelper/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'meal_box.dart';

class MainBodyWidget extends StatefulWidget {
  @override
  State<MainBodyWidget> createState() => _MainBodyWidgetState();
}

class _MainBodyWidgetState extends State<MainBodyWidget> {
  List<Widget> mealArray = [];
  bool isExpanded = false;

  @override
  void initState() {
    mealArray = [
      MealWithRecipe(mealWidget: MealBox('Sabah')),
      MealBox('Öğle'),
      MealBox('Akşam'),
      MealBox('Atıştırmalık'),
    ];
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '1280/2000 kcal',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.white,
                ),
                height: 30.0,
                width: 280.0,
                margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 40.0),
              ),
            ),
            ...mealArray,
          ],
        ),
      ),
    );
  }
}

class MealWithRecipe extends StatefulWidget {
  MealWithRecipe({required this.mealWidget});
  Widget mealWidget;
  @override
  State<MealWithRecipe> createState() => _MealWithRecipeState();
}

class _MealWithRecipeState extends State<MealWithRecipe> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Stack(children: [
        Container(
          height: 90.0,
          decoration: BoxDecoration(
            color: kSecondaryColor,
            borderRadius: BorderRadius.circular(15.0),
          ),
          transform: Matrix4.translationValues(0, 10, 0),
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              bottom: 7.0,
              right: 16.0,
            ),
            child: Container(
              height: 20.0,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '4 urun',
                        style: kMiddleTextStyle.copyWith(fontSize: 15.0),
                      ),
                      SizedBox(
                        height: 20.0,
                        child: TextButton(
                          onPressed: () {
                            print('sa');
                          },
                          child: Icon(
                            FeatherIcons.chevronDown,
                            color: Colors.white,
                            size: 20.0,
                          ),
                          style: kButtonStyle,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        widget.mealWidget
      ]),
    );
  }
}
