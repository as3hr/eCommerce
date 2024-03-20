import 'package:ecommerce_admin_panel/helpers/widgets/header/custom_header.dart';
import 'package:ecommerce_admin_panel/helpers/widgets/listing_table/listing_cell.dart';
import 'package:ecommerce_admin_panel/helpers/widgets/listing_table/listing_column.dart';
import 'package:ecommerce_admin_panel/helpers/widgets/listing_table/listing_row.dart';
import 'package:ecommerce_admin_panel/helpers/widgets/listing_table/listing_table.dart';
import 'package:ecommerce_admin_panel/routes/route_name.dart';
import 'package:ecommerce_admin_panel/theme.dart';
import 'package:flutter/material.dart';

import '../../helpers/functions/change_page.dart';

class CredentialListing extends StatelessWidget {
  static const routeName = '/credentiallist';
  const CredentialListing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightColorScheme.onBackground,
      body: Column(
        children: [
          CustomHeader(
            onPressed: () {
              changePage(context, RouteName.orderScreen);
            },
          ),
          Expanded(
              child: ListingTable(rows: [
            ListingRow(
              onTap: () {
                changePage(context, RouteName.orderScreen);
              },
              cells: [
                ListingCell(
                    child: const Center(
                  child: Text("Text 1"),
                )),
                ListingCell(
                    child: const Center(
                  child: Text("Text 2"),
                )),
                ListingCell(
                    child: const Center(
                  child: Text("Text 3"),
                )),
                ListingCell(
                    child: const Center(
                  child: Text("Text 4"),
                )),
                ListingCell(
                    child: const Center(
                  child: Text("Text 5"),
                )),
                ListingCell(
                    child: const Center(
                  child: Text("Text 6"),
                )),
              ],
            ),
          ], columns: [
            ListingColumn(title: const Text('Column 1')),
            ListingColumn(title: const Text('Column 2')),
            ListingColumn(title: const Text('Column 3')),
            ListingColumn(title: const Text('Column 4')),
            ListingColumn(title: const Text('Column 5')),
            ListingColumn(title: const Text('Column 6')),
          ])),
        ],
      ),
    );
  }
}
