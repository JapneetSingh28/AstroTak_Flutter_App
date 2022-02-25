import 'package:flutter/material.dart';

Color primaryColor = const Color(0xfffe944c);
Color lightPrimaryColor = const Color(0xfffff1e8);

Color primaryColor2 = const Color(0xff303F60);

Color unselectedColor = Colors.grey.shade500;
Color unselectedTabFontColor = Colors.black;

Color bannerColor = const Color(0xff4b60bd);
Color bannerLightColor = const Color(0xffe0e3fc);

OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderSide: BorderSide(color: Colors.grey.shade400),
);

InputDecoration inputDecorationStyle = InputDecoration(
  contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
  enabledBorder: outlineInputBorder,
  border: outlineInputBorder,
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: primaryColor),
  ),
);

String? validateString(
    {required String value, required int length, required String errorMssg}) {
  if ((value.length <= length) && value.isNotEmpty) {
    return errorMssg;
  }
  return null;
}

String? validateInt(
    {required String value,
    required String errorMssg,
    required int maxValue,
    required int minValue}) {
  if (value.isNotEmpty &&
      ((int.tryParse(value) ?? 0) > maxValue ||
          (int.tryParse(value) ?? 0) <= minValue)) {
    return errorMssg;
  }
  return null;
}

List<String> genderList = ["MALE", "FEMALE"];
  List<String> relationList = [
    "Father",
    "Mother",
    "Brother",
    "Sister",
    "Spouse",
    "Son",
    "Daughter",
    "Father in law",
    "Mother in law",
    "Brother in law",
    "Sister in law",
    "Daughter in law",
    "Uncle",
    "Aunt",
    "Friend",
    "Fiance"
  ];