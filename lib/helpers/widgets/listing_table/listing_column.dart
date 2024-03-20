import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class ListingColumn {
  final Widget? title;
  final double? fixedWidth;
  final ColumnSize size;
  final String? sortKey;
  ListingColumn({
    this.sortKey,
    required this.title,
    this.fixedWidth,
    this.size = ColumnSize.M,
  });
}
