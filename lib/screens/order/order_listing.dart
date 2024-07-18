import 'package:collection/collection.dart';
import 'package:ecommerce_admin_panel/helpers/widgets/header/custom_header.dart';
import 'package:ecommerce_admin_panel/helpers/widgets/listing_table/listing_cell.dart';
import 'package:ecommerce_admin_panel/helpers/widgets/listing_table/listing_column.dart';
import 'package:ecommerce_admin_panel/helpers/widgets/listing_table/listing_row.dart';
import 'package:ecommerce_admin_panel/helpers/widgets/listing_table/listing_table.dart';
import 'package:ecommerce_admin_panel/models/order.dart';
import 'package:ecommerce_admin_panel/routes/route_name.dart';
import 'package:ecommerce_admin_panel/screens/order/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helpers/functions/change_page.dart';
import '../../theme.dart';

class OrderListing extends StatelessWidget {
  const OrderListing({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: OrderController(),
        builder: (controller) {
          return Scaffold(
            body: Column(
              children: [
                CustomHeader(
                  mainTitle: 'Orders',
                  onPressed: () {
                    changePage(context, RouteName.orderScreen);
                    controller.setOrder = Order();
                  },
                ),
                Expanded(
                    child: ListingTable(
                        fetchOnInit: true,
                        count: controller.orderPagination.count,
                        totalPages: controller.orderPagination.totalPages,
                        fetchMoreData: ({
                          bool refresh = false,
                          Map<String, dynamic>? extraQuery,
                        }) async {
                          return controller.getAllOrders(
                            refresh: refresh,
                            extraQuery: extraQuery,
                          );
                        },
                        rows: controller.allOrders.mapIndexed((index, order) {
                          return ListingRow(
                            onTap: () {
                              changePage(context, RouteName.orderScreen);
                              controller.setOrder = order;
                            },
                            cells: [
                              ListingCell(
                                  child: Center(
                                child: Text(order.id?.substring(0, 9) ?? '-',
                                    style: TextStyle(
                                      fontFamily: 'SF Pro Display',
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: lightColorScheme.primary,
                                    )),
                              )),
                              ListingCell(
                                  child: Center(
                                child: Text('${order.products?.length}',
                                    style: TextStyle(
                                      fontFamily: 'SF Pro Display',
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: lightColorScheme.primary,
                                    )),
                              )),
                              ListingCell(
                                  child: Center(
                                child: Text('\$${order.total}',
                                    style: TextStyle(
                                      fontFamily: 'SF Pro Display',
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: lightColorScheme.primary,
                                    )),
                              )),
                              ListingCell(
                                  child: Center(
                                child: Text(order.address?.streetAddress ?? '-',
                                    style: TextStyle(
                                      fontFamily: 'SF Pro Display',
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      overflow: TextOverflow.ellipsis,
                                      color: lightColorScheme.primary,
                                    )),
                              )),
                            ],
                          );
                        }).toList(),
                        columns: [
                      ListingColumn(title: const Text('Order id')),
                      ListingColumn(title: const Text('Products')),
                      ListingColumn(title: const Text('Total Price')),
                      ListingColumn(title: const Text('Order Address')),
                    ])),
              ],
            ),
          );
        });
  }
}
