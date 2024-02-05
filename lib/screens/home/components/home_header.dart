import 'package:flutter/material.dart';

import '../../../helpers/styles/app_colors.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 8),
          child: CircleAvatar(
            radius: 30,
            backgroundColor: AppColors.grayI,
          ),
        ),
        Text('Men'),
        Padding(
          padding: EdgeInsets.only(right: 25),
          child: Icon(Icons.shopping_bag),
        ),
      ],
    );
  }
}
