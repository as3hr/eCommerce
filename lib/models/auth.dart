import 'dart:async';

import 'package:ecommerce_admin_panel/models/data/api.dart';
import 'package:ecommerce_admin_panel/models/user.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../helpers/error.dart';
import 'token.dart';

class Auth extends GetxController {
  final token = Rx<Token?>(null);
  final isAuthenticated = Rx<bool>(false);
  User? _user;
  User? get user => _user;
  set user(User? value) {
    _user = value;
    update();
  }

  bool get authenticated => isAuthenticated.value;

  @override
  void onInit() {
    addInterceptors();
    super.onInit();
  }

  void addInterceptors() {
    Api.dio.interceptors.addAll([
      InterceptorsWrapper(
        onResponse: (response, handler) async {
          if (response.headers.map.containsKey('Set-Cookie')) {
            final tokenVal = Token(
              accessToken: (response.headers['Set-Cookie'] as List)[0],
            );
            token.value = tokenVal;
            update();
          }
          return handler.next(response);
        },
        onRequest: (options, handler) async {
          if (token.value != null) {
            options.headers['Cookie'] = token.value;
          }
          if (options.queryParameters.containsValue('')) {
            options.queryParameters.removeWhere((key, value) => value == '');
          }
          return handler.next(options);
        },
      ),
      PrettyDioLogger(
        request: true,
        requestHeader: false,
        requestBody: false,
        responseBody: false,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    ]);
  }

  Future<void> login(
    String email,
    String password, {
    bool rememberMe = false,
  }) async {
    _user = await Api.login(email: email, password: password);
    isAuthenticated.value = true;
    update();
  }

  Future<void> fetchProfile() async {
    _user = await Api.fetchProfile();
    update();
  }

  Future<void> logout() async {
    await Api.logOut();
    Token.clearToken();
    token.value = null;
    _user = null;
    update();
  }

  Future<void> autoLogin() async {
    final storedTokens = await Token.fetchTokens();
    if (storedTokens != null) {
      try {
        token.value = storedTokens;
        await fetchProfile();
      } on ApiError catch (e) {
        if (e.type == ErrorType.invalidTokens) {
          Token.clearToken();
          token.value = null;
        }
      }
    }
  }
}
