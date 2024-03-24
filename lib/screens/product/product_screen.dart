import 'package:ecommerce_admin_panel/helpers/widgets/header/custom_header.dart';
import 'package:ecommerce_admin_panel/screens/product/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../helpers/widgets/form/base_form.dart';
import '../../helpers/widgets/form/form_fields.dart';
import '../../routes/route_name.dart';
import '../../theme.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(builder: (controller) {
      final product = controller.getCurrentProduct;
      final isNew = product.id?.isEmpty ?? true;
      return Scaffold(
        backgroundColor: lightColorScheme.onBackground,
        body: Column(
          children: [
            CustomHeader(
              formTitle: 'Products',
              onPressed: () {},
              previousRoute: RouteName.productsList,
            ),
            Expanded(
                child: BaseForm(
                    deletefunction: () async {
                      controller.deleteProduct().then(
                          (value) => context.goNamed(RouteName.productsList));
                    },
                    savefunction: controller.createProduct,
                    updatefunction: controller.updateProduct,
                    isNew: isNew,
                    formFieldsList: [
                  if (!isNew)
                    BaseTextFieldModel(
                        title: 'Product Id',
                        prefixText: product.id,
                        readOnly: true),
                  BaseTextFieldModel(
                    title: 'Product title',
                    prefixText: product.title,
                    onSelected: (val) {
                      product.title = val;
                    },
                  ),
                  BaseTextFieldModel(
                    title: 'Description',
                    prefixText: product.description,
                    onSelected: (val) {
                      product.description = val;
                    },
                  ),
                  BaseDropDownFieldModel(
                    title: 'Product category',
                    onSelected: (val) {
                      product.category = val;
                    },
                    preFilledVal: product.category,
                    dropdownItems: [
                      'Hoodies',
                      'Shorts',
                      'Shoes',
                      'Bag',
                      'Accessories',
                      'Jeans',
                      'Shirts',
                      'Watches',
                      'Trousers'
                    ],
                  ),
                  BaseNumberFieldModel(
                    title: 'Product Price',
                    prefixNumber: product.price,
                    onSelected: (val) {
                      product.price = val;
                    },
                  ),
                  BaseDropDownFieldModel(
                      title: 'Size',
                      dropdownItems: [
                        'Small',
                        'Medium',
                        'Large',
                        'Extra Large',
                      ],
                      preFilledVal: product.size,
                      onSelected: (val) {
                        product.size = val;
                      })
                ]))
          ],
        ),
      );
    });
  }
}
