import 'package:ecommerce_admin_panel/helpers/styles/app_colors.dart';
import 'package:ecommerce_admin_panel/helpers/styles/app_decoration.dart';
import 'package:ecommerce_admin_panel/helpers/widgets/custom_elevated_button.dart';
import 'package:ecommerce_admin_panel/helpers/widgets/header/header_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({
    super.key,
    this.formTitle,
    required this.mainTitle,
    this.onPressed,
    this.previousRoute,
    this.items,
    this.hideAddButton = false,
  });
  final bool hideAddButton;
  final List<HeaderItem>? items;
  final String mainTitle;
  final String? formTitle;
  final void Function()? onPressed;
  final String? previousRoute;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 30, top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(mainTitle,
                    style: AppDecoration.boldStyle(
                        fontSize: 25, color: AppColors.black)),
                const Spacer(),
                if (formTitle == null && !hideAddButton)
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: CustomElevatedButton(
                      onPressed: onPressed,
                      text: 'Add',
                      icon: Icons.add,
                      color: AppColors.skyBlue,
                      textColor: AppColors.white,
                    ),
                  ),
              ],
            ),
            Row(
              children: [
                const HeaderItem(
                  text: 'Dashboard',
                  showIcon: true,
                ),
                InkWell(
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: (formTitle != null && previousRoute != null)
                      ? () {
                          context.goNamed(previousRoute!);
                        }
                      : null,
                  child: HeaderItem(
                    text: 'List',
                    showIcon: formTitle != null ? true : false,
                  ),
                ),
                if (formTitle != null) HeaderItem(text: formTitle!),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
