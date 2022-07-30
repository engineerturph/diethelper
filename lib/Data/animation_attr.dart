import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import 'food.dart';

class AnimationAttrData extends ChangeNotifier {
  //Main Screen Meal With Recipe
  var mapExpandIcon = {
    Meals.Morning: FeatherIcons.chevronDown,
    Meals.Afternoon: FeatherIcons.chevronDown,
    Meals.Night: FeatherIcons.chevronDown,
    Meals.Extra: FeatherIcons.chevronDown,
  };
  var mapColumnHeight = {
    Meals.Morning: 20.0,
    Meals.Afternoon: 20.0,
    Meals.Night: 20.0,
    Meals.Extra: 20.0,
  };
  var mapExpanded = {
    Meals.Morning: false,
    Meals.Afternoon: false,
    Meals.Night: false,
    Meals.Extra: false,
  };
  var mapExpandingColumn = {
    Meals.Morning: <Widget>[],
    Meals.Afternoon: <Widget>[],
    Meals.Night: <Widget>[],
    Meals.Extra: <Widget>[]
  };
}
