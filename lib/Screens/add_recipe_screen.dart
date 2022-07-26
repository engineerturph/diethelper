import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';
import '../Data/foods_list.dart';
import '../Data/food.dart';
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
            child: Column(
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
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: TextField(
                            decoration: kTextFieldDecoration.copyWith(
                                hintText: 'Recipe Name'),
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            onChanged: (value) {
                              recipeName = value;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: TextField(
                            decoration: kTextFieldDecoration.copyWith(
                                hintText: 'Kcal per 100g'),
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            onChanged: (value) {
                              kcalper100g = int.parse(value);
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: TextField(
                            decoration: kTextFieldDecoration.copyWith(
                                hintText: 'Carb gr'),
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            onChanged: (value) {
                              carbgr = int.parse(value);
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: TextField(
                            decoration: kTextFieldDecoration.copyWith(
                                hintText: 'Protein gr'),
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            onChanged: (value) {
                              proteingr = int.parse(value);
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: TextField(
                            decoration: kTextFieldDecoration.copyWith(
                                hintText: 'Fat gr'),
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            onChanged: (value) {
                              fatgr = int.parse(value);
                            },
                          ),
                        ),
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
                                    kcal100g: kcalper100g,
                                    proteingr: proteingr,
                                    fatgr: fatgr,
                                    carbohydrategr: carbgr,
                                    meal: Meals.noMeal,
                                  ));
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

class AddPortionButton extends StatelessWidget {
  const AddPortionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        decoration: BoxDecoration(
          color: kSecondaryColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                  child: Text(
                'Add Portion',
                style: kMiddleTextStyle,
              )),
              PopupMenuButton(
                child: Icon(FeatherIcons.cornerRightDown),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: Text('1 slice'),
                  ),
                  PopupMenuItem(
                    child: Text('1 portion(200g)'),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
