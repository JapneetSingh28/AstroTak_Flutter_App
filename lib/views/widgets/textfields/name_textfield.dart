import 'package:flutter/material.dart';

import '../../../utilities/constants.dart';

class NameTextField extends StatelessWidget {
  final TextEditingController textEditingController;

  const NameTextField({Key? key, required this.textEditingController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 10),
        enabledBorder: outlineInputBorder,
        border: outlineInputBorder,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor),
        ),
      ),
      cursorColor: primaryColor,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: textEditingController,
      validator: (value) {
        if (value!.trim().isEmpty) {
          return 'Enter valid Name';
        }
        return null;
      },
      onSaved: (value) {
        textEditingController.text = value!;
      },
    );
  }
}
