import 'package:flutter/material.dart';

class NotificationsController {
  static GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static showSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: const TextStyle(fontSize: 17),
      ),
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(
        label: 'Ocultar',
        disabledTextColor: Colors.white,
        textColor: Colors.white,
        onPressed: () {},
      ),
    );

    messengerKey.currentState!.showSnackBar(snackBar);
  }
}
