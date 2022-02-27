import 'package:flutter/material.dart';

import '../../../utilities/constants.dart';
import 'package:flutter/services.dart';

class DOBTextFields extends StatelessWidget {
  final TextEditingController dobDateController;
  final TextEditingController dobMonthController;
  final TextEditingController dobYearController;

  const DOBTextFields(
      {Key? key,
      required this.dobDateController,
      required this.dobMonthController,
      required this.dobYearController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 10),
                enabledBorder: outlineInputBorder,
                border: outlineInputBorder,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: primaryColor),
                ),
                hintText: 'DD'),
            maxLength: 2,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.number,
            cursorColor: primaryColor,
            controller: dobDateController,
            validator: (value) {
              if (value!.isEmpty ||
                  value is int ||
                  (int.tryParse(value) ?? 0) > 31 ||
                  (int.tryParse(value) ?? 0) <= 0) {
                return 'Invalid DD';
              }
              return null;
            },
            onSaved: (value) {
              dobDateController.text = value!;
            },
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 10),
                enabledBorder: outlineInputBorder,
                border: outlineInputBorder,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: primaryColor),
                ),
                hintText: 'MM'),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            maxLength: 2,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            keyboardType: TextInputType.number,
            cursorColor: primaryColor,
            controller: dobMonthController,
            validator: (value) {
              if (value!.isEmpty ||
                  value is int ||
                  (int.tryParse(value) ?? 0) > 12 ||
                  (int.tryParse(value) ?? 0) <= 0) {
                return 'Invalid MM';
              }
              return null;
            },
            onSaved: (value) {
              dobMonthController.text = value!;
            },
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 10),
                enabledBorder: outlineInputBorder,
                border: outlineInputBorder,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: primaryColor),
                ),
                hintText: 'YYYY'),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            maxLength: 4,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            keyboardType: TextInputType.number,
            cursorColor: primaryColor,
            controller: dobYearController,
            validator: (value) {
              if (value!.isEmpty ||
                  value is int ||
                  (int.tryParse(value) ?? 0) > DateTime.now().year ||
                  (int.tryParse(value) ?? 0) <= 0 ||
                  (int.tryParse(value) ?? 0) < 1900) {
                return 'Invalid YYYY';
              }
              return null;
            },
            onSaved: (value) {
              dobYearController.text = value!;
            },
          ),
        ),
      ],
    );
  }
}
