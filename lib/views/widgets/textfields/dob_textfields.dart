import 'package:flutter/material.dart';

import '../../../utilities/constants.dart';
import 'package:flutter/services.dart';

class DOBTextFields extends StatelessWidget {
  final Function onChanged;
  final TextEditingController dobDateController;
  final TextEditingController dobMonthController;
  final TextEditingController dobYearController;

  const DOBTextFields(
      {Key? key,
      required this.onChanged,
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
                errorText: validateInt(
                  maxValue: 31,
                  minValue: 0,
                  errorMssg: 'Invalid DD',
                  value: dobDateController.text,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: primaryColor),
                ),
                hintText: 'DD'),
            onChanged: (_) => onChanged(),
            maxLength: 2,
            inputFormatters: [LengthLimitingTextInputFormatter(2)],
            keyboardType: TextInputType.number,
            cursorColor: primaryColor,
            controller: dobDateController,
            validator: (value) {
              if (value!.isEmpty ||
                  int.parse(value) > 31 ||
                  int.parse(value) <= 0) {
                return 'Invalid DD';
              }
              return null;
            },
            onSaved: (value) {
              dobDateController.text = value!;
            },
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 10),
                enabledBorder: outlineInputBorder,
                border: outlineInputBorder,
                errorText: validateInt(
                  maxValue: 12,
                  minValue: 0,
                  errorMssg: 'Invalid MM',
                  value: dobMonthController.text,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: primaryColor),
                ),
                hintText: 'MM'),
            onChanged: (_) => onChanged(),
            maxLength: 2,
            inputFormatters: [LengthLimitingTextInputFormatter(2)],
            keyboardType: TextInputType.number,
            cursorColor: primaryColor,
            controller: dobMonthController,
            validator: (value) {
              if (value!.isEmpty ||
                  int.parse(value) > 12 ||
                  int.parse(value) <= 0) {
                return 'Invalid MM';
              }
              return null;
            },
            onSaved: (value) {
              dobMonthController.text = value!;
            },
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 10),
                enabledBorder: outlineInputBorder,
                border: outlineInputBorder,
                errorText: validateInt(
                  maxValue: DateTime.now().year,
                  minValue: 1899,
                  errorMssg: 'Invalid YYYY',
                  value: dobYearController.text,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: primaryColor),
                ),
                hintText: 'YYYY'),
            onChanged: (_) => onChanged(),
            maxLength: 4,
            inputFormatters: [LengthLimitingTextInputFormatter(4)],
            keyboardType: TextInputType.number,
            cursorColor: primaryColor,
            controller: dobYearController,
            validator: (value) {
              if (value!.isEmpty ||
                  int.parse(value) > DateTime.now().year ||
                  int.parse(value) <= 0 ||
                  int.parse(value) < 1900) {
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
