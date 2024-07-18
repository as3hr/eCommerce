import 'package:collection/collection.dart';
import 'package:ecommerce_admin_panel/helpers/widgets/header/custom_header.dart';
import 'package:ecommerce_admin_panel/helpers/widgets/listing_table/listing_cell.dart';
import 'package:ecommerce_admin_panel/helpers/widgets/listing_table/listing_column.dart';
import 'package:ecommerce_admin_panel/helpers/widgets/listing_table/listing_row.dart';
import 'package:ecommerce_admin_panel/helpers/widgets/listing_table/listing_table.dart';
import 'package:ecommerce_admin_panel/helpers/widgets/shimmer_image.dart';
import 'package:ecommerce_admin_panel/models/product.dart';
import 'package:ecommerce_admin_panel/routes/route_name.dart';
import 'package:ecommerce_admin_panel/screens/product/product_controller.dart';
import 'package:ecommerce_admin_panel/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../helpers/functions/change_page.dart';

class ProductListing extends StatelessWidget {
  const ProductListing({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ProductController(),
        builder: (controller) {
          return Scaffold(
            body: Column(
              children: [
                CustomHeader(
                  mainTitle: 'Products',
                  onPressed: () {
                    changePage(context, RouteName.productsScreen);
                    controller.setProduct = Product();
                  },
                ),
                Expanded(
                    child: ListingTable(
                        fetchOnInit: true,
                        rowHeight: 150,
                        count: controller.productPagination.count,
                        totalPages: controller.productPagination.totalPages,
                        fetchMoreData: ({
                          bool refresh = false,
                          Map<String, dynamic>? extraQuery,
                        }) async {
                          return controller.getAllProducts(
                            refresh: refresh,
                            extraQuery: extraQuery,
                          );
                        },
                        rows:
                            controller.allProducts.mapIndexed((index, product) {
                          return ListingRow(
                            onTap: () {
                              changePage(context, RouteName.productsScreen);
                              controller.setProduct = product;
                            },
                            cells: [
                              ListingCell(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: ShimmerImage(
                                            errorIcon: Icons.image_outlined,
                                            imageUrl: product.images.isNotEmpty
                                                ? product.images.first
                                                : ''),
                                      ),
                                    ),
                                    5.horizontalSpace,
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${product.title}",
                                            style: mediumTextStyle,
                                          ),
                                          2.verticalSpace,
                                          Text(
                                            "in ${product.category}",
                                            style: smallTextStyle,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              ListingCell(
                                  child: Center(
                                child: Text("${product.price}",
                                    style: TextStyle(
                                      fontFamily: 'SF Pro Display',
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: lightColorScheme.primary,
                                    )),
                              )),
                              ListingCell(
                                  child: Center(
                                child: Text(product.gender ?? '-',
                                    style: TextStyle(
                                      fontFamily: 'SF Pro Display',
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: lightColorScheme.primary,
                                    )),
                              )),
                              ListingCell(
                                  child: Center(
                                child: Text("${product.rating ?? '-'}",
                                    style: TextStyle(
                                      fontFamily: 'SF Pro Display',
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: lightColorScheme.primary,
                                    )),
                              )),
                            ],
                          );
                        }).toList(),
                        columns: [
                      ListingColumn(title: const Text('Name')),
                      ListingColumn(title: const Text('Price')),
                      ListingColumn(title: const Text('Gender')),
                      ListingColumn(title: const Text('Rating')),
                    ])),
              ],
            ),
          );
        });
  }
}
