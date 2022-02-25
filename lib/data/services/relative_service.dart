import 'dart:convert';

import 'package:dio/dio.dart';

import '../../utilities/api_endpoints.dart';
import '../../utilities/api_keys.dart';
import '../models/relative_model.dart';
import 'dio_network_helper.dart';

class RelativeService {
  final DioNetworkHelper _dioNetworkHelper = DioNetworkHelper();

  Future<dynamic> fetchRelativesProfiles() async {
    try {
      Response response = await _dioNetworkHelper.getAuthHeaderData(
          url: ApiEndpoints.relativeListApi, bearerToken: ApiKeys.bearerToken);
      if (response.statusCode == 200) {
        if (response.data["data"] != null) {
          return relativeModelFromJson(json.encode(response.data["data"]));
        }
        return 200;
      } else if (response.data['message'] != null) {
        return response.data['message'];
      }
    } catch (e) {
      // print('error in fetchRelatives $e');
    }
    return null;
  }

  Future<bool> addRelativeProfile({required postBody}) async {
    try {
      Response? response = await _dioNetworkHelper.postDataAuthHeader(
          url: ApiEndpoints.addRelativeApi,
          bearerToken: ApiKeys.bearerToken,
          postBody: postBody);
      if (response?.statusCode == 200) {
        return true;
      }
    } catch (e) {
      // print('error in fetchRelatives $e');
    }
    return false;
  }

  Future<bool> updateRelativeProfile(
      {required String uuid, required Map postBody}) async {
    try {
      Response? response = await _dioNetworkHelper.postDataAuthHeader(
          url: ApiEndpoints.updateRelativeApi(uuid: uuid),
          bearerToken: ApiKeys.bearerToken,
          postBody: postBody);
      if (response?.statusCode == 200) {
        return true;
      }
    } catch (e) {
      // print('error in fetchRelatives $e');
    }
    return false;
  }

  Future<bool> deleteRelativeProfile({required String uuid}) async {
    try {
      Response? response = await _dioNetworkHelper.postDataAuthHeader(
          url: ApiEndpoints.deleteRelativeApi(uuid: uuid),
          bearerToken: ApiKeys.bearerToken,
          postBody: {});
      if (response?.statusCode == 200) {
        return true;
      }
    } catch (e) {
      // print('error in fetchRelatives $e');
    }
    return false;
  }
}
