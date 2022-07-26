import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../constants.dart';

class AddPortionButton extends StatelessWidget {
  const AddPortionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        decoration: BoxDecoration(
          color: kSecondaryColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                  child: Text(
                'Add Portion',
                style: kMiddleTextStyle,
              )),
              PopupMenuButton(
                child: Icon(FeatherIcons.cornerRightDown),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: Text('1 slice'),
                  ),
                  PopupMenuItem(
                    child: Text('1 portion(200g)'),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
