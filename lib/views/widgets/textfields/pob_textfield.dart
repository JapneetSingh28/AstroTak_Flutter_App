import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../../../data/models/place_suggestion_model.dart';
import '../../../data/services/places_suggestions.dart';
import '../../../utilities/constants.dart';
import '../../../utilities/text_styles.dart';

class POBTextfield extends StatelessWidget {
  final TextEditingController placeController;
  final Function onSuggestionTapped;
  final PlaceSuggestionModel? selectedPlace;

  const POBTextfield(
      {Key? key,
      required this.placeController,
      required this.onSuggestionTapped,
      required this.selectedPlace})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TypeAheadFormField(
      textFieldConfiguration: TextFieldConfiguration(
          controller: placeController, decoration: inputDecorationStyle),
      suggestionsCallback: (pattern) {
        return PlacesSuggestionsService()
            .fetchPlacesSuggestions(place: pattern);
      },
      itemBuilder: (context, suggestion) {
        return ListTile(
          title: Text(
            (suggestion as PlaceSuggestionModel).placeName,
            style: selectedDropDownStyle,
          ),
        );
      },
      transitionBuilder: (context, suggestionsBox, controller) {
        return suggestionsBox;
      },
      onSuggestionSelected: (suggestion) => onSuggestionTapped(suggestion),
      validator: (value) {
        if (selectedPlace?.placeName==null) {
          return 'Please select a city';
        }
        return null;
      },
      onSaved: (value) {
        placeController.text = value ?? "";
      },
    );
  }
}
