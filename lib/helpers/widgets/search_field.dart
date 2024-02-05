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
        color: AppColors.grayI,
        borderRadius: BorderRadius.circular(30),
      ),
      height: 55,
      width: 0.9.sw,
      child: Row(
        children: [
          13.horizontalSpace,
          const Icon(Icons.search),
          5.horizontalSpace,
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: TextFormField(
                  cursorColor: AppColors.lightPurple,
                  onChanged: onChanged,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(0),
                    hintText: 'Search',
                    hintStyle: TextStyle(color: AppColors.grayIV),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.transparent,
                    )),
                    enabledBorder: OutlineInputBorder(
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
