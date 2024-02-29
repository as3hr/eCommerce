import '../../../../../helpers/styles/app_colors.dart';
import '../../../../../helpers/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../helpers/functions/change_page.dart';
import '../../../../../helpers/widgets/item_container.dart';
import '../../../../../helpers/widgets/item_detail/item_detail_screen.dart';

class WishListCollectionScreen extends StatelessWidget {
  static const routeName = '/wishlist-collection';
  const WishListCollectionScreen({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pureWhite,
      body: SafeArea(
          child: Column(
        children: [
          35.verticalSpace,
          Header(text: title),
          35.verticalSpace,
          Expanded(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                  ),
                  padding: EdgeInsets.zero,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: ItemContainer(
                          isFav: true,
                          image: '',
                          width: 0.463.sw,
                          title: 'T shirt',
                          price: 3000,
                          onTap: () {
                            changePage(ItemDetailScreen.routeName);
                          }),
                    );
                  }))
        ],
      )),
    );
  }
}
