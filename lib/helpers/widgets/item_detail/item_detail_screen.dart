import 'package:e_commerce/helpers/styles/app_colors.dart';
import 'package:e_commerce/helpers/styles/app_decoration.dart';
import 'package:e_commerce/helpers/styles/app_images.dart';
import 'package:e_commerce/helpers/widgets/custom_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../back_button.dart';
import 'components/item_size_quantity.dart';

class ItemDetailScreen extends StatelessWidget {
  static const routeName = '/item-detail';
  const ItemDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pureWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.verticalSpace,
              Row(
                children: [
                  20.horizontalSpace,
                  const CustomBackButton(),
                  const Spacer(),
                  const Image(image: AssetImage(AppImages.favIconUnfilled)),
                  20.horizontalSpace
                ],
              ),
              20.verticalSpace,
              SizedBox(
                  height: 0.45.sh,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              height: 0.45.sh,
                              width: 0.55.sw,
                              decoration: const BoxDecoration(
                                color: AppColors.grayI,
                              ),
                              child: const Center(
                                  child: Text('I M A G E  H E R E'))),
                        );
                      })),
              20.verticalSpace,
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Men's Harringtion Jacket",
                  style: AppDecoration.semiBoldStyle(
                      fontSize: 17, color: AppColors.pureBlack),
                ),
              ),
              10.verticalSpace,
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "\$148",
                  style: AppDecoration.semiBoldStyle(
                      fontSize: 17, color: AppColors.lightPurple),
                ),
              ),
              20.verticalSpace,
              const ItemSizeQuantity(),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  'Built for life and made to last, this full-zip corduroy jacket is part of our Nike Life collection. The spacious fit gives you plenty of room to layer underneath, while the soft corduroy keeps it casual and timeless.',
                  style: AppDecoration.lightStyle(
                      fontSize: 14, color: AppColors.lightBlack),
                ),
              ),
              15.verticalSpace,
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Shipping & Returns",
                  style: AppDecoration.semiBoldStyle(
                      fontSize: 17, color: AppColors.pureBlack),
                ),
              ),
              10.verticalSpace,
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Free standard shipping and free 60-day returns",
                  style: AppDecoration.lightStyle(
                      fontSize: 14, color: AppColors.pureBlack),
                ),
              ),
              15.verticalSpace,
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "4.5 Ratings",
                  style: AppDecoration.boldStyle(
                      fontSize: 25, color: AppColors.pureBlack),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: CustomTile(
                  width: 1.sw,
                  borderRadius: 30,
                  color: AppColors.lightPurple,
                  leading: Text(
                    '\$148',
                    style: AppDecoration.semiBoldStyle(
                        fontSize: 17, color: AppColors.pureWhite),
                  ),
                  trailing: Text(
                    'Add to Bag',
                    style: AppDecoration.semiMediumStyle(
                        fontSize: 17, color: AppColors.pureWhite),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
