import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract class BaseApi {
  Future<Dio> createDio({List<String>? extraCookies});

  String getBaseUrl();

  onApiError(e);
}

abstract class BaseApiImpl extends BaseApi {

  @override
  Future<Dio> createDio({List<String>? extraCookies}) async {
    return Dio();
  }

  String buildUrl(String path) {
    return Uri.https(getBaseUrl(), path).toString();
  }

  @override
  String getBaseUrl() => 'a21wk56avh.execute-api.us-east-1.amazonaws.com';

  void onBaseApiError(e, [s]) {
    debugPrint('onApiError $e');
    onApiError(e);
  }

}