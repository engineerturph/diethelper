import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../constants.dart';

class RecipeScreen extends StatefulWidget {
  const RecipeScreen({Key? key}) : super(key: key);

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Pizza',
                    style: kMiddleTextStyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Add to meal',
                    style: kMiddleTextStyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Icon(FeatherIcons.plus),
                      ),
                      Expanded(
                        child: TextFormField(
                          initialValue: '100',
                          decoration: kTextFieldDecoration,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Icon(FeatherIcons.moreVertical),
                      ),
                      Expanded(
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: kSecondaryColor,
                            ),
                            height: 40.0,
                            child: Center(child: MyStatefulWidget())),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextButton(
                      style: kButtonStyle,
                      onPressed: () {
                        print('as');
                      },
                      child: Container(
                        width: double.infinity,
                        height: 50.0,
                        color: kSecondaryColor,
                        child: Center(
                          child: Text(
                            'SAVE',
                            style: kMiddleTextStyle,
                          ),
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    child: GridView.count(
                      physics: NeverScrollableScrollPhysics(),
                      childAspectRatio: 2,
                      crossAxisCount: 2,
                      children: [
                        TileBox(
                          header: 'Kcal',
                          footer: '500',
                        ),
                        TileBox(
                          header: 'Fat',
                          footer: '34gr',
                        ),
                        TileBox(
                          header: 'Carbohydrate',
                          footer: '25gr',
                        ),
                        TileBox(
                          header: 'Protein',
                          footer: '15gr',
                        ),
                      ],
                    ),
                  ),
                ),
                Container()
              ],
            ),
            decoration: BoxDecoration(
              color: kMainColor,
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
        ),
      ),
    );
  }
}

class TileBox extends StatelessWidget {
  TileBox({header, footer}) {
    this.headerText = header;
    this.footerText = footer;
  }
  String headerText = '';
  String footerText = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.0),
      child: GridTile(
        child: Container(
          color: kSecondaryColor,
        ),
        header: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Center(
              child: Text(
            headerText,
            style: kMiddleTextStyle,
          )),
        ),
        footer: Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: Center(
              child: Text(
            footerText,
            style: kMiddleTextStyle,
          )),
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String dropdownValue = 'Grams';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      alignment: Alignment.center,
      value: dropdownValue,
      style: kMiddleTextStyle,
      underline: Container(
        height: 0,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['Grams', '1 Portion(200g)', '1 Plate']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Center(child: Text(value)),
        );
      }).toList(),
    );
  }
}
