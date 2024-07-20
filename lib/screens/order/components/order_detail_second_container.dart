import 'package:collection/collection.dart';
import 'package:ecommerce_admin_panel/models/order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../helpers/widgets/custom_table_design.dart';
import '../../../helpers/widgets/listing_table/listing_cell.dart';
import '../../../helpers/widgets/listing_table/listing_column.dart';
import '../../../helpers/widgets/listing_table/listing_row.dart';
import '../../../helpers/widgets/listing_table/listing_table.dart';
import '../../../theme.dart';

class OrderDetailSecondContainer extends StatelessWidget {
  const OrderDetailSecondContainer({super.key, required this.order});
  final Order order;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 8, bottom: 8),
      child: SizedBox(
        width: 1.sw,
        child: CustomTableDesign(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 8),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              10.verticalSpace,
              Text('Order Items',
                  style: GoogleFonts.inter(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: lightColorScheme.onSecondary,
                  )),
              5.verticalSpace,
              SizedBox(
                  height: 0.3.sh,
                  child: ListingTable(
                      hidePagination: true,
                      count: 0,
                      totalPages: 0,
                      rows: order.products!.mapIndexed((index, product) {
                        return ListingRow(
                          onTap: null,
                          cells: [
                            ListingCell(
                                child: Center(
                              child: Text(
                                  "${product.id?.substring(0, 6)}-${product.id?.substring(7, 12)}",
                                  style: TextStyle(
                                    fontFamily: 'SF Pro Display',
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: lightColorScheme.primary,
                                  )),
                            )),
                            ListingCell(
                                child: Center(
                              child: Text("${product.title}",
                                  style: TextStyle(
                                    fontFamily: 'SF Pro Display',
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: lightColorScheme.primary,
                                  )),
                            )),
                            ListingCell(
                                child: Center(
                              child: Text("\$${product.price}",
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
                              child: Text(product.category ?? '-',
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
                        ListingColumn(title: const Text('Product ID')),
                        ListingColumn(title: const Text('Name')),
                        ListingColumn(title: const Text('Price')),
                        ListingColumn(title: const Text('Gender')),
                        ListingColumn(title: const Text('Category')),
                      ])),
            ]),
          ),
        ),
      ),
    );
  }
}
