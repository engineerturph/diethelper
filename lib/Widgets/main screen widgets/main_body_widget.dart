import 'package:diethelper/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';
import '../../Data/animation_attr.dart';
import '../../Data/food.dart';
import '../../Data/foods_list.dart';
import 'meal_box.dart';
import 'recipe_box_main.dart';

class MainBodyWidget extends StatefulWidget {
  @override
  State<MainBodyWidget> createState() => _MainBodyWidgetState();
}

class _MainBodyWidgetState extends State<MainBodyWidget> {
  List<Widget> mealArray = [
    MealWithRecipe(
        mealWidget: MealBox(
      innerText: 'Breakfast',
      mealData: Meals.Morning,
    )),
    MealBox(
      innerText: 'Lunch',
      mealData: Meals.Afternoon,
    ),
    MealBox(
      innerText: 'Dinner',
      mealData: Meals.Night,
    ),
    MealBox(
      innerText: 'Extra',
      mealData: Meals.Extra,
    ),
  ];
  bool isExpanded = false;

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

class MealWithRecipe extends StatelessWidget {
  MealWithRecipe({required this.mealWidget});

  Widget mealWidget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Stack(children: [
        Container(
          height: context.watch<AnimationAttrData>().columnHeight + 70.0,
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
              height: context.watch<AnimationAttrData>().columnHeight,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '4 foods',
                        style: kMiddleTextStyle.copyWith(fontSize: 15.0),
                      ),
                      SizedBox(
                        height: 20.0,
                        child: ExtendButton(),
                      )
                    ],
                  ),
                  ...context.watch<AnimationAttrData>().columnThings,
                ],
              ),
            ),
          ),
        ),
        mealWidget
      ]),
    );
  }
}

//context.watch<AnimationAttrData>().columnThings
class ExtendButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (!context.read<AnimationAttrData>().expanded) {
          int length = context.read<FoodData>().BreakFastFoods.length;
          for (var i = 0;
              i < context.read<FoodData>().BreakFastFoods.length;
              i++) {
            context.read<AnimationAttrData>().columnThings.add(RecipeBoxMain(
                  index: i,
                ));
          }
          context.read<AnimationAttrData>().columnHeight =
              20 + 64 * length.toDouble();
          context.read<AnimationAttrData>().expandIcon = FeatherIcons.chevronUp;
          context.read<AnimationAttrData>().expanded = true;
        } else if (context.read<AnimationAttrData>().expanded) {
          for (var i = 0;
              i < context.read<FoodData>().BreakFastFoods.length;
              i++) {
            context.read<AnimationAttrData>().columnThings.removeAt(0);
          }
          context.read<AnimationAttrData>().columnHeight = 20.0;
          context.read<AnimationAttrData>().expandIcon =
              FeatherIcons.chevronDown;
          context.read<AnimationAttrData>().expanded = false;
        }
        context.read<AnimationAttrData>().notifyListeners();
      },
      child: Icon(
        context.watch<AnimationAttrData>().expandIcon,
        color: Colors.white,
        size: 20.0,
      ),
      style: kButtonStyle,
    );
  }
}
