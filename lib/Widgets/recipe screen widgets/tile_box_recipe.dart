import 'package:flutter/material.dart';

import '../../constants.dart';

class TileBoxRecipe extends StatelessWidget {
  TileBoxRecipe({header, footer}) {
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
