import 'package:flutter/material.dart';

class ShowSnackBar {
  void showSnackBar(BuildContext context, String title,
      {SnackBarAction? action,
        Duration? duration,
        bool noAction = false,
        Color backgroundColor = Colors.black}) {
    try {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: duration ?? const Duration(seconds: 1),
          backgroundColor: backgroundColor,
          behavior: SnackBarBehavior.fixed,
          content: Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      );
    } catch (e) {
      // print('Failed to show Snackbar with title:$title error $e');
    }
  }
}
