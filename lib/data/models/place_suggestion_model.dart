//     final placeSuggestionModel = placeSuggestionModelFromJson(jsonString);

import 'dart:convert';

PlaceSuggestionModel placeSuggestionModelFromJson(String str) =>
    PlaceSuggestionModel.fromJson(json.decode(str));

String placeSuggestionModelToJson(PlaceSuggestionModel data) =>
    json.encode(data.toJson());

class PlaceSuggestionModel {
  PlaceSuggestionModel({
    required this.placeName,
    required this.placeId,
  });

  String placeName;
  String placeId;

  factory PlaceSuggestionModel.fromJson(Map<String, dynamic> json) =>
      PlaceSuggestionModel(
        placeName: json["placeName"],
        placeId: json["placeId"],
      );

  Map<String, dynamic> toJson() => {
        "placeName": placeName,
        "placeId": placeId,
      };
}
