import 'package:flutter/material.dart';

import '../../../utilities/constants.dart';

class StickyTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  const StickyTextField({Key? key, required this.textEditingController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      alignment: Alignment.center,
      color: Colors.white,
      child: Container(
        padding: const EdgeInsets.only(top: 10),
        alignment: Alignment.center,
        height: 125.0,
        child: TextField(
          cursorColor: primaryColor,
          maxLength: 150,
          controller: textEditingController,
          maxLines: 3,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: 'Type a question here',
            hintStyle: TextStyle(color: unselectedColor),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: unselectedColor),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: unselectedColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primaryColor),
            ),
          ),
        ),
      ),
    );
  }
}
