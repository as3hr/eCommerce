// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../routes/route_name.dart';
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

  Future<void> submit(BuildContext context) async {
    if (formKey.currentState?.validate() ?? false) {
      await Get.find<AuthController>().login(
        email,
        password,
      );
      context.goNamed(RouteName.home);
    }
  }
}
