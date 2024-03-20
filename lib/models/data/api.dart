import 'package:ecommerce_admin_panel/models/data/api_helpers.dart';
import 'package:ecommerce_admin_panel/models/user.dart';
import 'package:dio/dio.dart';

class Api {
  static final dio = Dio(
    BaseOptions(
      extra: {
        "withCredentials": true,
        // "Access-Control-Allow-Credentials": true,
        // "Access-Control-Allow-Headers": '*',
        // "Access-Control-Allow-Origin": "https://debtreview.app/api/v1",
        // "Set-Cookie":
        //     "session=[session_id]; Expires=[expire_time]; Secure; SameSite=None"
      },
      baseUrl: 'http:/192.168.100.49:6000',
      receiveDataWhenStatusError: true,
      validateStatus: (status) => true,
      contentType: 'application/json',
    ),
  );

  static const defaultLimit = 50;

  static Future<User> login(
      {required String email, required String password}) async {
    const url = '/auth/login';
    final response = await dio.post(url, data: {
      "email": email,
      "password": password,
    });
    final data = ApiHelpers.checkError(response)['result'];
    return User.fromJson(data);
  }

  static Future<void> logOut() async {
    const url = '/auth/signout';
    final response = await dio.post(url);
    ApiHelpers.checkError(response);
  }

  static Future<User> fetchProfile() async {
    const url = '/users/';
    final response = await dio.get(
      url,
    );
    final data = ApiHelpers.checkError(response)['result'];
    return User.fromJson(data);
  }
}
