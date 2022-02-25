import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioNetworkHelper {
  Future getData(String url) async {
    var _dio = Dio();
    try {
      // debugPrint('GetData $url');
      Response response =
          await _dio.get(url).timeout(const Duration(seconds: 30));
      return response;
    } on TimeoutException catch (e) {
      debugPrint('TimeoutException $e');
    } on SocketException catch (e) {
      debugPrint('SocketException $e');
    } on DioError catch (e) {
      debugPrint('DioError $e');
    }
    return null;
  }

  Future getAuthHeaderData(
      {required String url, required String bearerToken}) async {
    var _dio = Dio();
    try {
      // debugPrint("calling getAuthHeaderData url: " + url);
      // debugPrint(bearerToken);
      _dio.options.headers["Authorization"] = "Bearer $bearerToken";

      Response response =
          await _dio.get(url).timeout(const Duration(seconds: 30));
      return response;
    } on TimeoutException catch (e) {
      debugPrint('TimeoutException $e');
    } on SocketException catch (e) {
      debugPrint('SocketException $e');
    } on DioError catch (e) {
      debugPrint('DioError $e');
    }
    return null;
  }

  Future postDataAuthHeader({
    required String url,
    required Map postBody,
    required String bearerToken,
  }) async {
    var _dio = Dio();
    // debugPrint("calling postDataAuthHeader url: " + url);
    // debugPrint("$postBody");
    // debugPrint(bearerToken);
    try {
      _dio.options.headers["Authorization"] = "Bearer $bearerToken";
      Response response = await _dio
          .post(url, data: json.encode(postBody))
          .timeout(const Duration(seconds: 30));
      return response;
    } on TimeoutException catch (e) {
      debugPrint('TimeOut exception: $e');
    } on SocketException catch (e) {
      debugPrint('Socket Error: $e');
    } on DioError catch (e) {
      debugPrint('General Error: $e');
    }
    return null;
  }
}
