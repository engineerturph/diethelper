import 'package:diethelper/Screens/add_recipe_screen.dart';
import 'package:diethelper/constants.dart';
import '../../Data/food.dart';
import 'recipe_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';
import '../../Data/foods_list.dart';

class MealBodyWidget extends StatefulWidget {
  MealBodyWidget({required this.curMeal});
  Meals curMeal;
  @override
  State<MealBodyWidget> createState() => _MealBodyWidgetState();
}

class _MealBodyWidgetState extends State<MealBodyWidget> {
  String? getname() {
    if (widget.curMeal == Meals.Extra) {
      return 'Extra';
    } else if (widget.curMeal == Meals.Morning) {
      return 'Breakfast';
    } else if (widget.curMeal == Meals.Afternoon) {
      return 'Lunch';
    } else if (widget.curMeal == Meals.Night) {
      return 'Dinner';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          flex: 6,
          child: Container(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      getname() ?? '',
                      style: kMiddleTextStyle,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        children: [
                          TextField(
                            decoration: kTextFieldDecoration,
                            autofocus: true,
                            textAlign: TextAlign.center,
                            maxLines: 1,
                          ),
                          Flexible(
                            fit: FlexFit.tight,
                            child: ListView.builder(
                              itemBuilder: <Widget>(context, index) {
                                return RecipeBox(
                                  index: index,
                                  mealType: widget.curMeal,
                                );
                              },
                              itemCount:
                                  context.watch<FoodData>().FoodsList.length,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            decoration: BoxDecoration(
              color: kMainColor,
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: kSecondaryColor,
            borderRadius: BorderRadius.circular(25.0),
          ),
          width: 200.0,
          height: 80.0,
          child: TextButton(
            style: kButtonStyle,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddRecipeScreen()));
            },
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Text(
                    'Add Recipe',
                    style: kMiddleTextStyle,
                  ),
                ),
                Icon(
                  FeatherIcons.plus,
                  color: Colors.white,
                  size: 40.0,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
