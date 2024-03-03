import 'package:e_commerce/models/settings.dart';
import 'package:e_commerce/screens/auth/auth_controller.dart';
import 'package:flutter/services.dart';

import 'routes.dart';
import 'screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // final themeMode = await AdaptiveTheme.getThemeMode();
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  final auth = AuthController();
  Get.put(auth);
  Get.put(SettingsController(auth: auth));
  runApp(const Clot());
}

class Clot extends StatelessWidget {
  const Clot({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(context.width, context.height),
        builder: (context, child) {
          return const GetMaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: SplashScreen.routeName,
            onGenerateRoute: Routes.onGenerateRoute,
          );
        });
  }
}
