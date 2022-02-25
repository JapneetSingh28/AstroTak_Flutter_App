//     final askQuestionModel = askQuestionModelFromJson(jsonString);

import 'dart:convert';

AskQuestionModel askQuestionModelFromJson(String str) =>
    AskQuestionModel.fromJson(json.decode(str));

String askQuestionModelToJson(AskQuestionModel data) =>
    json.encode(data.toJson());

class AskQuestionModel {
  AskQuestionModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.questionsList,
  });

  int id;
  String name;
  String description;
  double price;
  List<String> questionsList;

  factory AskQuestionModel.fromJson(Map<String, dynamic> json) =>
      AskQuestionModel(
        id: json["id"],
        name: json["name"],
        description: json["description"] ?? "",
        price: json["price"],
        questionsList: List<String>.from(json["suggestions"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "suggestions": List<dynamic>.from(questionsList.map((x) => x)),
      };
}
