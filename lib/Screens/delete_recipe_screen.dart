import 'package:diethelper/Widgets/delete%20recipe%20screnn%20widgets/delete_recipe_box.dart';
import 'package:diethelper/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Data/food.dart';
import '../Data/foods_list.dart';
import '../Widgets/meal screen widgets/recipe_box.dart';

class DeleteRecipeScreen extends StatelessWidget {
  const DeleteRecipeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainColor,
        actions: [
          Center(
              child: TextButton(
                  onPressed: () {
                    context.read<FoodData>().deleteFromList();
                    Navigator.pop(context);
                  },
                  child: Text('DELETE CHOSEN'))),
        ],
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0),
            child: ListView.builder(
              itemBuilder: (context, index) => DeleteRecipeBox(index: index),
              itemCount: context.watch<FoodData>().FoodsList.length,
            ),
          ),
        ),
      ),
    );
  }
}
