// ignore_for_file: avoid_print

import 'package:dio/dio.dart';

import '../../helpers/error.dart';

class ApiHelpers {
  static List<T> parseResponse<T>(
    response,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    var data = checkError(response)['result'];
    if (data is! List) {
      data = data['data'];
    }
    return parseList(data, fromJson);
  }

  static List<T> parseList<T>(
    data,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    final parsedData = (data as List?)?.cast<Map<String, dynamic>>();
    return parsedData?.map(fromJson).toList().cast<T>() ?? [];
  }

  static Map<String, dynamic> checkError(Response response) {
    final body = response.data;
    // print('Url: ${response.requestOptions.uri}');
    print('Body: ${response.requestOptions.data}');
    // print("Cookies: ${response.requestOptions.headers['cookie']}");
    if (response.statusCode == 200 &&
        (body['success'] == true || body['success'] == 'true')) {
      return body;
    } else {
      throw ApiError(
        statusCode: response.statusCode ?? 400,
        errorCode: body['code'] ?? '',
        displayMessage: body['message'] ?? '',
      );
    }
  }

  static T? parseJsonToObject<T>(
      data, T Function(Map<String, dynamic>) fromJson) {
    if (data == null) {
      return data;
    } else if (data is Map<String, dynamic>) {
      return fromJson(data);
    } else {
      return data;
    }
  }

  static double parseValToDouble(val, {int digits = 2}) {
    return double.parse(
      (val?.toDouble() ?? 0.0).toStringAsFixed(digits),
    );
  }
}
