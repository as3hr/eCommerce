import 'package:e_commerce/helpers/functions/change_page.dart';
import 'package:e_commerce/screens/home/components/category/category_content.dart';

import '../../../../helpers/styles/app_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../helpers/widgets/back_button.dart';
import 'category_item.dart';

class InitialCategoryScreen extends StatelessWidget {
  const InitialCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          10.horizontalSpace,
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: CustomBackButton(),
          ),
          20.verticalSpace,
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'Shop By Categories',
              style: AppDecoration.boldStyle(
                  fontSize: 25,
                  color: Theme.of(context).colorScheme.onSecondary),
            ),
          ),
          10.verticalSpace,
          Expanded(
            child: ListView.builder(
                itemCount: CategoryItem.allCategories.length,
                itemBuilder: (context, index) {
                  final item = CategoryItem.allCategories[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        changePage(CategoryContent.routeName,
                            arguments: {'category': item.title});
                      },
                      child: Container(
                        width: 1.sw,
                        height: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                        child: Center(
                            child: ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: AssetImage(item.image),
                                  backgroundColor:
                                      Theme.of(context).colorScheme.onPrimary,
                                  radius: 30,
                                ),
                                title: Text(
                                  item.title,
                                  style: AppDecoration.mediumStyle(
                                      fontSize: 18,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondary),
                                ))),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
