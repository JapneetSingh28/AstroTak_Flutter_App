import 'button.dart';
import 'package:flutter/material.dart';

class AlertDialogBox extends StatelessWidget {
  final String content;
  final String yes;
  final String no;
  final Function yesOnPressed;
  final Function noOnPressed;
  const AlertDialogBox(
      {Key? key,
      required this.content,
      required this.yes,
      required this.no,
      required this.yesOnPressed,
      required this.noOnPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(content),
      ),
      actionsPadding: const EdgeInsets.only(bottom: 10),
      actionsAlignment: MainAxisAlignment.center,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      actions: <Widget>[
        Button(
            height: 35, width: 125, text: yes, onPress: () => yesOnPressed()),
        Button(height: 35, width: 125, text: no, onPress: () => noOnPressed()),
      ],
    );
  }
}
