import 'package:diethelper/Screens/delete_recipe_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../Screens/add_recipe_screen.dart';
import '../../constants.dart';

class AddRecipeButton extends StatelessWidget {
  AddRecipeButton({required this.addButton}) {
    if (addButton == true) {
      width = 200.0;
      addRecipeText = Padding(
        padding: EdgeInsets.only(left: 0.0, right: 20.0),
        child: Text(
          'Add Recipe',
          style: kMiddleTextStyle,
        ),
      );
      innerIcon = Icon(
        FeatherIcons.plus,
        color: Colors.white,
        size: 30.0,
      );
      onClickFunc = (context) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => AddRecipeScreen()));
      };
    } else {
      width = 80.0;
      addRecipeText = null;
      innerIcon = Icon(FeatherIcons.trash, color: Colors.red, size: 25.0);
      onClickFunc = (context) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DeleteRecipeScreen()));
      };
    }
  }
  Widget? addRecipeText;
  bool addButton;
  double? width;
  Icon? innerIcon;
  Function(dynamic)? onClickFunc;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: kSecondaryColor,
        borderRadius: BorderRadius.circular(25.0),
      ),
      width: width,
      height: 80.0,
      child: TextButton(
        style: kButtonStyle,
        onPressed: () {
          onClickFunc!(context);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            addRecipeText ?? SizedBox(),
            innerIcon ?? SizedBox(),
          ],
        ),
      ),
    );
  }
}
