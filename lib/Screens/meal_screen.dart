import 'package:flutter/material.dart';
import "package:flutter_feather_icons/flutter_feather_icons.dart";
import 'package:provider/provider.dart';
import '../Data/food.dart';
import '../Data/foods_list.dart';
import '../Widgets/meal screen widgets/meal_body_widget.dart';

class MealScreen extends StatefulWidget {
  MealScreen({required this.curMeal});
  Meals curMeal;
  static const id = '/second';

  @override
  State<MealScreen> createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(size: 50.0, color: Colors.white),
        toolbarHeight: 80.0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(FeatherIcons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: TextButton(
              onPressed: () {
                context.read<FoodData>().saveFoods(widget.curMeal);
                Navigator.pop(context);
              },
              child: Text(
                "SAVE",
              ),
            ),
          ),
        ],
      ),
      body: MealBodyWidget(curMeal: widget.curMeal),
      drawer: Drawer(
        backgroundColor: Color(0xFF1B1D1E),
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF1B1D1E),
              ),
              child: Text(
                'Empty Drawer again',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
