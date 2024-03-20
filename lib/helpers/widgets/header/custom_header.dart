import 'package:ecommerce_admin_panel/helpers/extensions/theme_colors.dart';
import 'package:ecommerce_admin_panel/helpers/widgets/custom_elevated_button.dart';
import 'package:ecommerce_admin_panel/helpers/widgets/header/header_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader(
      {super.key, this.formTitle, required this.onPressed, this.previousRoute});
  final String? formTitle;
  final void Function() onPressed;
  final String? previousRoute;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: ThemeColors.grayBackground,
      child: Padding(
        padding: const EdgeInsets.only(left: 30, top: 30),
        child: Row(
          children: [
            const HeaderItem(
              text: 'Dashboard',
              showIcon: true,
            ),
            const SizedBox(
              width: 10,
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
            if (formTitle != null)
              const SizedBox(
                width: 10,
              ),
            if (formTitle != null) HeaderItem(text: formTitle!),
            const Spacer(),
            if (formTitle == null)
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: CustomElevatedButton(
                    onPressed: onPressed, text: 'Create New'),
              ),
          ],
        ),
      ),
    );
  }
}
