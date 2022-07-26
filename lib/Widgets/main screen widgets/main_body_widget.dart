import 'package:flutter/material.dart';
import 'meal_box.dart';

class MainBodyWidget extends StatefulWidget {
  @override
  State<MainBodyWidget> createState() => _MainBodyWidgetState();
}

class _MainBodyWidgetState extends State<MainBodyWidget> {
  List<Widget> mealArray = [];
  bool isExpanded = false;

  @override
  void initState() {
    mealArray = [
      MealBox('Sabah'),
      ExpansionPanelList(
        children: [
          ExpansionPanel(
            headerBuilder: (context, isOpen) {
              return Text('Hello');
            },
            body: Text('Now Open'),
            isExpanded: isExpanded,
          ),
        ],
        expansionCallback: (i, isOpen) => setState(() {
          isExpanded = !isOpen;
        }),
      ),
      MealBox('Öğle'),
      MealBox('Akşam'),
      MealBox('Atıştırmalık'),
    ];
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '1280/2000 kcal',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white,
              ),
              height: 30.0,
              width: 280.0,
              margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 40.0),
            ),
            ...mealArray,
          ],
        ),
      ),
    );
  }
}
