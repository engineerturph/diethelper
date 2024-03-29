import 'package:flutter/material.dart';
import "package:flutter_feather_icons/flutter_feather_icons.dart";
import 'package:diethelper/constants.dart';
import '../widgets/main screen widgets/main_body_widget.dart';

class MainScreen extends StatelessWidget {
  static const id = '/';

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
            child: MainBodyWidget(),
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

//Expansion Panel cok iyi
