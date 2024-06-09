import 'package:ecommerce_admin_panel/screens/home_screen/home_screen.dart';
import 'package:ecommerce_admin_panel/screens/log_in_view/auth_controller.dart';
import 'package:ecommerce_admin_panel/screens/log_in_view/log_in_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: AuthController(),
        builder: (controller) {
          return controller.authenticated
              ? const HomeScreen()
              : const LoginView();
        });
  }
}
