import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_admin_panel/screens/home_screen/home_controller.dart';
import 'package:ecommerce_admin_panel/screens/product/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../helpers/functions/change_page.dart';
import '../../../helpers/styles/app_colors.dart';
import '../../../helpers/styles/app_decoration.dart';
import '../../../routes/route_name.dart';

class TopSelling extends StatelessWidget {
  const TopSelling({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Expanded(
        child: SizedBox(
          height: 0.5.sh,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text('Top Selling Products',
                    style: AppDecoration.boldStyle(
                        fontSize: 18, color: AppColors.black)),
              ),
              10.verticalSpace,
              controller.products.isEmpty
                  ? Center(
                      child: Text('Not Available!',
                          style: AppDecoration.boldStyle(
                              fontSize: 18, color: AppColors.black)))
                  : Expanded(
                      child: Card(
                        elevation: 10,
                        surfaceTintColor: AppColors.white,
                        color: AppColors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: ListView.builder(
                            itemCount: controller.products.length,
                            itemBuilder: (context, index) {
                              final product = controller.products[index];
                              return InkWell(
                                onTap: () {
                                  changePage(context, RouteName.productsScreen);
                                  Get.put(ProductController()).setProduct =
                                      product;
                                },
                                child: ListTile(
                                  leading: Container(
                                    width: 60,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: CachedNetworkImage(
                                        imageUrl: product.images.first),
                                  ),
                                  title: Text(product.title ?? '',
                                      style: AppDecoration.mediumStyle(
                                          fontSize: 15,
                                          color: AppColors.black)),
                                  subtitle: Text(
                                      product.description?.toLowerCase() ?? '',
                                      style: AppDecoration.mediumStyle(
                                          fontSize: 15,
                                          color: AppColors.black,
                                          overFlow: TextOverflow.ellipsis)),
                                  trailing: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Column(
                                        children: [
                                          5.verticalSpace,
                                          Text('${product.price}',
                                              style: AppDecoration.mediumStyle(
                                                fontSize: 12,
                                                color: AppColors.green,
                                              )),
                                          Text('in sales',
                                              style: AppDecoration.mediumStyle(
                                                fontSize: 12,
                                                color: AppColors.smokyBlack,
                                              ))
                                        ],
                                      ),
                                      25.horizontalSpace,
                                      Container(
                                        width: 30,
                                        height: 30,
                                        padding: const EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: AppColors.grayI,
                                        ),
                                        child: Center(
                                          child: Text('#${index + 1}',
                                              style: AppDecoration.mediumStyle(
                                                  fontSize: 15,
                                                  color: AppColors.black)),
                                        ),
                                      ),
                                      10.horizontalSpace,
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
            ],
          ),
        ),
      );
    });
  }
}
