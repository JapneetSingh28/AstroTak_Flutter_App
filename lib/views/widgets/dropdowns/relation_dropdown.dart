import 'package:flutter/material.dart';

import '../../../utilities/text_styles.dart';

class RelationDropDown extends StatelessWidget {
  final String? selectedRelation;
  final bool checkDropdown;
  final List<String> relationList;
  final Function onChanged;
  const RelationDropDown(
      {Key? key,
      required this.selectedRelation,
      required this.checkDropdown,
      required this.relationList,
      required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text('Relation'),
        const SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: checkDropdown
                  ? selectedRelation != null
                      ? Colors.grey.shade400
                      : Colors.red.shade700
                  : Colors.grey.shade400,
            ),
          ),
          child: DropdownButton(
            underline: Container(),
            items: relationList.map((valueItem) {
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
            icon: Icon(Icons.arrow_drop_down,
                color: checkDropdown
                    ? selectedRelation != null
                        ? Colors.grey.shade400
                        : Colors.red.shade700
                    : Colors.grey.shade400),
            isExpanded: true,
            value: selectedRelation,
            onChanged: (newValue) => onChanged(newValue),
          ),
        ),
        if (checkDropdown)
          if (selectedRelation == null)
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10.0),
                  child: Text(
                    'Invalid Relation',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.red.shade700,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
      ],
    );
  }
}
