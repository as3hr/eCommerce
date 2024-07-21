import 'package:e_commerce/screens/order/components/order_detail/order_status/status_detail.dart';

import '../../../../helpers/styles/app_colors.dart';
import '../../../../helpers/styles/app_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderStatusList extends StatefulWidget {
  const OrderStatusList({super.key, required this.status});
  final String status;

  @override
  State<OrderStatusList> createState() => _OrderStatusListState();
}

class _OrderStatusListState extends State<OrderStatusList> {
  List<StatusDetail> statusList = [];

  @override
  void initState() {
    super.initState();
    statusList = StatusDetail.getStatus(widget.status);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        20.verticalSpace,
        Column(
          children: statusList.map((status) {
            return Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.check_circle,
                    color: status.isChecked
                        ? AppColors.lightPurple
                        : AppColors.grayIV,
                  ),
                  title: Text(status.title,
                      style: AppDecoration.mediumStyle(
                          fontSize: 18,
                          color: Theme.of(context).colorScheme.onSecondary)),
                  trailing: Text('28 May',
                      style: AppDecoration.mediumStyle(
                          fontSize: 15,
                          color: Theme.of(context).colorScheme.onSecondary)),
                ),
                8.verticalSpace,
              ],
            );
          }).toList(),
        ),
        20.verticalSpace,
      ],
    );
  }
}
