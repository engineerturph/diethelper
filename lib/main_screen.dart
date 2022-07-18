import 'package:flutter/material.dart';
import "package:flutter_feather_icons/flutter_feather_icons.dart";

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

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
        backgroundColor: Color(0xFF1B1D1E),
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF1B1D1E),
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
          backgroundColor: Color(0xFF1B1D1E),
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
                margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 40.0)),
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
          Icon(
            FeatherIcons.plusSquare,
            color: Colors.white,
            size: 40.0,
          )
        ],
      ),
      decoration: BoxDecoration(
        color: Color(0xFF1B1D1E),
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: EdgeInsets.all(10.0),
    );
  }
}
