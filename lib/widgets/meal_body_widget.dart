import 'package:diethelper/constants.dart';
import 'package:diethelper/widgets/recipe_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class MealBodyWidget extends StatefulWidget {
  const MealBodyWidget({Key? key}) : super(key: key);

  @override
  State<MealBodyWidget> createState() => _MealBodyWidgetState();
}

class _MealBodyWidgetState extends State<MealBodyWidget> {
  List<Widget> FoodsList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FoodsList.add(RecipeBox());
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
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Atistirmalik',
                        style: kMiddleTextStyle,
                      ),
                      Icon(
                        FeatherIcons.chevronLeft,
                        color: Colors.white,
                        size: 40.0,
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        TextField(
                          decoration: kTextFieldDecoration,
                          autofocus: true,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                        ),
                        ListView(
                          shrinkWrap: true,
                          children: FoodsList,
                        )
                      ],
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
            onPressed: () {},
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
