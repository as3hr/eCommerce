import 'package:e_commerce/helpers/widgets/indicator.dart';
import 'package:e_commerce/screens/home/components/category/category_filters.dart';
import 'package:e_commerce/screens/home/components/category/empty_categories.dart';
import 'package:get/get.dart';

import '../../../../helpers/styles/app_decoration.dart';
import '../../../../helpers/widgets/back_button.dart';
import '../../../../helpers/widgets/item_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../helpers/widgets/search_field.dart';
import 'category_screen_controller.dart';

class CategoryContent extends StatelessWidget {
  static const routeName = '/category-content';
  const CategoryContent({super.key, required this.category});
  final String category;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: CategoryScreenController(category: category),
        builder: (controller) {
          final allProducts = controller.productsList;
          return Scaffold(
            body: !controller.fetchedData && controller.productsList.isEmpty
                ? const Indicator()
                : SafeArea(
                    child: Column(
                      children: [
                        30.verticalSpace,
                        Row(
                          children: [
                            10.horizontalSpace,
                            const CustomBackButton(),
                            5.verticalSpace,
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SearchField(onChanged: (val) {
                                controller.title.value = val;
                                controller.onChanged();
                              }),
                            )),
                          ],
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              15.verticalSpace,
                              const CategoryFilters(),
                              10.verticalSpace,
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Text(
                                  '${allProducts.length} Results found',
                                  style: AppDecoration.semiMediumStyle(
                                      fontSize: 18,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondary),
                                ),
                              ),
                              10.verticalSpace,
                              allProducts.isEmpty && controller.fetchedData
                                  ? const Center(child: EmptyCategories())
                                  : Expanded(
                                      child: GridView.builder(
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            childAspectRatio: 0.7,
                                          ),
                                          padding: EdgeInsets.zero,
                                          itemCount: allProducts.length,
                                          itemBuilder: (context, index) {
                                            final product = allProducts[index];
                                            return Padding(
                                              padding: const EdgeInsets.all(8),
                                              child: ItemContainer(
                                                width: 0.463.sw,
                                                product: product,
                                              ),
                                            );
                                          }),
                                    ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
          );
        });
  }
}
