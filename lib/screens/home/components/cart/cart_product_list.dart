import 'package:e_commerce/helpers/functions/change_page.dart';
import 'package:e_commerce/helpers/widgets/item_detail/item_detail_screen.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../helpers/styles/app_colors.dart';
import '../../../../helpers/styles/app_decoration.dart';
import '../../../../helpers/styles/app_images.dart';
import '../../../../helpers/widgets/custom_tile.dart';

class CartProductList extends StatelessWidget {
  const CartProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              changePage(ItemDetailScreen.routeName);
            },
            child: CustomTile(
              height: 80,
              leading: const Image(image: AssetImage(AppImages.profile)),
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Men's Harrington Jacket",
                  style: AppDecoration.mediumStyle(
                      fontSize: 15, color: AppColors.lightBlack),
                ),
              ),
              subTitle: Padding(
                padding: const EdgeInsets.only(bottom: 8, left: 8),
                child: EasyRichText(
                  'Size-M',
                  patternList: [
                    EasyRichTextPattern(
                        targetString: 'M',
                        style: AppDecoration.boldStyle(
                            fontSize: 13, color: AppColors.pureBlack)),
                  ],
                ),
              ),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('\$148.00',
                      style: AppDecoration.boldStyle(
                          fontSize: 16, color: AppColors.pureBlack)),
                  5.verticalSpace,
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 13,
                        backgroundColor: AppColors.lightPurple,
                        child: Center(
                            child: Text(
                          '+',
                          style: AppDecoration.mediumStyle(
                              fontSize: 13, color: AppColors.pureWhite),
                        )),
                      ),
                      5.horizontalSpace,
                      CircleAvatar(
                        radius: 13,
                        backgroundColor: AppColors.lightPurple,
                        child: Center(
                            child: Text(
                          "−",
                          style: AppDecoration.mediumStyle(
                              fontSize: 13, color: AppColors.pureWhite),
                        )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
