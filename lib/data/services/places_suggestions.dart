import 'dart:convert';

import '../models/place_suggestion_model.dart';
import 'package:dio/dio.dart';

import '../../utilities/api_endpoints.dart';
import 'dio_network_helper.dart';

class PlacesSuggestionsService {
  final DioNetworkHelper _dioNetworkHelper = DioNetworkHelper();

  Future<List<PlaceSuggestionModel>> fetchPlacesSuggestions(
      {required String place}) async {
    try {
      Response? response = await _dioNetworkHelper
          .getData(ApiEndpoints.placesSuggestionsApi(place: place));
      if (response?.statusCode == 200) {
        return List<PlaceSuggestionModel>.from(
          response?.data["data"].map(
            (article) => placeSuggestionModelFromJson(
              json.encode(article),
            ),
          ),
        );
      }
    } catch (e) {
      // print('error in fetchPlacesSuggestions $e');
    }
    return [];
  }
}
