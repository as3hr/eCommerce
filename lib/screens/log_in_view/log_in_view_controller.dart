import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'auth_controller.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String get email => emailController.text;
  String get password => passwordController.text;

  void clear() {
    emailController.clear();
    passwordController.clear();
  }

  Future<void> submit() async {
    if (formKey.currentState?.validate() ?? false) {
      await Get.find<AuthController>().login(
        email,
        password,
      );
    }
  }
}
