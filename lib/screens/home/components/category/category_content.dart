import 'package:e_commerce/helpers/styles/app_colors.dart';
import 'package:e_commerce/helpers/widgets/item_container.dart';
import 'package:e_commerce/helpers/widgets/modal_drop_down.dart';
import 'package:e_commerce/screens/order/components/tab/order_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: OrderTab(text: 'On Sale'),
              ),
              ModalDropDown(
                text: 'Price',
                textColor: AppColors.pureWhite,
                color: AppColors.lightPurple,
                onTap: () {},
              ),
              ModalDropDown(
                text: 'Sort By',
                onTap: () {},
              ),
              ModalDropDown(
                text: 'Men',
                textColor: AppColors.pureWhite,
                color: AppColors.lightPurple,
                onTap: () {},
              ),
            ],
          ),
          10.verticalSpace,
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text('53 Results found'),
          ),
          10.verticalSpace,
          Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 280,
                    width: 1.sw,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ItemContainer(
                          image: '',
                          title: 'Women T shirt',
                          price: 3000,
                          onTap: () {}),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
