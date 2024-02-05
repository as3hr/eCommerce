import 'package:e_commerce/helpers/widgets/item_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemsList extends StatelessWidget {
  const ItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      width: 1.sw,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: ((context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ItemContainer(
                  onTap: () {}, image: '', title: 'Mens t shirt', price: 1200),
            );
          })),
    );
  }
}
