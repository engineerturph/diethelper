import 'package:flutter/material.dart';
import 'Screens/main_screen.dart';
import 'package:diethelper/Screens/meal_screen.dart';
import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.grey,
        primaryColor: Colors.black,
        textButtonTheme: TextButtonThemeData(
          style: kButtonStyle,
        ),
      ),
      initialRoute: MainScreen.id,
      routes: {
        MainScreen.id: (context) => MainScreen(),
        MealScreen.id: (context) => MealScreen(),
      },
    );
  }
}
