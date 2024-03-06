import 'package:e_commerce/helpers/extensions/extensions.dart';
import 'package:e_commerce/models/settings.dart';
import 'package:e_commerce/screens/auth/auth_controller.dart';
import 'package:flutter/services.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'routes.dart';
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
    return GlobalLoaderOverlay(
      child: ScreenUtilInit(
          designSize: Size(context.screenWidth, context.screenHeight),
          builder: (context, child) {
            return Builder(builder: (context) {
              return GetMaterialApp(
                debugShowCheckedModeBanner: false,
                onGenerateRoute: Routes.onGenerateRoute,
                defaultTransition: Transition.fadeIn,
                scrollBehavior: const ScrollBehavior().copyWith(
                  physics: const BouncingScrollPhysics(),
                ),
              );
            });
          }),
    );
  }
}
