import 'package:ecommerce_admin_panel/helpers/styles/asset_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/app_colors.dart';

class TitleBar extends StatelessWidget {
  const TitleBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: double.infinity,
        height: 70,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Spacer(),
              Stack(
                children: [
                  Image.asset(
                    AssetImages.bell,
                    height: 30,
                    scale: 1,
                  ),
                  Positioned(
                      right: 2,
                      bottom: 15,
                      child: Container(
                        height: 15,
                        width: 15,
                        decoration: BoxDecoration(
                          color: AppColors.boldRed,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Center(
                          child: Text(
                            '2',
                            style:
                                TextStyle(color: AppColors.white, fontSize: 10),
                          ),
                        ),
                      )),
                ],
              ),
              10.horizontalSpace,
              const CircleAvatar(
                backgroundColor: AppColors.navy,
                child: Icon(
                  Icons.person,
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
