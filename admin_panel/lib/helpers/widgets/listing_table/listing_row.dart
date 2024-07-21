import 'package:flutter/material.dart';

import 'listing_cell.dart';

class ListingRow {
  List<ListingCell> cells;
  final Widget? contextMenu;
  final GestureTapCallback? onTap;
  ListingRow({
    required this.cells,
    this.onTap,
    this.contextMenu,
  });
}
