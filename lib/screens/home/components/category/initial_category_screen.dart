import 'package:e_commerce/helpers/styles/app_colors.dart';
import 'package:e_commerce/helpers/styles/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'category_item.dart';

class InitialCategoryScreen extends StatelessWidget {
  const InitialCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          20.verticalSpace,
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text('Shop By Categories'),
          ),
          10.verticalSpace,
          Expanded(
            child: ListView.builder(
                itemCount: CategoryItem.allCategories.length,
                itemBuilder: (context, index) {
                  final item = CategoryItem.allCategories[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 1.sw,
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.grayI,
                      ),
                      child: Center(
                          child: ListTile(
                              leading: const Image(
                                  image: AssetImage(AppImages.profile)),
                              title: Text(item.title))),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
