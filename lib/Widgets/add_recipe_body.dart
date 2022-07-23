import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../constants.dart';

class AddRecipeBody extends StatelessWidget {
  const AddRecipeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Atistirmalik',
                  style: kMiddleTextStyle,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    FeatherIcons.chevronLeft,
                    color: Colors.white,
                    size: 40.0,
                  ),
                )
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 20.0,
                ),
                child: ListView(
                  children: [
                    TextField(
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Recipe Name'),
                      autofocus: true,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
        color: kMainColor,
        borderRadius: BorderRadius.circular(15.0),
      ),
    );
  }
}
