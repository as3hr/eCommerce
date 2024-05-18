import '../styles/app_decoration.dart';
import '../styles/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/app_colors.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key, required this.onChanged});
  final Function(String) onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(30),
      ),
      height: 45,
      width: 0.9.sw,
      child: Row(
        children: [
          13.horizontalSpace,
          Image(
            image: const AssetImage(AppImages.search),
            color: Theme.of(context).colorScheme.onSecondary,
          ),
          10.horizontalSpace,
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: TextFormField(
                  cursorColor: AppColors.lightPurple,
                  onChanged: onChanged,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(0),
                    hintText: 'Search',
                    hintStyle: AppDecoration.mediumStyle(
                        fontSize: 16.sp,
                        color: Theme.of(context).colorScheme.onSecondary),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.transparent,
                    )),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.transparent,
                    )),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
