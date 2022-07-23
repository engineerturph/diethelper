import 'package:flutter/material.dart';

const kMainColor = Color(0xFF1B1D1E);
const kSecondaryColor = Color(0xFF4E5352);

const kMiddleTextStyle =
    TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0);

const kTextFieldDecoration = InputDecoration(
    hintText: 'Tarif arayın',
    hintStyle: TextStyle(color: Colors.grey),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.zero,
      borderSide: BorderSide(color: Colors.grey),
    ),
    constraints: BoxConstraints(maxHeight: 40.0),
    contentPadding: EdgeInsets.zero,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 1, color: Colors.grey), //<-- SEE HERE
    ));

class MyColor extends MaterialStateColor {
  const MyColor() : super(_defaultColor);

  static const int _defaultColor = 0xFF1B1D1E;
  static const int _pressedColor = 0xde000000;

  @override
  Color resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.pressed)) {
      return const Color(_pressedColor);
    }
    return const Color(_defaultColor);
  }
}

final kButtonStyle = ButtonStyle(
  padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
  minimumSize: MaterialStateProperty.all<Size>(Size.zero),
  overlayColor: MyColor(),
);

final kButtonStyle2 = ButtonStyle(
  padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
  minimumSize: MaterialStateProperty.all<Size>(Size.zero),
  overlayColor: MyColor2(),
);

class MyColor2 extends MaterialStateColor {
  const MyColor2() : super(_defaultColor);

  static const int _defaultColor = 0xFFFFFFFF;
  static const int _pressedColor = 0xde000000;

  @override
  Color resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.pressed)) {
      return const Color(_pressedColor);
    }
    return const Color(_defaultColor);
  }
}
