import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.lightBlue,
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              color: Colors.black,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.amber,
            ),
          ),
        ],
      ),
    );
  }
}
