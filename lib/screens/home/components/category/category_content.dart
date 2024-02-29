import '../../../../helpers/functions/bottom_sheet.dart';
import '../../../../helpers/styles/app_colors.dart';
import '../../../../helpers/styles/app_decoration.dart';
import '../../../../helpers/widgets/bottom_sheet/bottom_sheet_container.dart';
import '../../../../helpers/widgets/custom_bottom_sheet_body.dart';
import '../../../../helpers/widgets/custom_container.dart';
import '../../../../helpers/widgets/item_container.dart';
import '../../../../helpers/widgets/modal_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../helpers/functions/change_page.dart';
import '../../../../helpers/widgets/item_detail/item_detail_screen.dart';

class CategoryContent extends StatelessWidget {
  const CategoryContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          15.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomContainer(
                    onTap: () {},
                    text: 'On Sale',
                    color: AppColors.grayI,
                    textColor: AppColors.pureBlack,
                    height: 35,
                    width: 0.19.sw,
                    fontSize: 15.5,
                  )),
              ModalDropDown(
                text: 'Price',
                textColor: AppColors.pureWhite,
                color: AppColors.lightPurple,
                onTap: () {},
              ),
              ModalDropDown(
                text: 'Sort By',
                onTap: () {
                  viewBottomSheet(
                      context,
                      'Sort By',
                      const CustomBottomSheetBody(containers: [
                        BottomSheetContainer(title: 'Recommended', index: 0),
                        BottomSheetContainer(title: 'Newest', index: 1),
                        BottomSheetContainer(
                            title: 'Lowset-Highest Price', index: 2),
                        BottomSheetContainer(
                            title: 'Highest-Lowest Price', index: 3),
                      ]));
                },
              ),
              ModalDropDown(
                text: 'Men',
                textColor: AppColors.pureWhite,
                color: AppColors.lightPurple,
                onTap: () {
                  viewBottomSheet(
                      context,
                      'Gender',
                      const CustomBottomSheetBody(containers: [
                        BottomSheetContainer(title: 'Men', index: 0),
                        BottomSheetContainer(title: 'Women', index: 1),
                        BottomSheetContainer(title: 'Kids', index: 2),
                      ]));
                },
              ),
            ],
          ),
          10.verticalSpace,
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              '53 Results found',
              style: AppDecoration.semiMediumStyle(
                  fontSize: 18, color: AppColors.lightBlack),
            ),
          ),
          10.verticalSpace,
          Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                ),
                padding: EdgeInsets.zero,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: ItemContainer(
                        image: '',
                        width: 0.463.sw,
                        title: 'Women T shirt',
                        price: 3000,
                        onTap: () {
                          changePage(ItemDetailScreen.routeName);
                        }),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
