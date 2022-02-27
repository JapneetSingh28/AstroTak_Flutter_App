import 'package:flutter/material.dart';

import '../../../utilities/text_styles.dart';

class GenderDropDown extends StatelessWidget {
  final String? selectedGender;
  final bool checkDropdown;
  final List<String> genderList;
  final Function onChanged;

  const GenderDropDown(
      {Key? key,
      required this.selectedGender,
      required this.checkDropdown,
      required this.genderList,
      required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text('Gender'),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: checkDropdown
                  ? selectedGender != null
                      ? Colors.grey.shade400
                      : Colors.red.shade700
                  : Colors.grey.shade400,
            ),
          ),
          child: DropdownButton(
            underline: Container(),
            items: genderList.map((valueItem) {
              return DropdownMenuItem(
                value: valueItem,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    valueItem,
                    style: selectedDropDownStyle,
                  ),
                ),
              );
            }).toList(),
            icon: Icon(
              Icons.arrow_drop_down,
              color: checkDropdown
                  ? selectedGender != null
                      ? Colors.grey.shade400
                      : Colors.red.shade700
                  : Colors.grey.shade400,
            ),
            isExpanded: true,
            value: selectedGender,
            onChanged: (newValue) => onChanged(newValue),
          ),
        ),
        if (checkDropdown)
          if (selectedGender == null)
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10.0),
                  child: Text(
                    'Invalid Gender',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.red.shade700,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            )
      ],
    );
  }
}
