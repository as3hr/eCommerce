import 'package:dio/dio.dart';

import 'api_error.dart';

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
    // ignore: avoid_print
    print(
      'Response: ${response.data}',
    );
    final body = response.data;
    if (response.statusCode == 200 &&
        (body['success'] == true || body['success'] == 'true')) {
      return body;
    } else {
      throw ApiError(
        code: body['code'] ?? ' ',
        message: body['message'],
      );
    }
  }
}
