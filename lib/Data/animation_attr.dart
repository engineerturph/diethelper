import 'package:diethelper/Data/foods_list.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import '../Widgets/main screen widgets/recipe_box_main.dart';

class AnimationAttrData extends ChangeNotifier {
  //Main Screen Meal With Recipe
  IconData expandIcon = FeatherIcons.chevronDown;
  double columnHeight = 20.0;
  bool expanded = false;
  //Add Recipe type chooser
  String dropdownValue = 'Grams';
  List<Widget> columnThings = [];
  void DropdownButtonFunction(String? newValue) {
    dropdownValue = newValue!;
    notifyListeners();
  }

  void textButtonExpander() {
    if (!expanded) {
      FoodData foodData = FoodData();
      int length = foodData.BreakFastFoods.length;
      for (var i = 0; i < foodData.BreakFastFoods.length; i++) {
        columnThings.add(RecipeBoxMain(
          index: i,
        ));
      }
      columnHeight = 20 + 64 * length.toDouble();
      expandIcon = FeatherIcons.chevronUp;
      expanded = true;
    } else if (expanded) {
      columnThings.removeAt(0);
      columnThings.removeAt(0);
      columnHeight = 20.0;
      expandIcon = FeatherIcons.chevronDown;
      expanded = false;
    }
    notifyListeners();
  }
}
