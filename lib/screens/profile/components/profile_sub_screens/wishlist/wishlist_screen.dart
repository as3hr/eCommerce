import 'package:e_commerce/helpers/functions/change_page.dart';
import 'package:e_commerce/helpers/styles/app_decoration.dart';
import 'package:e_commerce/helpers/styles/app_images.dart';
import 'package:e_commerce/helpers/widgets/custom_tile.dart';
import 'package:e_commerce/helpers/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../helpers/styles/app_colors.dart';
import 'wishlist_collection_screen.dart';

class WishListScreen extends StatelessWidget {
  static const routeName = '/wish-list';
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pureWhite,
      body: SafeArea(
        child: Column(
          children: [
            35.verticalSpace,
            const Header(text: 'Wishlist'),
            35.verticalSpace,
            Padding(
              padding: const EdgeInsets.all(5),
              child: CustomTile(
                width: 1.sw,
                leading: const Image(
                  image: AssetImage(AppImages.favIconUnfilled),
                  color: AppColors.pureBlack,
                ),
                title: Text(
                  'My Favorite',
                  style: AppDecoration.mediumStyle(
                      fontSize: 17, color: AppColors.pureBlack),
                ),
                subTitle: Text(
                  '12 Products',
                  style: AppDecoration.lightStyle(
                      fontSize: 13, color: AppColors.lightBlack),
                ),
                trailing: const Image(
                  image: AssetImage(AppImages.arrowForward),
                  color: AppColors.pureBlack,
                ),
                trailingOnTap: () {
                  changePage(WishListCollectionScreen.routeName,
                      arguments: {'title': 'My Favorite'});
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: CustomTile(
                width: 1.sw,
                leading: const Image(
                  image: AssetImage(AppImages.favIconUnfilled),
                  color: AppColors.pureBlack,
                ),
                title: Text(
                  'T-Shirts',
                  style: AppDecoration.mediumStyle(
                      fontSize: 17, color: AppColors.pureBlack),
                ),
                subTitle: Text(
                  '4 Products',
                  style: AppDecoration.lightStyle(
                      fontSize: 13, color: AppColors.lightBlack),
                ),
                trailing: const Image(
                  image: AssetImage(AppImages.arrowForward),
                  color: AppColors.pureBlack,
                ),
                trailingOnTap: () {
                  changePage(WishListCollectionScreen.routeName,
                      arguments: {'title': 'T-Shirts'});
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
