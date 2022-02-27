import 'package:flutter/material.dart';

import '../../../utilities/constants.dart';

class CategoryDropDown extends StatelessWidget {
  final String value;
  final Function onChanged;
  final List<String> itemsList;

  const CategoryDropDown(
      {Key? key,
      required this.value,
      required this.onChanged,
      required this.itemsList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: unselectedColor,
            blurRadius: 0.2,
            offset: Offset.fromDirection(1),
          ),
        ],
      ),
      child: DropdownButton<String>(
        isExpanded: true,
        underline: const SizedBox(),
        dropdownColor: Colors.white,
        focusColor: Colors.white,
        value: value,
        items: itemsList.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
            ),
          );
        }).toList(),
        onChanged: (value) => onChanged(value),
      ),
    );
  }
}
