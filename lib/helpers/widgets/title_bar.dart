import 'package:ecommerce_admin_panel/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../screens/log_in_view/auth_controller.dart';
import '../extensions/theme_colors.dart';

class TitleBar extends StatelessWidget {
  const TitleBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: double.infinity,
        height: 70,
        decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(color: ThemeColors.grayI),
                top: BorderSide(color: ThemeColors.grayI))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Text(
                  Get.put(AuthController()).user?.email ?? '',
                  style: mediumTextStyle,
                ),
              ),
              const CircleAvatar(
                backgroundColor: ThemeColors.navy,
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
