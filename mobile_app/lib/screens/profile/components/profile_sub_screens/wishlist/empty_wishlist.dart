import '../../../../../helpers/styles/app_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyWishList extends StatelessWidget {
  const EmptyWishList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        250.verticalSpace,
        Center(
            child: Icon(
          Icons.heart_broken_sharp,
          color: Theme.of(context).colorScheme.error,
          size: 40,
        )),
        5.verticalSpace,
        Text(
          "NO ITEMS TO SHOW :(",
          style: AppDecoration.semiBoldStyle(
              fontSize: 25, color: Theme.of(context).colorScheme.onSecondary),
        ),
      ],
    );
  }
}
