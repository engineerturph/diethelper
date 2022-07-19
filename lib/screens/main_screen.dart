import 'package:diethelper/screens/secondary_screen.dart';
import 'package:flutter/material.dart';
import "package:flutter_feather_icons/flutter_feather_icons.dart";
import 'package:diethelper/constants.dart';

class MainScreen extends StatefulWidget {
  static const id = '/';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: null,
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1, // 20%
            child: Container(),
          ),
          Expanded(
            flex: 20,
            child: CenterWidget(),
          ),
          Expanded(
            flex: 1, // 20%
            child: Container(),
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: kMainColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: kMainColor,
              ),
              child: Text(
                'Empty Drawer',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 70,
        child: BottomNavigationBar(
          iconSize: 25.0,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          backgroundColor: kMainColor,
          currentIndex: 0,
          items: [
            BottomNavigationBarItem(
              icon: Icon(FeatherIcons.activity),
              label: 'Home',
              backgroundColor: Colors.amber,
            ),
            BottomNavigationBarItem(
              icon: Icon(FeatherIcons.aperture),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}

class CenterWidget extends StatelessWidget {
  const CenterWidget({
    Key? key,
  }) : super(key: key);

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
            mealBox('Sabah'),
            mealBox('Öğle'),
            mealBox('Akşam'),
            mealBox('Atıştırmalık'),
          ],
        ),
      ),
    );
  }
}

class mealBox extends StatelessWidget {
  mealBox(this.innerText);

  String innerText = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      padding: EdgeInsets.fromLTRB(20.0, 0.0, 15.0, 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            innerText,
            style: TextStyle(color: Colors.white),
          ),
          TextButton(
            style: ButtonStyle(overlayColor: MyColor()),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondaryScreen()),
              );
            },
            child: Icon(
              FeatherIcons.plusSquare,
              color: Colors.white,
              size: 40.0,
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
        color: kMainColor,
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: EdgeInsets.all(10.0),
    );
  }
}

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
