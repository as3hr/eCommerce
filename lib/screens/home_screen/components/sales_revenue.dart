import 'package:ecommerce_admin_panel/models/sales.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../helpers/styles/app_colors.dart';
import '../../../helpers/styles/app_decoration.dart';

class SalesRevenueGraph extends StatefulWidget {
  const SalesRevenueGraph({super.key});

  @override
  State<SalesRevenueGraph> createState() => _SalesRevenueGraphState();
}

class _SalesRevenueGraphState extends State<SalesRevenueGraph> {
  List<Sales> data = [
    Sales(month: 'Jan', sales: 20),
    Sales(month: 'Feb', sales: 30),
    Sales(month: 'March', sales: 40),
    Sales(month: 'April', sales: 50),
    Sales(month: 'May', sales: 60),
    Sales(month: 'June', sales: 20),
    Sales(month: 'July', sales: 90),
    Sales(month: 'August', sales: 100),
    Sales(month: 'September', sales: 80),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Sales Analytics',
            style:
                AppDecoration.boldStyle(fontSize: 18, color: AppColors.black)),
        10.verticalSpace,
        Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          surfaceTintColor: AppColors.white,
          color: AppColors.grayBackground,
          child: SizedBox(
            height: 0.4.sh,
            child: Column(
              children: [
                20.verticalSpace,
                Expanded(
                  child: SfCartesianChart(
                      primaryXAxis: const CategoryAxis(),
                      legend: const Legend(isVisible: true),
                      tooltipBehavior: TooltipBehavior(enable: true),
                      series: [
                        LineSeries<Sales, String>(
                            dataSource: data,
                            xValueMapper: (Sales sales, _) => sales.month,
                            yValueMapper: (Sales sales, _) => sales.sales,
                            name: 'Sales',
                            dataLabelSettings:
                                const DataLabelSettings(isVisible: true))
                      ]),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
