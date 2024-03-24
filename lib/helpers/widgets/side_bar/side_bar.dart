import 'package:ecommerce_admin_panel/helpers/extensions/theme_colors.dart';
import 'package:ecommerce_admin_panel/helpers/functions/loading_wrapper.dart';
import 'package:ecommerce_admin_panel/helpers/widgets/side_bar/all_screens.dart';
import 'package:ecommerce_admin_panel/helpers/widgets/side_bar/screen_item.dart';
import 'package:ecommerce_admin_panel/screens/log_in_view/auth_controller.dart';
import 'package:ecommerce_admin_panel/routes/route_name.dart';
import 'package:ecommerce_admin_panel/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  bool showItems = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: 280,
        height: double.infinity,
        decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(color: ThemeColors.grayI),
                top: BorderSide(color: ThemeColors.grayI),
                right: BorderSide(color: ThemeColors.grayI))),
        child: Column(
          children: [
            20.verticalSpace,
            InkWell(
                onTap: () {
                  context.goNamed(RouteName.home);
                },
                child: Text(
                  'ADMIN  PANEL',
                  style: largeTextStyle,
                )),
            40.verticalSpace,
            Padding(
              padding: const EdgeInsets.only(left: 12, bottom: 5),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'NAVIGATION',
                    style: mediumTextStyle,
                  )),
            ),
            10.verticalSpace,
            ListTile(
              leading: const Icon(Icons.widgets_rounded),
              title: InkWell(
                onTap: () {
                  showItems = !showItems;
                  setState(() {});
                },
                child: Text(
                  'C L O T',
                  style: mediumTextStyle,
                ),
              ),
              trailing: showItems
                  ? InkWell(
                      onTap: () {
                        showItems = !showItems;
                        setState(() {});
                      },
                      child: const Icon(Icons.arrow_upward_rounded))
                  : InkWell(
                      onTap: () {
                        showItems = !showItems;
                        setState(() {});
                      },
                      child: const Icon(Icons.arrow_downward_sharp)),
            ),
            if (showItems)
              Expanded(
                  child: ListView.builder(
                      itemCount: AllScreens.allScreens.length,
                      itemBuilder: (context, index) {
                        final screen = AllScreens.allScreens[index];
                        return ScreenItem(screen: screen);
                      })),
            const Spacer(),
            const Divider(),
            Center(
              child: InkWell(
                onTap: () {
                  final controller = Get.find<AuthController>();
                  loadingWrapper(controller.logout)
                      .then((value) => context.goNamed(RouteName.login));
                },
                child: const Text(
                  'Sign out!',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }
}
