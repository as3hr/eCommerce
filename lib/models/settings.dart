import 'dart:async';

import 'package:e_commerce/screens/auth/login/login_screen.dart';
import 'package:e_commerce/screens/bottom_bar/bottom_nav_bar.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../screens/auth/auth_controller.dart';

class SettingsController extends GetxController {
  final showSplash = true.obs;
  final isInitialized = false.obs;
  final AuthController auth;
  Worker? worker;
  int state = 0;
  @override
  SettingsController({required this.auth}) {
    initializeSettings();
    worker = everAll(
      [showSplash, isInitialized, auth.isInitialized, auth.token],
      (val) => navigateScreen(),
    );
  }

  void navigateScreen() {
    if (!showSplash.value && isInitialized.value && auth.isInitialized.value) {
      if (state == 0 || state.isOdd == auth.authenticated) {
        Get.offNamedUntil(
          auth.authenticated ? BottomNavBar.routeName : LoginScreen.routeName,
          (route) => false,
        );
        state = auth.authenticated ? 2 : 1;
      }
    }
  }

  Future<void> initializeSettings() async {
    Timer(const Duration(seconds: 2), () async {
      showSplash.value = false;
      await SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom],
      );
      update();
    });
    isInitialized.value = true;
  }
}
