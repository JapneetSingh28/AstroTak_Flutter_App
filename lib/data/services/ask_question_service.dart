import 'dart:convert';

import 'package:dio/dio.dart';

import '../../utilities/api_endpoints.dart';
import '../models/ask_question_model.dart';
import 'dio_network_helper.dart';

class AskQuestionService {
  final DioNetworkHelper _dioNetworkHelper = DioNetworkHelper();

  Future<List<AskQuestionModel>> fetchAskQuestions() async {
    try {
      Response? response =
          await _dioNetworkHelper.getData(ApiEndpoints.askQuestionApi);
      if (response?.statusCode == 200) {
        return List<AskQuestionModel>.from(
          response?.data["data"].map(
            (article) => askQuestionModelFromJson(
              json.encode(article),
            ),
          ),
        );
      }
    } catch (e) {
      // print('error in fetchAskQuestions $e');
    }
    return [];
  }
}
