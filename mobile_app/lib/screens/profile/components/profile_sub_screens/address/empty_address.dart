import 'package:e_commerce/models/address.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../helpers/functions/change_page.dart';
import '../../../../../helpers/styles/app_colors.dart';
import '../../../../../helpers/styles/app_decoration.dart';
import '../../../../../helpers/widgets/custom_tile.dart';
import 'add_address_screen.dart';

class EmptyAddress extends StatelessWidget {
  const EmptyAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTile(
      width: 0.9.sw,
      title: Text(
        'Create a new Address',
        style: AppDecoration.semiBoldStyle(
            fontSize: 18, color: Theme.of(context).colorScheme.onSecondary),
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Text(
        'Add',
        style: AppDecoration.mediumStyle(
            fontSize: 17, color: AppColors.lightPurple),
      ),
      trailingOnTap: () {
        changePage(AddAddressScreen.routeName,
            arguments: {'address': Address()});
      },
    );
  }
}
