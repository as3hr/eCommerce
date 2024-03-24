import 'package:collection/collection.dart';
import 'package:ecommerce_admin_panel/helpers/widgets/header/custom_header.dart';
import 'package:ecommerce_admin_panel/helpers/widgets/listing_table/listing_cell.dart';
import 'package:ecommerce_admin_panel/helpers/widgets/listing_table/listing_column.dart';
import 'package:ecommerce_admin_panel/helpers/widgets/listing_table/listing_row.dart';
import 'package:ecommerce_admin_panel/helpers/widgets/listing_table/listing_table.dart';
import 'package:ecommerce_admin_panel/models/user.dart';
import 'package:ecommerce_admin_panel/routes/route_name.dart';
import 'package:ecommerce_admin_panel/screens/user/user_controller.dart';
import 'package:ecommerce_admin_panel/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helpers/functions/change_page.dart';

class UserListing extends StatelessWidget {
  const UserListing({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: UserController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: lightColorScheme.onBackground,
            body: Column(
              children: [
                CustomHeader(
                  onPressed: () {
                    changePage(context, RouteName.userScreen);
                    controller.setUser = User();
                  },
                ),
                Expanded(
                    child: ListingTable(
                        fetchOnInit: true,
                        fetchMoreData: ({
                          bool refresh = false,
                          Map<String, dynamic>? extraQuery,
                        }) async {
                          return controller.getAllUsers(
                            refresh: refresh,
                            extraQuery: extraQuery,
                          );
                        },
                        rows: controller.allUsers.mapIndexed((index, user) {
                          return ListingRow(
                            onTap: () async {
                              changePage(
                                context,
                                RouteName.userScreen,
                              );
                              controller.setUser = user;
                            },
                            cells: [
                              ListingCell(
                                  child: Center(
                                child: Text(user.firstName ?? '-'),
                              )),
                              ListingCell(
                                  child: Center(
                                child: Text(user.lastName ?? '-'),
                              )),
                              ListingCell(
                                  child: Center(
                                child: Text(user.contactNumber ?? '-'),
                              )),
                              ListingCell(
                                  child: Center(
                                child: Text(user.userName ?? '-'),
                              )),
                              ListingCell(
                                  child: Center(
                                child: Text(user.email ?? '-'),
                              )),
                              ListingCell(
                                  child: Center(
                                child: Text("${user.addresses?.length}"),
                              )),
                            ],
                          );
                        }).toList(),
                        columns: [
                      ListingColumn(title: const Text('First Name')),
                      ListingColumn(title: const Text('Last Name')),
                      ListingColumn(title: const Text('Contact Number')),
                      ListingColumn(title: const Text('Username')),
                      ListingColumn(title: const Text('email')),
                      ListingColumn(title: const Text('Addresses')),
                    ])),
              ],
            ),
          );
        });
  }
}
