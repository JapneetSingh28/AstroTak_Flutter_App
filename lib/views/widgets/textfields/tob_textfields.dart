import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:flutter/services.dart';
import '../../../utilities/constants.dart';

class TOBTextFields extends StatelessWidget {
  final Function onChanged;
  final TextEditingController tobHourController;
  final TextEditingController tobMinsController;
  final Function onAmPmChanged;
  final int amPmIndex;
  const TOBTextFields(
      {Key? key,
      required this.onChanged,
      required this.tobHourController,
      required this.tobMinsController,
      required this.onAmPmChanged,
      required this.amPmIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 10),
                enabledBorder: outlineInputBorder,
                errorText: validateInt(
                  maxValue: 12,
                  minValue: 0,
                  errorMssg: 'Invalid HH',
                  value: tobHourController.text,
                ),
                border: outlineInputBorder,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: primaryColor),
                ),
                hintText: 'HH'),
            onChanged: (_) => onChanged(),
            maxLength: 2,
            inputFormatters: [LengthLimitingTextInputFormatter(2)],
            keyboardType: TextInputType.number,
            cursorColor: primaryColor,
            controller: tobHourController,
            validator: (value) {
              if (value!.isEmpty ||
                  int.parse(value) > 12 ||
                  int.parse(value) <= 0) {
                return 'Invalid HH';
              }
              return null;
            },
            onSaved: (value) {
              tobHourController.text = value!;
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
                  maxValue: 59,
                  minValue: -1,
                  errorMssg: 'Invalid MM',
                  value: tobMinsController.text,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: primaryColor),
                ),
                hintText: 'MM'),
            maxLength: 2,
            inputFormatters: [LengthLimitingTextInputFormatter(2)],
            keyboardType: TextInputType.number,
            onChanged: (_) => onChanged(),
            cursorColor: primaryColor,
            controller: tobMinsController,
            validator: (value) {
              if (value!.isEmpty || int.parse(value) > 59) {
                return 'Invalid MM';
              }
              return null;
            },
            onSaved: (value) {
              tobMinsController.text = value!;
            },
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        ToggleSwitch(
          minWidth: 50.0,
          minHeight: 45,
          cornerRadius: 5.0,
          activeBgColor: [bannerColor],
          activeFgColor: Colors.white,
          inactiveBgColor: Colors.white,
          inactiveFgColor: Colors.black,
          initialLabelIndex: amPmIndex,
          totalSwitches: 2,
          labels: const ['AM', 'PM'],
          radiusStyle: true,
          onToggle: (index) => onAmPmChanged(index),
        ),
      ],
    );
  }
}
