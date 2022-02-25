import 'package:flutter/material.dart';

import '../../utilities/constants.dart';


class Button extends StatelessWidget {
  const Button({
    Key? key,
    required this.height,
    required this.width,
    required this.text,
    required this.onPress,
  }) : super(key: key);

  final String text;
  final Function onPress;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
        onPressed: () => onPress(),
        style: ElevatedButton.styleFrom(
          primary: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      ),
    );
  }
}
