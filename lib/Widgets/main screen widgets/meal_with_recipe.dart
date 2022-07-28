import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';
import '../../Data/animation_attr.dart';
import '../../Data/foods_list.dart';
import '../../constants.dart';
import 'recipe_box_main.dart';

class MealWithRecipe extends StatefulWidget {
  MealWithRecipe({required this.mealWidget, required this.mealValue});
  String mealValue;
  Widget mealWidget;

  @override
  State<MealWithRecipe> createState() => _MealWithRecipeState();
}

class _MealWithRecipeState extends State<MealWithRecipe> {
  void onClick() {
    if (!context.read<AnimationAttrData>().mapExpanded[widget.mealValue]!) {
      int length =
          context.read<FoodData>().mealFoodsMap[widget.mealValue]!.length;
      for (var i = 0; i < length; i++) {
        context
            .read<AnimationAttrData>()
            .mapExpandingColumn[widget.mealValue]!
            .add(RecipeBoxMain(
              index: i,
              mealValue: widget.mealValue,
            ));
      }
      context.read<AnimationAttrData>().mapColumnHeight[widget.mealValue] =
          20 + 39 * length.toDouble();
      context.read<AnimationAttrData>().mapExpandIcon[widget.mealValue] =
          FeatherIcons.chevronUp;
      context.read<AnimationAttrData>().mapExpanded[widget.mealValue] = true;
    } else if (context
        .read<AnimationAttrData>()
        .mapExpanded[widget.mealValue]!) {
      for (var i = 0;
          i < context.read<FoodData>().mealFoodsMap[widget.mealValue]!.length;
          i++) {
        context
            .read<AnimationAttrData>()
            .mapExpandingColumn[widget.mealValue]!
            .removeAt(0);
      }
      context.read<AnimationAttrData>().mapColumnHeight[widget.mealValue] =
          20.0;
      context.read<AnimationAttrData>().mapExpandIcon[widget.mealValue] =
          FeatherIcons.chevronDown;
      context.read<AnimationAttrData>().mapExpanded[widget.mealValue] = false;
    }
    context.read<AnimationAttrData>().notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Stack(children: [
        Container(
          height: context
                  .read<AnimationAttrData>()
                  .mapColumnHeight[widget.mealValue]! +
              70.0,
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
              height: context
                  .read<AnimationAttrData>()
                  .mapColumnHeight[widget.mealValue],
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${context.watch<FoodData>().mealFoodsMap[widget.mealValue]?.length} foods',
                        style: kMiddleTextStyle.copyWith(fontSize: 15.0),
                      ),
                      SizedBox(
                        height: 20.0,
                        child: TextButton(
                          onPressed: onClick,
                          child: Icon(
                            context
                                .read<AnimationAttrData>()
                                .mapExpandIcon[widget.mealValue],
                            color: Colors.white,
                            size: 20.0,
                          ),
                          style: kButtonStyle,
                        ),
                      )
                    ],
                  ),
                  ...context
                      .watch<AnimationAttrData>()
                      .mapExpandingColumn[widget.mealValue]!,
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
