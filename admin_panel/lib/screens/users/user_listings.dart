import 'package:collection/collection.dart';
import 'package:ecommerce_admin_panel/helpers/widgets/header/custom_header.dart';
import 'package:ecommerce_admin_panel/helpers/widgets/listing_table/listing_cell.dart';
import 'package:ecommerce_admin_panel/helpers/widgets/listing_table/listing_column.dart';
import 'package:ecommerce_admin_panel/helpers/widgets/listing_table/listing_row.dart';
import 'package:ecommerce_admin_panel/helpers/widgets/listing_table/listing_table.dart';
import 'package:ecommerce_admin_panel/routes/route_name.dart';
import 'package:ecommerce_admin_panel/screens/users/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helpers/functions/change_page.dart';
import '../../theme.dart';

class UserListing extends StatelessWidget {
  const UserListing({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: UserController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              children: [
                CustomHeader(
                  hideAddButton: true,
                  mainTitle: 'Users',
                  onPressed: () {
                    changePage(context, RouteName.userScreen);
                  },
                ),
                Expanded(
                    child: ListingTable(
                        searchHintText: 'Search by users name',
                        fetchOnInit: true,
                        searchKey: 'firstName',
                        count: controller.userPagination.count,
                        totalPages: controller.userPagination.totalPages,
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
                                child: Text(user.firstName ?? '-',
                                    style: TextStyle(
                                      fontFamily: 'SF Pro Display',
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: lightColorScheme.primary,
                                    )),
                              )),
                              ListingCell(
                                  child: Center(
                                child: Text(user.contactNumber ?? '-',
                                    style: TextStyle(
                                      fontFamily: 'SF Pro Display',
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: lightColorScheme.primary,
                                    )),
                              )),
                              ListingCell(
                                  child: Center(
                                child: Text(user.email ?? '-',
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
                      ListingColumn(title: const Text('Full Name')),
                      ListingColumn(title: const Text('Contact Number')),
                      ListingColumn(title: const Text('email')),
                    ])),
              ],
            ),
          );
        });
  }
}
