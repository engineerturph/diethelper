import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Data/foods_list.dart';

class ShowCaloriesTaken extends StatelessWidget {
  ShowCaloriesTaken({required this.totalWidth});
  double totalWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.0,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.white,
            ),
            height: 30.0,
            width: totalWidth,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: context.watch<FoodData>().kcalTargetReached
                  ? Colors.red
                  : Colors.blue,
            ),
            height: 30.0,
            width: totalWidth * context.watch<FoodData>().totalLimitRatio,
          ),
        ],
      ),
    );
  }
}
