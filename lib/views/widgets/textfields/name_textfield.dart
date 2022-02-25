import 'package:flutter/material.dart';

import '../../../utilities/constants.dart';

class NameTextfield extends StatelessWidget {
  final Function onChanged;
  final TextEditingController textEditingController;
  const NameTextfield(
      {Key? key, required this.onChanged, required this.textEditingController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 10),
        enabledBorder: outlineInputBorder,
        border: outlineInputBorder,
        errorText: validateString(
          errorMssg: 'Enter valid Name',
          value: textEditingController.text,
          length: 1,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor),
        ),
      ),
      onChanged: (_) => onChanged(),
      cursorColor: primaryColor,
      controller: textEditingController,
      validator: (value) {
        if (value!.isEmpty) {
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
