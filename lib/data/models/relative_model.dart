//     final relativeModel = relativeModelFromJson(jsonString);

import 'dart:convert';

RelativeModel relativeModelFromJson(String str) =>
    RelativeModel.fromJson(json.decode(str));

String relativeModelToJson(RelativeModel data) => json.encode(data.toJson());

class RelativeModel {
  RelativeModel({
    required this.pageNo,
    required this.numberOfElements,
    required this.pageSize,
    required this.totalElements,
    required this.totalPages,
    required this.allRelatives,
  });

  int pageNo;
  int numberOfElements;
  int pageSize;
  int totalElements;
  int totalPages;
  List<SingleRelativeData> allRelatives;

  factory RelativeModel.fromJson(Map<String, dynamic> json) => RelativeModel(
        pageNo: json["pageNo"] ?? 0,
        numberOfElements: json["numberOfElements"] ?? 0,
        pageSize: json["pageSize"] ?? 0,
        totalElements: json["totalElements"] ?? 0,
        totalPages: json["totalPages"] ?? 0,
        allRelatives: json["allRelatives"] != null
            ? List<SingleRelativeData>.from(
                json["allRelatives"].map(
                  (x) => SingleRelativeData.fromJson(x),
                ),
              )
            : [],
      );

  Map<String, dynamic> toJson() => {
        "pageNo": pageNo,
        "numberOfElements": numberOfElements,
        "pageSize": pageSize,
        "totalElements": totalElements,
        "totalPages": totalPages,
        "allRelatives": List<dynamic>.from(allRelatives.map((x) => x.toJson())),
      };
}

class SingleRelativeData {
  SingleRelativeData({
    required this.uuid,
    required this.relation,
    required this.relationId,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.fullName,
    required this.gender,
    required this.dateAndTimeOfBirth,
    required this.birthDetails,
    required this.birthPlace,
  });

  String uuid;
  String relation;
  int relationId;
  String firstName;
  String middleName;
  String lastName;
  String fullName;
  String gender;
  DateTime dateAndTimeOfBirth;
  BirthDetails birthDetails;
  BirthPlace birthPlace;

  factory SingleRelativeData.fromJson(Map<String, dynamic> json) => SingleRelativeData(
        uuid: json["uuid"]??'',
        relation: json["relation"]??'',
        relationId: json["relationId"]??0,
        firstName: json["firstName"]??'',
        middleName: json["middleName"]??'',
        lastName: json["lastName"]??'',
        fullName: json["fullName"]??'',
        gender: json["gender"]??'',
        dateAndTimeOfBirth: DateTime.parse(json["dateAndTimeOfBirth"]),
        birthDetails: BirthDetails.fromJson(json["birthDetails"]),
        birthPlace: BirthPlace.fromJson(json["birthPlace"]),
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "relation": relation,
        "relationId": relationId,
        "firstName": firstName,
        "middleName": middleName,
        "lastName": lastName,
        "fullName": fullName,
        "gender": gender,
        "dateAndTimeOfBirth": dateAndTimeOfBirth.toIso8601String(),
        "birthDetails": birthDetails.toJson(),
        "birthPlace": birthPlace.toJson(),
      };
}

class BirthDetails {
  BirthDetails({
    required this.dobYear,
    required this.dobMonth,
    required this.dobDay,
    required this.tobHour,
    required this.tobMin,
    required this.meridiem,
  });

  int dobYear;
  int dobMonth;
  int dobDay;
  int tobHour;
  int tobMin;
  String meridiem;

  factory BirthDetails.fromJson(Map<String, dynamic> json) => BirthDetails(
        dobYear: json["dobYear"],
        dobMonth: json["dobMonth"],
        dobDay: json["dobDay"],
        tobHour: json["tobHour"],
        tobMin: json["tobMin"],
        meridiem: json["meridiem"],
      );

  Map<String, dynamic> toJson() => {
        "dobYear": dobYear,
        "dobMonth": dobMonth,
        "dobDay": dobDay,
        "tobHour": tobHour,
        "tobMin": tobMin,
        "meridiem": meridiem,
      };
}

class BirthPlace {
  BirthPlace({
    required this.placeName,
    required this.placeId,
  });

  String placeName;
  String placeId;

  factory BirthPlace.fromJson(Map<String, dynamic> json) => BirthPlace(
        placeName: json["placeName"],
        placeId: json["placeId"],
      );

  Map<String, dynamic> toJson() => {
        "placeName": placeName,
        "placeId": placeId,
      };
}
