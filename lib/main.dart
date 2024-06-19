import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:e_commerce/firebase_options.dart';
import 'package:e_commerce/helpers/extensions/extensions.dart';
import 'package:e_commerce/models/settings.dart';
import 'package:e_commerce/screens/auth/auth_controller.dart';
import 'package:e_commerce/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    statusBarColor: Colors.transparent,
  ));
  final themeMode = await AdaptiveTheme.getThemeMode();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final auth = AuthController();
  Get.put(auth);
  Get.put(SettingsController(auth: auth));
  runApp(Clot(initialThemeMode: themeMode));
}

class Clot extends StatelessWidget {
  const Clot({
    super.key,
    this.initialThemeMode,
  });
  final AdaptiveThemeMode? initialThemeMode;
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
        light: theme(),
        dark: theme(dark: true),
        initial: AdaptiveThemeMode.light,
        builder: (light, dark) {
          return GlobalLoaderOverlay(
            child: ScreenUtilInit(
                designSize: Size(context.screenWidth, context.screenHeight),
                builder: (context, child) {
                  return Builder(builder: (context) {
                    return GetMaterialApp(
                      theme: light,
                      darkTheme: dark,
                      debugShowCheckedModeBanner: kDebugMode,
                      onGenerateRoute: Routes.onGenerateRoute,
                      defaultTransition: Transition.fadeIn,
                      scrollBehavior: const ScrollBehavior().copyWith(
                        physics: const BouncingScrollPhysics(),
                      ),
                    );
                  });
                }),
          );
        });
  }
}
