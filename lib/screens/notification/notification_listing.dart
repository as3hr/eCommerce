import 'package:collection/collection.dart';
import 'package:ecommerce_admin_panel/helpers/widgets/header/custom_header.dart';
import 'package:ecommerce_admin_panel/helpers/widgets/listing_table/listing_cell.dart';
import 'package:ecommerce_admin_panel/helpers/widgets/listing_table/listing_column.dart';
import 'package:ecommerce_admin_panel/helpers/widgets/listing_table/listing_row.dart';
import 'package:ecommerce_admin_panel/helpers/widgets/listing_table/listing_table.dart';
import 'package:ecommerce_admin_panel/routes/route_name.dart';
import 'package:ecommerce_admin_panel/screens/notification/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helpers/functions/change_page.dart';

class NotificationListing extends StatelessWidget {
  const NotificationListing({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: NotificationController(),
        builder: (controller) {
          return Scaffold(
            body: Column(
              children: [
                CustomHeader(
                  mainTitle: 'Notifications',
                  onPressed: () {
                    changePage(context, RouteName.notificationsScreen);
                  },
                ),
                Expanded(
                    child: ListingTable(
                        rows: controller.allNotifications
                            .mapIndexed((index, notification) {
                          return ListingRow(
                            cells: [
                              ListingCell(
                                  child: Center(
                                child: Text("${notification.id}"),
                              )),
                              ListingCell(
                                  child: Center(
                                child: Text("${notification.title}"),
                              )),
                              ListingCell(
                                  child: Center(
                                child: Text("${notification.description}"),
                              )),
                              ListingCell(
                                  child: Center(
                                child: Text("${notification.date}"),
                              )),
                            ],
                          );
                        }).toList(),
                        columns: [
                      ListingColumn(title: const Text('NotificationId')),
                      ListingColumn(title: const Text('Notification Title')),
                      ListingColumn(title: const Text('Description')),
                      ListingColumn(title: const Text('Notification Date')),
                    ])),
              ],
            ),
          );
        });
  }
}
