// ignore_for_file: unused_local_variable

import 'package:e_commerce/screens/auth/login/login_screen.dart';
import 'package:e_commerce/screens/auth/sign_up/sign_up.dart';
import 'package:e_commerce/screens/bottom_bar/bottom_nav_bar.dart';
import 'package:e_commerce/screens/home/home_screen.dart';
import 'package:e_commerce/screens/notification/notification_screen.dart';
import 'package:e_commerce/screens/order/components/order_detail/order_detail.dart';
import 'package:e_commerce/screens/order/order_screen.dart';
import 'package:e_commerce/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screens/splash_screen/splash_screen.dart';

class Routes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args =
        (settings.arguments ?? <String, dynamic>{}) as Map<String, dynamic>;

    switch (settings.name) {
      case SplashScreen.routeName:
        return GetPageRoute(
          transition: Transition.fadeIn,
          transitionDuration: const Duration(milliseconds: 400),
          settings: settings,
          page: () => const SplashScreen(),
        );
      case SignUp.routeName:
        return GetPageRoute(
          transition: Transition.fadeIn,
          transitionDuration: const Duration(milliseconds: 400),
          settings: settings,
          page: () => const SignUp(),
        );
      case LoginScreen.routeName:
        return GetPageRoute(
          transition: Transition.fadeIn,
          transitionDuration: const Duration(milliseconds: 400),
          settings: settings,
          page: () => const LoginScreen(),
        );
      case BottomNavBar.routeName:
        return GetPageRoute(
          transition: Transition.fadeIn,
          transitionDuration: const Duration(milliseconds: 400),
          settings: settings,
          page: () => const BottomNavBar(),
        );
      case HomeScreen.routeName:
        return GetPageRoute(
          transition: Transition.fadeIn,
          transitionDuration: const Duration(milliseconds: 400),
          settings: settings,
          page: () => const HomeScreen(),
        );
      case ProfileScreen.routeName:
        return GetPageRoute(
          transition: Transition.fadeIn,
          transitionDuration: const Duration(milliseconds: 400),
          settings: settings,
          page: () => const ProfileScreen(),
        );
      case OrderScreen.routeName:
        return GetPageRoute(
          transition: Transition.fadeIn,
          transitionDuration: const Duration(milliseconds: 400),
          settings: settings,
          page: () => const OrderScreen(),
        );
      case OrderDetail.routeName:
        return GetPageRoute(
          transition: Transition.fadeIn,
          transitionDuration: const Duration(milliseconds: 400),
          settings: settings,
          page: () => const OrderDetail(),
        );
      case NotificationScreen.routeName:
        return GetPageRoute(
          transition: Transition.fadeIn,
          transitionDuration: const Duration(milliseconds: 400),
          settings: settings,
          page: () => const NotificationScreen(),
        );
      default:
        return _errorRoute(settings);
    }
  }

  static Route<dynamic> _errorRoute(settings) {
    return GetPageRoute(
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
      settings: settings,
      page: () {
        return const Scaffold(
          body: Center(
            child: Text('Page Not Found'),
          ),
        );
      },
    );
  }
}
