import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration authInputDecoration(
      {required String hintText,
      required String labelText,
      IconData? prefixIcon}) {
    return InputDecoration(
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Color.fromRGBO(89, 89, 89, 1)),
      ),
      focusedBorder: UnderlineInputBorder(
          borderSide:
              BorderSide(color: Color.fromRGBO(89, 89, 89, 1), width: 2)),
      hintText: hintText,
      labelText: labelText,
      labelStyle: TextStyle(color: Colors.grey),
      prefixIcon: prefixIcon != null
          ? Icon(prefixIcon, color: Color.fromRGBO(172, 30, 35, 1))
          : null,
    );
  }
}
