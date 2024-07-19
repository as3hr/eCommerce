import 'package:ecommerce_admin_panel/helpers/widgets/custom_elevated_button.dart';
import 'package:ecommerce_admin_panel/helpers/widgets/form/fields/drop_down_field.dart';
import 'package:ecommerce_admin_panel/routes/route_name.dart';
import 'package:ecommerce_admin_panel/screens/order/key_val_row.dart';
import 'package:ecommerce_admin_panel/screens/order/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../helpers/styles/app_colors.dart';
import '../../helpers/widgets/custom_table_design.dart';
import '../../helpers/widgets/header/custom_header.dart';
import '../../theme.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(builder: (controller) {
      final order = controller.getCurrentOrder;
      return Scaffold(
        backgroundColor: AppColors.white,
        body: Column(
          children: [
            CustomHeader(
              mainTitle:
                  '${order.id?.substring(0, 6).toUpperCase()}-${order.id?.substring(7, 12).toUpperCase()}',
              previousRoute: RouteName.ordersList,
              formTitle: 'Orders',
              onPressed: () {},
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 30, right: 30, top: 8, bottom: 8),
              child: SizedBox(
                width: 1.sw,
                child: CustomTableDesign(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, bottom: 8),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          10.verticalSpace,
                          Text('Basic Info',
                              style: GoogleFonts.inter(
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                                color: lightColorScheme.onSecondary,
                              )),
                          10.verticalSpace,
                          KeyValRow(
                              space: 45,
                              keyText: 'Customer',
                              value: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  5.verticalSpace,
                                  Text(order.user?.firstName ?? '',
                                      style: GoogleFonts.inter(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                        color: lightColorScheme.onSecondary,
                                      )),
                                  2.verticalSpace,
                                  Text(order.address?.streetAddress ?? '',
                                      style: GoogleFonts.inter(
                                        fontSize: 15,
                                        color: lightColorScheme.onSecondary,
                                      )),
                                  2.verticalSpace,
                                  Text(order.address?.city ?? '',
                                      style: GoogleFonts.inter(
                                        fontSize: 15,
                                        color: lightColorScheme.onSecondary,
                                      )),
                                  2.verticalSpace,
                                  Text(order.address?.country ?? '',
                                      style: GoogleFonts.inter(
                                        fontSize: 15,
                                        color: lightColorScheme.onSecondary,
                                      )),
                                ],
                              )),
                          10.verticalSpace,
                          KeyValRow(
                            space: 84,
                            keyText: 'ID',
                            value: Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(
                                  '${order.id?.substring(0, 6).toUpperCase()}-${order.id?.substring(7, 12).toUpperCase()}',
                                  style: GoogleFonts.inter(
                                    fontSize: 15,
                                    color: lightColorScheme.onSecondary,
                                  )),
                            ),
                          ),
                          10.verticalSpace,
                          KeyValRow(
                            space: 70,
                            keyText: 'Date',
                            value: Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text('${DateTime.now()}',
                                  style: GoogleFonts.inter(
                                    fontSize: 15,
                                    color: lightColorScheme.onSecondary,
                                  )),
                            ),
                          ),
                          10.verticalSpace,
                          KeyValRow(
                            space: 27,
                            keyText: 'Total Amount',
                            value: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text('\$${order.total}',
                                  style: GoogleFonts.inter(
                                    fontSize: 15,
                                    color: lightColorScheme.onSecondary,
                                  )),
                            ),
                          ),
                          10.verticalSpace,
                          KeyValRow(
                            space: 58,
                            keyText: 'Status',
                            value: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Row(
                                children: [
                                  DropDownField(
                                      title: 'Status',
                                      preFilledVal: order.status,
                                      onChanged: (val) {},
                                      dropdownItems: const [
                                        "pending",
                                        "shipped",
                                        "delivered",
                                        "returned",
                                        "cancelled",
                                      ]),
                                  10.horizontalSpace,
                                  CustomElevatedButton(
                                    onPressed: () {},
                                    text: 'Update',
                                    color: AppColors.skyBlue,
                                    textColor: AppColors.white,
                                    width: 70,
                                    height: 40,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ]),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 30, right: 30, top: 8, bottom: 8),
              child: SizedBox(
                width: 1.sw,
                child: CustomTableDesign(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, bottom: 8),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          10.verticalSpace,
                          Text('Order Items',
                              style: GoogleFonts.inter(
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                                color: lightColorScheme.onSecondary,
                              )),
                          5.verticalSpace,
                          CustomElevatedButton(
                            onPressed: () async {},
                            width: 120,
                            text: 'Delete Account',
                            textColor: Colors.red,
                            color: Colors.white,
                            borderColor: Colors.red,
                          ),
                          10.verticalSpace,
                          const Text('sas',
                              style: TextStyle(
                                fontFamily: 'SF Pro Display',
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.grey,
                              )),
                        ]),
                  ),
                ),
              ),
            ),
            10.verticalSpace,
            10.verticalSpace,
          ],
        ),
      );
    });
  }
}
