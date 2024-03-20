import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/auth.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _rememberMe = false;

  bool get rememberMe => _rememberMe;

  set rememberMe(bool value) {
    _rememberMe = value;
    update();
  }

  String get email => emailController.text;

  String get password => passwordController.text;

  void clear() {
    emailController.clear();
    passwordController.clear();
  }

  Future<void> submit() async {
    if (formKey.currentState?.validate() ?? false) {
      await Get.find<Auth>().login(
        email,
        password,
        rememberMe: _rememberMe,
      );
    }
  }
}
