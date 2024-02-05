import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderStatusList extends StatelessWidget {
  const OrderStatusList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        20.verticalSpace,
        const ListTile(
          leading: Icon(Icons.check_circle),
          title: Text('Delivered'),
          trailing: Text('28 May'),
        ),
        8.verticalSpace,
        const ListTile(
          leading: Icon(Icons.check_circle),
          title: Text('Shipped'),
          trailing: Text('28 May'),
        ),
        8.verticalSpace,
        const ListTile(
          leading: Icon(Icons.check_circle),
          title: Text('Order Confirmed'),
          trailing: Text('28 May'),
        ),
        8.verticalSpace,
        const ListTile(
          leading: Icon(Icons.check_circle),
          title: Text('Order Placed'),
          trailing: Text('28 May'),
        ),
        20.verticalSpace,
      ],
    );
  }
}
