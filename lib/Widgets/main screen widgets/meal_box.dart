import 'package:diethelper/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import '../../Screens/meal_screen.dart';

class MealBox extends StatelessWidget {
  MealBox(this.innerText);

  String innerText = '';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        height: 60.0,
        decoration: BoxDecoration(
          color: kMainColor,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                innerText,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MealScreen()),
                  );
                },
                child: Icon(
                  FeatherIcons.plusSquare,
                  size: 40.0,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
