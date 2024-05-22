import 'package:ecommerce_admin_panel/helpers/styles/app_colors.dart';
import 'package:ecommerce_admin_panel/helpers/functions/loading_wrapper.dart';
import 'package:ecommerce_admin_panel/helpers/styles/app_decoration.dart';
import 'package:ecommerce_admin_panel/helpers/styles/asset_images.dart';
import 'package:ecommerce_admin_panel/helpers/widgets/side_bar/all_screens.dart';
import 'package:ecommerce_admin_panel/helpers/widgets/side_bar/screen_item.dart';
import 'package:ecommerce_admin_panel/screens/log_in_view/auth_controller.dart';
import 'package:ecommerce_admin_panel/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  bool showItems = true;
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: 280,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.navy,
        ),
        child: Column(
          children: [
            10.verticalSpace,
            ListTile(
              leading: Image.asset(AssetImages.logo),
              title: InkWell(
                onTap: () {
                  showItems = !showItems;
                  setState(() {});
                },
                child: Text(
                  'C L O T',
                  style: AppDecoration.mediumStyle(
                      fontSize: 20, color: AppColors.grayI),
                ),
              ),
              subtitle: Text(
                'Production',
                style: AppDecoration.mediumStyle(
                    fontSize: 15, color: AppColors.grayII),
              ),
              trailing: showItems
                  ? InkWell(
                      onTap: () {
                        showItems = !showItems;
                        setState(() {});
                      },
                      child: const Icon(
                        Icons.arrow_circle_up,
                        color: AppColors.grayI,
                      ))
                  : InkWell(
                      onTap: () {
                        showItems = !showItems;
                        setState(() {});
                      },
                      child: const Icon(
                        Icons.arrow_circle_down,
                        color: AppColors.grayI,
                      )),
            ),
            20.verticalSpace,
            if (showItems)
              Expanded(
                  child: ListView.builder(
                      itemCount: AllScreens.allScreens.length,
                      itemBuilder: (context, index) {
                        final screen = AllScreens.allScreens[index];
                        return ScreenItem(
                          screen: screen,
                          index: index,
                          isSelected: currentIndex == index,
                          updateIndex: (index) {
                            currentIndex = index;
                            setState(() {});
                          },
                        );
                      })),
            const Spacer(),
            const Divider(),
            Center(
              child: InkWell(
                onTap: () {
                  final controller = Get.find<AuthController>();
                  loadingWrapper(controller.logout, context)
                      .then((value) => context.goNamed(RouteName.login));
                },
                child: Row(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 25, bottom: 8, top: 8),
                      child: Text(
                        'Sign out',
                        style: AppDecoration.semiBoldStyle(
                            fontSize: 20, color: AppColors.white),
                      ),
                    ),
                    const Spacer(),
                    const Icon(Icons.logout, color: AppColors.white),
                    12.horizontalSpace,
                  ],
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
