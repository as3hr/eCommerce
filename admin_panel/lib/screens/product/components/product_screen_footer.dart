import 'package:ecommerce_admin_panel/screens/product/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../helpers/functions/loading_wrapper.dart';
import '../../../helpers/styles/app_colors.dart';
import '../../../helpers/widgets/custom_elevated_button.dart';
import '../../../routes/route_name.dart';

class ProductScreenFooter extends StatelessWidget {
  const ProductScreenFooter({super.key, required this.isNew});
  final bool isNew;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(builder: (controller) {
      return SizedBox(
        width: 0.81.sw,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomElevatedButton(
                textColor: Colors.black,
                onPressed: () {
                  context.goNamed(RouteName.productsList);
                },
                text: 'Cancel'),
            5.horizontalSpace,
            CustomElevatedButton(
                textColor: Colors.white,
                color: AppColors.skyBlue,
                onPressed: () async {
                  if (isNew) {
                    await loadingWrapper(
                        () => controller.createProduct().then(
                            (value) => context.goNamed(RouteName.productsList)),
                        context);
                  } else {
                    await loadingWrapper(
                        () => controller.updateProduct().then(
                            (value) => context.goNamed(RouteName.productsList)),
                        context);
                  }
                },
                text: isNew ? 'Create' : 'Update'),
          ],
        ),
      );
    });
  }
}
