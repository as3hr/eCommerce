import 'package:e_commerce/screens/profile/components/profile_sub_screens/wishlist/empty_wishlist.dart';
import 'package:e_commerce/screens/profile/profile_screen_controller.dart';
import 'package:get/get.dart';

import '../../../../../helpers/functions/change_page.dart';
import '../../../../../helpers/styles/app_decoration.dart';
import '../../../../../helpers/styles/app_images.dart';
import '../../../../../helpers/widgets/custom_tile.dart';
import '../../../../../helpers/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'wishlist_collection_screen.dart';

class WishListScreen extends StatelessWidget {
  static const routeName = '/wish-list';
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileScreenController>(builder: (controller) {
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: SafeArea(
          child: Column(
            children: [
              35.verticalSpace,
              const Header(
                text: 'Wishlist',
              ),
              35.verticalSpace,
              controller.wishLists.isEmpty
                  ? const EmptyWishList()
                  : Expanded(
                      child: ListView.builder(
                          itemCount: controller.wishLists.length,
                          itemBuilder: (context, index) {
                            final wish = controller.wishLists[index];
                            return Padding(
                              padding: const EdgeInsets.all(5),
                              child: CustomTile(
                                width: 1.sw,
                                title: Text(
                                  wish.title ?? '',
                                  style: AppDecoration.mediumStyle(
                                      fontSize: 17,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondary),
                                ),
                                subTitle: Text(
                                  '${wish.products?.length} Products',
                                  style: AppDecoration.lightStyle(
                                      fontSize: 13,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondary),
                                ),
                                trailing: Image(
                                  image:
                                      const AssetImage(AppImages.arrowForward),
                                  color:
                                      Theme.of(context).colorScheme.onSecondary,
                                ),
                                trailingOnTap: () {
                                  changePage(WishListCollectionScreen.routeName,
                                      arguments: {'wish': wish});
                                },
                              ),
                            );
                          })),
            ],
          ),
        ),
      );
    });
  }
}
