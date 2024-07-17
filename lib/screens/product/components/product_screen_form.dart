import 'package:ecommerce_admin_panel/screens/product/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../helpers/styles/app_decoration.dart';
import '../../../helpers/widgets/form/fields/base_number_field.dart';
import '../../../helpers/widgets/form/fields/base_text_field.dart';
import '../../../helpers/widgets/form/fields/drop_down_field.dart';
import '../../../helpers/widgets/form/fields/image_field/base_image_field.dart';
import '../../../helpers/widgets/form/form_section.dart';

class ProductScreenForm extends StatelessWidget {
  const ProductScreenForm({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(builder: (controller) {
      final product = controller.getCurrentProduct;
      final isNew = product.id?.isEmpty ?? true;
      return Column(
        children: [
          FormSection(
            sectionTitle: Text(
              'Basic Details',
              style:
                  AppDecoration.mediumStyle(fontSize: 20, color: Colors.black),
            ),
            sectionBody: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!isNew)
                  BaseTextField(
                      title: 'Product Id',
                      preFilledValue: product.id,
                      readOnly: true),
                BaseTextField(
                  preFilledValue: product.title,
                  title: 'Product Name',
                  onChanged: (val) {
                    product.title = val;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 8),
                  child: Text(
                    'Description',
                    style: AppDecoration.boldStyle(
                        fontSize: 15, color: Colors.black45),
                  ),
                ),
                BaseTextField(
                  preFilledValue: product.description,
                  hintText: 'Write Something',
                  onChanged: (val) {
                    product.description = val;
                  },
                  isMultiLineField: true,
                ),
                DropDownField(
                    title: 'Gender',
                    preFilledVal: product.gender,
                    onChanged: (val) {
                      product.gender = val;
                    },
                    dropdownItems: const [
                      'Men',
                      'Women',
                      'Kids',
                    ]),
                DropDownField(
                    title: 'Size',
                    dropdownItems: const [
                      'Small',
                      'Medium',
                      'Large',
                      'Extra Large',
                    ],
                    preFilledVal: product.size,
                    onChanged: (val) {
                      product.size = val;
                    }),
              ],
            ),
          ),
          10.verticalSpace,
          FormSection(
              sectionTitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Images',
                    style: AppDecoration.mediumStyle(
                        fontSize: 20, color: Colors.black),
                  ),
                  Text(
                    'Images will appear in the store front of your app',
                    style: AppDecoration.lightStyle(
                        fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
              sectionBody: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BaseImageFormField(
                      prefixImages: product.images,
                      getImages: (images) {
                        controller.distributeImages(images);
                      }),
                ],
              )),
          10.verticalSpace,
          FormSection(
              sectionTitle: Text(
                'Pricing',
                style: AppDecoration.mediumStyle(
                    fontSize: 20, color: Colors.black),
              ),
              sectionBody: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (!isNew)
                    BaseNumberField(
                      title: 'Old Price',
                      preFilledNumber: product.price,
                      readOnly: true,
                    ),
                  BaseNumberField(
                    title: isNew ? 'Product price' : 'New Price',
                    onChanged: (val) {
                      if (val != '') {
                        product.price = double.parse(val as String);
                      }
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      '(prices in usd)',
                      style: AppDecoration.lightStyle(
                          fontSize: 12, color: Colors.grey),
                    ),
                  ),
                ],
              )),
          10.verticalSpace,
          FormSection(
              sectionTitle: Text(
                'Category',
                style: AppDecoration.mediumStyle(
                    fontSize: 20, color: Colors.black),
              ),
              sectionBody: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DropDownField(
                    title: 'Category',
                    onChanged: (val) {
                      product.category = val;
                    },
                    preFilledVal: product.category,
                    dropdownItems: const [
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
                ],
              )),
          10.verticalSpace,
          FormSection(
              sectionTitle: Text(
                'Additional Information',
                style: AppDecoration.mediumStyle(
                    fontSize: 20, color: Colors.black),
              ),
              sectionBody: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DropDownField(
                      title: 'Product Rating',
                      preFilledVal: product.rating,
                      onChanged: (val) {
                        product.rating = int.parse(val.toString());
                      },
                      dropdownItems: const [1, 2, 3, 4, 5]),
                ],
              )),
        ],
      );
    });
  }
}
