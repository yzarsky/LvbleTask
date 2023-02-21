import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:frontend_home_assignment/data/base_api.dart';

import '../../../core/exceptions.dart';

abstract class PaymentsApi extends BaseApiImpl {

  Future<Response> fetchPayments();

  Future<Response> splitRent(Map<String, dynamic> data);
}

class PaymentsApiImpl extends PaymentsApi {

  @override
  Future<Response> fetchPayments() async {
    final url = buildUrl('/default/flutter-home-exam');
    debugPrint('PaymentsApi fetchPayments: $url');
    var response = (await createDio())
        .get(url, options: Options(responseType: ResponseType.json))
        .catchError(onApiError);
    return response;
  }

  @override
  Future<Response> splitRent(Map<String, dynamic> data) async {
    final url = buildUrl('/default/flutter-home-exam');
    debugPrint('PaymentsApi splitRent: $url, $data');
    var response = (await createDio())
        .post(url,
        data: jsonEncode(data),
        options: Options(responseType: ResponseType.json))
        .catchError(onBaseApiError);
    return response;
  }

  @override
  onApiError(e) {
    throw PaymentsApiErrorException(errorMsg: e.toString());
  }

}