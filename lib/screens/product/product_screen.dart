import 'package:ecommerce_admin_panel/helpers/functions/loading_wrapper.dart';
import 'package:ecommerce_admin_panel/helpers/widgets/custom_elevated_button.dart';
import 'package:ecommerce_admin_panel/helpers/widgets/header/custom_header.dart';
import 'package:ecommerce_admin_panel/screens/product/components/product_screen_footer.dart';
import 'package:ecommerce_admin_panel/screens/product/components/product_screen_form.dart';
import 'package:ecommerce_admin_panel/screens/product/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../routes/route_name.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(builder: (controller) {
      final product = controller.getCurrentProduct;
      final isNew = product.id?.isEmpty ?? true;
      return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 0.81.sw,
              child: Row(
                children: [
                  Expanded(
                    child: CustomHeader(
                      mainTitle:
                          isNew ? 'Create a New Product' : 'Update a Product',
                      formTitle: 'Products',
                      onPressed: () {},
                      previousRoute: RouteName.productsList,
                    ),
                  ),
                  const Spacer(),
                  if (!isNew)
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: CustomElevatedButton(
                        icon: Icons.delete,
                        textColor: Colors.red,
                        onPressed: () async {
                          await loadingWrapper(
                              () => controller.deleteProduct().then((value) =>
                                  context.goNamed(RouteName.productsList)),
                              context);
                        },
                        text: 'Delete',
                      ),
                    ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    children: [
                      const ProductScreenForm(),
                      10.verticalSpace,
                      ProductScreenFooter(isNew: isNew),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
