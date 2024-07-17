import 'package:collection/collection.dart';
import 'package:ecommerce_admin_panel/helpers/widgets/header/custom_header.dart';
import 'package:ecommerce_admin_panel/helpers/widgets/listing_table/listing_cell.dart';
import 'package:ecommerce_admin_panel/helpers/widgets/listing_table/listing_column.dart';
import 'package:ecommerce_admin_panel/helpers/widgets/listing_table/listing_row.dart';
import 'package:ecommerce_admin_panel/helpers/widgets/listing_table/listing_table.dart';
import 'package:ecommerce_admin_panel/models/product.dart';
import 'package:ecommerce_admin_panel/routes/route_name.dart';
import 'package:ecommerce_admin_panel/screens/product/product_controller.dart';
import 'package:flutter/material.dart';
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
                        count: controller.productPagination.count ?? 0,
                        totalPages:
                            controller.productPagination.totalPages ?? 0,
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
                                  child: Center(
                                child: Text(product.id ?? '-'),
                              )),
                              ListingCell(
                                  child: Center(
                                child: Text(product.title ?? '-'),
                              )),
                              ListingCell(
                                  child: Center(
                                child: Text("${product.price}"),
                              )),
                              ListingCell(
                                  child: Center(
                                child: Text(product.category ?? '-'),
                              )),
                              ListingCell(
                                  child: Center(
                                child: Text("${product.rating ?? '-'}"),
                              )),
                            ],
                          );
                        }).toList(),
                        columns: [
                      ListingColumn(title: const Text('Product Id')),
                      ListingColumn(title: const Text('Product Title')),
                      ListingColumn(title: const Text('Product Price')),
                      ListingColumn(title: const Text('Category')),
                      ListingColumn(title: const Text('Product Rating')),
                    ])),
              ],
            ),
          );
        });
  }
}
