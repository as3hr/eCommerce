import 'package:e_commerce/helpers/functions/loader.dart';
import 'package:e_commerce/screens/home/components/category/empty_categories.dart';
import 'package:e_commerce/screens/home/home_screen_controller.dart';
import 'package:get/get.dart';

import '../../../../helpers/functions/bottom_sheet.dart';
import '../../../../helpers/styles/app_colors.dart';
import '../../../../helpers/styles/app_decoration.dart';
import '../../../../helpers/widgets/back_button.dart';
import '../../../../helpers/widgets/bottom_sheet/bottom_sheet_container.dart';
import '../../../../helpers/widgets/custom_bottom_sheet_body.dart';
import '../../../../helpers/widgets/custom_container.dart';
import '../../../../helpers/widgets/item_container.dart';
import '../../../../helpers/widgets/modal_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../helpers/widgets/search_field.dart';
import '../../../../models/product.dart';

class CategoryContent extends StatefulWidget {
  static const routeName = '/category-content';
  const CategoryContent({super.key, required this.category});
  final String category;

  @override
  State<CategoryContent> createState() => _CategoryContentState();
}

class _CategoryContentState extends State<CategoryContent> {
  Map<String, dynamic> query = {};
  final controller = Get.find<HomeScreenController>();
  List<Product> products = [];
  bool fetchedData = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    fetchedData = false;
    query['category'] = widget.category;
    await loadingWrapper(() async {
      await controller.getProducts(
        query: query,
        byCategory: true,
        refresh: true,
      );
    });
    if (controller.productsByCategory.isNotEmpty) {
      products = controller.productsByCategory;
    }
    fetchedData = true;
    controller.update();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(builder: (controller) {
      return Scaffold(
        body: !fetchedData && products.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
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
                          child:
                              SearchField(onChanged: controller.searchProducts),
                        )),
                      ],
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          15.verticalSpace,
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CustomContainer(
                                      onTap: () {},
                                      text: 'On Sale',
                                      color: AppColors.grayI,
                                      textColor: AppColors.pureBlack,
                                      height: 35,
                                      width: 0.19.sw,
                                      fontSize: 15.5,
                                    )),
                                ModalDropDown(
                                  text: query['price'] ?? 'Price',
                                  textColor: AppColors.pureWhite,
                                  color: AppColors.lightPurple,
                                  onTap: () {
                                    viewBottomSheet(
                                      context,
                                      'Price',
                                      CustomBottomSheetBody(
                                          onTapped: (val) async {
                                            // query['price'] = val;
                                            loadingWrapper(() async {
                                              await getData();
                                            });
                                          },
                                          containers: const [
                                            BottomSheetContainer(
                                                title: 'Lowset-Highest Price',
                                                index: 0),
                                            BottomSheetContainer(
                                                title: 'Highest-Lowest Price',
                                                index: 1),
                                          ]),
                                      () {
                                        query.remove('price');
                                        loadingWrapper(() async {
                                          await getData();
                                        });
                                      },
                                    );
                                  },
                                ),
                                ModalDropDown(
                                  text: query['sort'] ?? 'Sort By',
                                  onTap: () {
                                    viewBottomSheet(
                                      context,
                                      'Sort By',
                                      CustomBottomSheetBody(
                                          onTapped: (val) async {
                                            query['sort'] = val;
                                            loadingWrapper(() async {
                                              await getData();
                                            });
                                          },
                                          containers: const [
                                            BottomSheetContainer(
                                                title: 'Recommended', index: 0),
                                            BottomSheetContainer(
                                                title: 'Newest', index: 1),
                                          ]),
                                      () {
                                        query.remove('sort');
                                        loadingWrapper(() async {
                                          await getData();
                                        });
                                      },
                                    );
                                  },
                                ),
                                ModalDropDown(
                                  text: query['gender'] ?? 'Men',
                                  textColor: AppColors.pureWhite,
                                  color: AppColors.lightPurple,
                                  onTap: () {
                                    viewBottomSheet(
                                      context,
                                      'Gender',
                                      CustomBottomSheetBody(
                                          onTapped: (val) async {
                                            query['gender'] = val;
                                            loadingWrapper(() async {
                                              await getData();
                                            });
                                          },
                                          containers: const [
                                            BottomSheetContainer(
                                                title: 'Men', index: 0),
                                            BottomSheetContainer(
                                                title: 'Women', index: 1),
                                            BottomSheetContainer(
                                                title: 'Kids', index: 2),
                                          ]),
                                      () {
                                        query.remove('gender');
                                        loadingWrapper(() async {
                                          await getData();
                                        });
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          10.verticalSpace,
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              '${products.length} Results found',
                              style: AppDecoration.semiMediumStyle(
                                  fontSize: 18, color: AppColors.lightBlack),
                            ),
                          ),
                          10.verticalSpace,
                          products.isEmpty && fetchedData
                              ? const Center(child: EmptyCategories())
                              : Expanded(
                                  child: GridView.builder(
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 0.7,
                                      ),
                                      padding: EdgeInsets.zero,
                                      itemCount: products.length,
                                      itemBuilder: (context, index) {
                                        final product = products[index];
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
