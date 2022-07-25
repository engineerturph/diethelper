import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import '../constants.dart';

class AddRecipeScreen extends StatefulWidget {
  const AddRecipeScreen({Key? key}) : super(key: key);

  @override
  State<AddRecipeScreen> createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  String dropdownValue = 'Grams';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Container(
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
                      child: ListView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: TextField(
                              decoration: kTextFieldDecoration.copyWith(
                                  hintText: 'Recipe Name'),
                              textAlign: TextAlign.center,
                              maxLines: 1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: TextField(
                              decoration: kTextFieldDecoration.copyWith(
                                  hintText: 'Kcal per 100g'),
                              textAlign: TextAlign.center,
                              maxLines: 1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: TextField(
                              decoration: kTextFieldDecoration.copyWith(
                                  hintText: 'Carb gr'),
                              textAlign: TextAlign.center,
                              maxLines: 1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: TextField(
                              decoration: kTextFieldDecoration.copyWith(
                                  hintText: 'Protein gr'),
                              textAlign: TextAlign.center,
                              maxLines: 1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: TextField(
                              decoration: kTextFieldDecoration.copyWith(
                                  hintText: 'Fat gr'),
                              textAlign: TextAlign.center,
                              maxLines: 1,
                            ),
                          ),
                          Padding(
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
                                        child: Container(
                                      child: Text(
                                        'Add Portion',
                                        style: kMiddleTextStyle,
                                      ),
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
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
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
