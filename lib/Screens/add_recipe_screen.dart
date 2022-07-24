import 'package:flutter/material.dart';
import '../constants.dart';

class AddRecipeScreen extends StatelessWidget {
  const AddRecipeScreen({Key? key}) : super(key: key);

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
                          Align(
                            child: Container(
                              height: 60.0,
                              width: 300.0,
                              color: kSecondaryColor,
                              child: PopupMenuButton(
                                  enabled: true,
                                  offset: Offset(0, 60.0),
                                  child: Center(
                                      child: Text(
                                    'Add Portions',
                                    style: kMiddleTextStyle,
                                  )),
                                  itemBuilder: (context) => [
                                        PopupMenuItem(
                                          child: Container(
                                              width: 200.0,
                                              child: Center(
                                                  child: Text('1 slice'))),
                                        ),
                                        PopupMenuItem(
                                          child: Container(
                                              width: 200.0,
                                              child: Center(
                                                  child: Text('1 slice'))),
                                        ),
                                      ]),
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
