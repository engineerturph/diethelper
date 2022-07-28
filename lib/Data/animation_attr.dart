import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import 'food.dart';

class AnimationAttrData extends ChangeNotifier {
  //Main Screen Meal With Recipe
  var mapExpandIcon = {
    'breakfastFoods': FeatherIcons.chevronDown,
    'lunchFoods': FeatherIcons.chevronDown,
    'dinnerFoods': FeatherIcons.chevronDown,
    'extraFoods': FeatherIcons.chevronDown,
  };
  var mapColumnHeight = {
    'breakfastFoods': 20.0,
    'lunchFoods': 20.0,
    'dinnerFoods': 20.0,
    'extraFoods': 20.0,
  };
  var mapExpanded = {
    'breakfastFoods': false,
    'lunchFoods': false,
    'dinnerFoods': false,
    'extraFoods': false,
  };
  var mapExpandingColumn = {
    'breakfastFoods': <Widget>[],
    'lunchFoods': <Widget>[],
    'dinnerFoods': <Widget>[],
    'extraFoods': <Widget>[]
  };
  //Add Recipe type chooser
  String dropdownValue = 'Grams';

  void DropdownButtonFunction(String? newValue) {
    dropdownValue = newValue!;
    notifyListeners();
  }
}
