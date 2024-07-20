import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../styles/app_colors.dart';

class TableHelpers {
  static List<DataRow> loadingRows(int length) {
    return List.generate(5, (index) {
      return DataRow2(
          specificRowHeight: 50,
          decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(color: AppColors.white)),
          cells: List.generate(length, (index) {
            return DataCell(Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.white,
                ),
              ),
            ));
          }));
    });
  }
}
