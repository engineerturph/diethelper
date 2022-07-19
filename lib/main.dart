import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'screens/main_screen.dart';
import 'package:diethelper/screens/secondary_screen.dart';

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
        primarySwatch: Colors.blue,
      ),
      initialRoute: MainScreen.id,
      routes: {
        MainScreen.id: (context) => MainScreen(),
        SecondaryScreen.id: (context) => SecondaryScreen(),
      },
    );
  }
}
