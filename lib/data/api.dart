import 'package:dio/dio.dart';
import 'package:e_commerce/data/api_helpers.dart';
import 'package:e_commerce/models/user.dart';

class Api {
  static final dio = Dio(BaseOptions(
      baseUrl: "http://192.168.100.46:6000",
      receiveDataWhenStatusError: true,
      validateStatus: (status) => true,
      contentType: 'application/json'));

  static Future<User> login({
    required String email,
    required String password,
  }) async {
    const url = '/auth/login';
    final response = await dio.post(url, data: {
      'email': email,
      'password': password,
    });
    final data = ApiHelpers.checkError(response)['result'];
    return User.fromJson(data);
  }

  static Future<void> logout() async {
    const url = '/auth/signOut';
    final response = await dio.post(url);
    ApiHelpers.checkError(response);
  }

  static Future<User> signUp({required User user}) async {
    const url = '/auth/signUp';
    final response = await dio.post(url, data: user.userSignUp());
    final data = ApiHelpers.checkError(response)['result'];
    return User.fromJson(data);
  }

  static Future<User> getUser() async {
    const url = '/users/profile';
    final response = await dio.get(url);
    final data = ApiHelpers.checkError(response)['result'];
    return User.fromJson(data);
  }
}
