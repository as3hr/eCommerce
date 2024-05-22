import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../helpers/styles/app_colors.dart';
import '../../../helpers/styles/app_decoration.dart';

class TopSelling extends StatelessWidget {
  const TopSelling({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 0.5.sh,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text('Top Selling Products',
                  style: AppDecoration.boldStyle(
                      fontSize: 18, color: AppColors.black)),
            ),
            10.verticalSpace,
            Expanded(
              child: Card(
                elevation: 10,
                surfaceTintColor: AppColors.white,
                color: AppColors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Container(
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.boldRed,
                          ),
                        ),
                        title: Text('PRODUCT TITLE',
                            style: AppDecoration.mediumStyle(
                                fontSize: 15, color: AppColors.black)),
                        subtitle: Text('PRODUCT SUB TITLE'.toLowerCase(),
                            style: AppDecoration.mediumStyle(
                                fontSize: 15, color: AppColors.black)),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
