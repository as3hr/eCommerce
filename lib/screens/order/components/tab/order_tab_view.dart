import 'package:e_commerce/helpers/functions/change_page.dart';
import 'package:e_commerce/screens/order/components/order_detail/order_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../helpers/styles/app_colors.dart';

class OrderTabView extends StatelessWidget {
  const OrderTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 60,
              width: 0.85.sw,
              decoration: BoxDecoration(
                color: AppColors.grayI,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: const Icon(Icons.bookmark_border_outlined),
                title: const Text('This is just for testing the UI'),
                subtitle: const Text('4 items'),
                trailing: GestureDetector(
                    onTap: () {
                      changePage(OrderDetail.routeName);
                    },
                    child: const Icon(Icons.arrow_forward_ios_rounded)),
              ),
            ),
          );
        });
  }
}
