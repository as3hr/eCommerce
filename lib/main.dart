import 'dart:io';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:ecommerce_admin_panel/helpers/extensions/theme_colors.dart';
import 'package:ecommerce_admin_panel/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'models/auth.dart';
import 'routes/route_generator.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final themeMode = await AdaptiveTheme.getThemeMode();
  HttpOverrides.global = MyHttpOverrides();
  Get.put(Auth());
  runApp(AdminPanel(initialThemeMode: themeMode));
}

class AdminPanel extends StatelessWidget {
  const AdminPanel({super.key, this.initialThemeMode});
  final AdaptiveThemeMode? initialThemeMode;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(1000, 600),
        builder: (context, child) {
          return AdaptiveTheme(
              light: theme(),
              dark: theme(dark: true),
              initial: initialThemeMode ?? AdaptiveThemeMode.system,
              builder: (light, dark) {
                return GlobalLoaderOverlay(
                  overlayOpacity: 0,
                  overlayColor: ThemeColors.black,
                  child: GetMaterialApp.router(
                    defaultTransition: Transition.fadeIn,
                    transitionDuration: const Duration(milliseconds: 500),
                    routeInformationParser:
                        AppRouter.router.routeInformationParser,
                    routeInformationProvider:
                        AppRouter.router.routeInformationProvider,
                    routerDelegate: AppRouter.router.routerDelegate,
                    debugShowCheckedModeBanner: false,
                    title: 'Admin Panel',
                  ),
                );
              });
        });
  }
}
