import 'package:flutter/material.dart';
import '../../constants.dart';

class AddRecipeTextField extends StatelessWidget {
  AddRecipeTextField({required this.onChanged, required this.hintText});
  Function(String)? onChanged;
  String hintText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: TextField(
        decoration: kTextFieldDecoration.copyWith(hintText: hintText),
        textAlign: TextAlign.center,
        maxLines: 1,
        onChanged: onChanged,
      ),
    );
  }
}
