import '../../../../utilities/constants.dart';
import '../../../widgets/dropdowns/gender_dropdown.dart';
import '../../../widgets/dropdowns/relation_dropdown.dart';
import '../../../widgets/textfields/dob_textfields.dart';
import '../../../widgets/textfields/tob_textfields.dart';

import '../../../widgets/textfields/name_textfield.dart';

import '../../../../data/models/place_suggestion_model.dart';
import '../../../widgets/button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../logic/bloc/relative_bloc/relative_bloc.dart';

import '../../../../data/models/relative_model.dart';
import 'package:flutter/material.dart';

import '../../../widgets/textfields/pob_textfield.dart';

class AddNewRelative extends StatefulWidget {
  final Function onBackPressed;
  final SingleRelativeData? relativeData;
  const AddNewRelative(
      {Key? key, required this.onBackPressed, this.relativeData})
      : super(key: key);

  @override
  State<AddNewRelative> createState() => _AddNewRelativeState();
}

class _AddNewRelativeState extends State<AddNewRelative> {
  TextEditingController nameController = TextEditingController();
  TextEditingController dobDateController = TextEditingController();
  TextEditingController dobMonthController = TextEditingController();
  TextEditingController dobYearController = TextEditingController();
  TextEditingController tobHourController = TextEditingController();
  TextEditingController tobMinsController = TextEditingController();
  TextEditingController placeController = TextEditingController();

  // ignore: prefer_typing_uninitialized_variables
  var selectedGender;
  // ignore: prefer_typing_uninitialized_variables
  var selectedRelation;
  final _formKey = GlobalKey<FormState>();
  int amPmIndex = 0;
  bool checkDropdown = false;
  PlaceSuggestionModel? selectedPlace;

  String? validatePassword(String value) {
    if (!(value.length > 5) && value.isNotEmpty) {
      return "Password should contain more than 5 characters";
    }
    return null;
  }

  @override
  void initState() {
    if (widget.relativeData != null) {
      nameController.text = widget.relativeData?.fullName ?? '';
      dobDateController.text =
          widget.relativeData?.birthDetails.dobDay.toString() ?? '';
      dobMonthController.text =
          widget.relativeData?.birthDetails.dobMonth.toString() ?? '';
      dobYearController.text =
          widget.relativeData?.birthDetails.dobYear.toString() ?? '';
      amPmIndex = ['AM', 'PM']
          .indexOf(widget.relativeData?.birthDetails.meridiem ?? "AM");
      tobHourController.text =
          widget.relativeData?.birthDetails.tobHour.toString() ?? '';
      tobMinsController.text =
          widget.relativeData?.birthDetails.tobMin.toString() ?? '';
      placeController.text = widget.relativeData?.birthPlace.placeName ?? '';
      selectedPlace = PlaceSuggestionModel(
          placeId: widget.relativeData?.birthPlace.placeId ?? '',
          placeName: widget.relativeData?.birthPlace.placeName ?? '');
      selectedGender = widget.relativeData?.gender ?? '';
      selectedRelation = widget.relativeData?.relation ?? '';
    }
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    dobDateController.dispose();
    dobMonthController.dispose();
    dobYearController.dispose();
    tobHourController.dispose();
    tobMinsController.dispose();
    placeController.dispose();
    super.dispose();
  }

  onSubmitted() {
    bool validateForm = _formKey.currentState!.validate();
    if (!validateForm ||
        selectedGender == null ||
        selectedRelation == null ||
        selectedPlace == null) {
      Fluttertoast.showToast(
          msg: "Please Enter the required Fields Correctly",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black.withOpacity(0.5),
          textColor: Colors.white,
          fontSize: 15.0);
    }
    if (validateForm &&
        selectedGender != null &&
        selectedRelation != null &&
        selectedPlace != null &&
        widget.relativeData == null) {
      //new profile

      _formKey.currentState!.save();
      int idx = nameController.text.indexOf(" ");

      BlocProvider.of<RelativeBloc>(context).add(
        RelativeAddEvent(addRelativeData: {
          "birthDetails": {
            "dobDay": dobDateController.text,
            "dobMonth": dobMonthController.text,
            "dobYear": dobYearController.text,
            "tobHour": tobHourController.text,
            "tobMin": tobMinsController.text,
            "meridiem": ['AM', 'PM'][amPmIndex]
          },
          "birthPlace": {
            "placeName": selectedPlace?.placeName,
            "placeId": selectedPlace?.placeId
          },
          "firstName": idx == -1
              ? nameController.text
              : [
                  nameController.text.substring(0, idx).trim(),
                  nameController.text.substring(idx + 1).trim()
                ][0],
          "lastName": idx != -1
              ? [
                  nameController.text.substring(0, idx).trim(),
                  nameController.text.substring(idx + 1).trim()
                ][1]
              : "",
          "relationId": relationList.indexOf(selectedRelation) + 1,
          "gender": selectedGender
        }),
      );
      widget.onBackPressed();
    } else if (selectedGender == null || selectedRelation == null) {
      setState(() {
        checkDropdown = true;
      });
    } else if (validateForm &&
        selectedGender != null &&
        selectedPlace != null &&
        selectedRelation != null &&
        widget.relativeData != null) {
      //update profile

      _formKey.currentState!.save();
      int idx = nameController.text.indexOf(" ");

      BlocProvider.of<RelativeBloc>(context).add(
        RelativeUpdateEvent(updateRelativeData: {
          "birthDetails": {
            "dobDay": dobDateController.text,
            "dobMonth": dobMonthController.text,
            "dobYear": dobYearController.text,
            "tobHour": tobHourController.text,
            "tobMin": tobMinsController.text,
            "meridiem": ['AM', 'PM'][amPmIndex]
          },
          "birthPlace": {
            "placeName": selectedPlace?.placeName,
            "placeId": selectedPlace?.placeId
          },
          "firstName": idx == -1
              ? nameController.text
              : [
                  nameController.text.substring(0, idx).trim(),
                  nameController.text.substring(idx + 1).trim()
                ][0],
          "lastName": idx != -1
              ? [
                  nameController.text.substring(0, idx).trim(),
                  nameController.text.substring(idx + 1).trim()
                ][1]
              : "",
          "relationId": relationList.indexOf(selectedRelation) + 1,
          "gender": selectedGender,
          "uuid": widget.relativeData?.uuid,
          "relation": selectedRelation,
          "fullName": nameController.text,
        }),
      );
      widget.onBackPressed();
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        widget.onBackPressed();
        return false;
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () => widget.onBackPressed(),
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                  const Text(
                    'Add New Profile',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'Name',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    NameTextfield(
                        onChanged: () => setState(() {}),
                        textEditingController: nameController),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Date of Birth'),
                    const SizedBox(
                      height: 10,
                    ),
                    DOBTextFields(
                        onChanged: () => setState(() {}),
                        dobDateController: dobDateController,
                        dobMonthController: dobMonthController,
                        dobYearController: dobYearController),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Time of Birth'),
                    const SizedBox(
                      height: 10,
                    ),
                    TOBTextFields(
                        onChanged: () => setState(() {}),
                        tobHourController: tobHourController,
                        tobMinsController: tobMinsController,
                        onAmPmChanged: (index) {
                          amPmIndex = index ?? 0;
                        },
                        amPmIndex: amPmIndex),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Place of Birth'),
                    const SizedBox(
                      height: 10,
                    ),
                    POBTextfield(
                      placeController: placeController,
                      onSuggestionTapped: (suggestion) {
                        selectedPlace = suggestion as PlaceSuggestionModel;
                        placeController.text = suggestion.placeName;
                      },
                      selectedPlace: selectedPlace,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: GenderDropDown(
                              selectedGender: selectedGender,
                              checkDropdown: checkDropdown,
                              genderList: genderList,
                              onChanged: (newValue) {
                                setState(() {
                                  selectedGender = newValue;
                                });
                              }),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: RelationDropDown(
                              selectedRelation: selectedRelation,
                              checkDropdown: checkDropdown,
                              relationList: relationList,
                              onChanged: (newValue) {
                                setState(() {
                                  selectedRelation = newValue;
                                });
                              }),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Button(
                height: 35,
                width: 120,
                text: 'Save Changes',
                onPress: onSubmitted,
              )
            ],
          ),
        ),
      ),
    );
  }
}
