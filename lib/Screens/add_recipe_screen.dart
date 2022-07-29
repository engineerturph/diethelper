import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Data/foods_list.dart';
import '../Data/food.dart';
import '../Widgets/add recipe screen widgets/add_recipe_add_portion_button.dart';
import '../Widgets/add recipe screen widgets/add_recipe_text_field.dart';
import '../constants.dart';

class AddRecipeScreen extends StatefulWidget {
  const AddRecipeScreen({Key? key}) : super(key: key);

  @override
  State<AddRecipeScreen> createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  String dropdownValue = 'Grams';
  String recipeName = '';
  int kcalper100g = -1;
  int carbgr = -1;
  int proteingr = -1;
  int fatgr = -1;
  String? slicegr;
  String? portiongr;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Add Recipe',
                    style: kMiddleTextStyle,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 20.0,
                    ),
                    child: Column(
                      children: [
                        AddRecipeTextField(
                            onChanged: (value) {
                              recipeName = value;
                            },
                            hintText: 'Recipe Name'),
                        AddRecipeTextField(
                            onChanged: (value) {
                              kcalper100g = int.parse(value);
                            },
                            hintText: 'Kcal per 100g'),
                        AddRecipeTextField(
                            onChanged: (value) {
                              carbgr = int.parse(value);
                            },
                            hintText: 'Carb gr'),
                        AddRecipeTextField(
                            onChanged: (value) {
                              proteingr = int.parse(value);
                            },
                            hintText: 'Protein gr'),
                        AddRecipeTextField(
                            onChanged: (value) {
                              fatgr = int.parse(value);
                            },
                            hintText: 'Fat gr'),
                        AddPortionButton(),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 80.0),
                          child: TextButton(
                            onPressed: () {
                              if (recipeName == '' ||
                                  kcalper100g == -1 ||
                                  proteingr == -1 ||
                                  fatgr == -1 ||
                                  carbgr == -1) {
                                return;
                              }
                              print(context.read<FoodData>().FoodsList);
                              context.read<FoodData>().adRecipe(Food(
                                    name: recipeName,
                                    curKcal: kcalper100g,
                                    kcal100g: kcalper100g,
                                    proteingr: proteingr,
                                    fatgr: fatgr,
                                    carbohydrategr: carbgr,
                                    meal: Meals.noMeal,
                                  ));
                              Navigator.pop(context);
                            },
                            style: kButtonStyle,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: kSecondaryColor),
                              width: double.infinity,
                              height: 80.0,
                              child: Center(
                                child: Text(
                                  'SAVE',
                                  style: kBigTextStyle,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
