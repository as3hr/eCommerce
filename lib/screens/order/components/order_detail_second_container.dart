import 'package:collection/collection.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:ecommerce_admin_panel/models/order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../helpers/widgets/custom_table_design.dart';
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
                child: DataTable2(
                  dataRowHeight: 50,
                  showBottomBorder: true,
                  showCheckboxColumn: false,
                  border: listingTableBorder,
                  headingRowHeight: 50,
                  headingRowDecoration: headingRowDecoration,
                  headingRowColor: WidgetStateColor.resolveWith(
                    (states) => Colors.grey[100]!,
                  ),
                  columnSpacing: 23,
                  headingTextStyle: largeTextStyle,
                  decoration: listingTableDecoration,
                  onSelectAll: (selected) {},
                  empty: const Center(child: Text('No Items to Display')),
                  columns: const [
                    DataColumn2(
                      size: ColumnSize.M,
                      label: Center(
                        child: Text('Product ID'),
                      ),
                    ),
                    DataColumn2(
                      size: ColumnSize.M,
                      label: Center(
                        child: Text('Name'),
                      ),
                    ),
                    DataColumn2(
                      size: ColumnSize.M,
                      label: Center(
                        child: Text('Price'),
                      ),
                    ),
                    DataColumn2(
                      size: ColumnSize.M,
                      label: Center(
                        child: Text('Gender'),
                      ),
                    ),
                    DataColumn2(
                      size: ColumnSize.M,
                      label: Center(
                        child: Text('Category'),
                      ),
                    ),
                  ],
                  rows: order.products!.mapIndexed((index, product) {
                    return DataRow2(
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(
                                color: Colors.grey.withOpacity(0.05))),
                        onSelectChanged: (selected) {},
                        onTap: () {},
                        cells: [
                          DataCell(
                            Align(
                              alignment: Alignment.center,
                              child: Center(
                                child: Text(
                                    "${product.id?.substring(0, 6)}-${product.id?.substring(7, 12)}",
                                    style: TextStyle(
                                      fontFamily: 'SF Pro Display',
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: lightColorScheme.primary,
                                    )),
                              ),
                            ),
                          ),
                          DataCell(
                            Align(
                              alignment: Alignment.center,
                              child: Center(
                                child: Text("${product.title}",
                                    style: TextStyle(
                                      fontFamily: 'SF Pro Display',
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: lightColorScheme.primary,
                                    )),
                              ),
                            ),
                          ),
                          DataCell(
                            Align(
                              alignment: Alignment.center,
                              child: Center(
                                child: Text("\$${product.price}",
                                    style: TextStyle(
                                      fontFamily: 'SF Pro Display',
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: lightColorScheme.primary,
                                    )),
                              ),
                            ),
                          ),
                          DataCell(
                            Align(
                              alignment: Alignment.center,
                              child: Center(
                                child: Text("${product.gender}",
                                    style: TextStyle(
                                      fontFamily: 'SF Pro Display',
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: lightColorScheme.primary,
                                    )),
                              ),
                            ),
                          ),
                          DataCell(
                            Align(
                              alignment: Alignment.center,
                              child: Center(
                                child: Text("${product.category}",
                                    style: TextStyle(
                                      fontFamily: 'SF Pro Display',
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: lightColorScheme.primary,
                                    )),
                              ),
                            ),
                          ),
                        ]);
                  }).toList(),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
