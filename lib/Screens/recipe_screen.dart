import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:diethelper/Data/foods_list.dart';
import 'package:provider/provider.dart';
import '../Widgets/recipe screen widgets/tile_box_recipe.dart';
import '../Widgets/recipe screen widgets/recipe_type_chooser_dropdown_button.dart';
import '../constants.dart';

class RecipeScreen extends StatefulWidget {
  RecipeScreen(this.index);
  int index;
  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  void onPressedFunc() {
    context.read<FoodData>().calculateRecipeKcal(widget.index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    context.watch<FoodData>().FoodsList[widget.index].name,
                    style: kMiddleTextStyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Add to meal',
                    style: kMiddleTextStyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Icon(FeatherIcons.plus),
                      ),
                      Expanded(
                        child: TextFormField(
                          initialValue: context
                              .watch<FoodData>()
                              .recipeTextFieldValue
                              .toString(),
                          decoration: kTextFieldDecoration,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          onChanged: (value) {
                            if (value == '') {
                              return;
                            }
                            context
                                .read<FoodData>()
                                .changeTextField(int.parse(value));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Icon(FeatherIcons.moreVertical),
                      ),
                      Expanded(
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: kSecondaryColor,
                            ),
                            height: 40.0,
                            child: Center(
                                child: RecipeTypeChooserDropdownButton(
                                    widget.index))),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextButton(
                      style: kButtonStyle,
                      onPressed: onPressedFunc,
                      child: Container(
                        width: double.infinity,
                        height: 50.0,
                        color: kSecondaryColor,
                        child: Center(
                          child: Text(
                            'SAVE',
                            style: kMiddleTextStyle,
                          ),
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    child: GridView.count(
                      physics: NeverScrollableScrollPhysics(),
                      childAspectRatio: 2,
                      crossAxisCount: 2,
                      children: [
                        TileBoxRecipe(
                          header: 'Calories',
                          footer:
                              '${context.watch<FoodData>().FoodsList[widget.index].curKcal}kcal',
                        ),
                        TileBoxRecipe(
                          header: 'Fat',
                          footer:
                              '${context.watch<FoodData>().FoodsList[widget.index].fatgr}gr',
                        ),
                        TileBoxRecipe(
                          header: 'Carbohydrate',
                          footer:
                              '${context.watch<FoodData>().FoodsList[widget.index].carbohydrategr}gr',
                        ),
                        TileBoxRecipe(
                          header: 'Protein',
                          footer:
                              '${context.watch<FoodData>().FoodsList[widget.index].fatgr}gr',
                        ),
                      ],
                    ),
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
