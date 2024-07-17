import 'package:collection/collection.dart';
import 'package:context_menus/context_menus.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:ecommerce_admin_panel/helpers/styles/app_colors.dart';
import 'package:ecommerce_admin_panel/helpers/styles/app_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../theme.dart';
import '../custom_table_design.dart';
import 'listing_cell.dart';
import 'listing_column.dart';
import 'listing_row.dart';
import 'listing_select_button.dart';

class ListingTable extends StatefulWidget {
  ListingTable({
    super.key,
    required this.rows,
    required this.columns,
    this.fetchMoreData,
    this.onSelectChanged,
    this.footer,
    this.fetchOnInit = false,
    this.selectActions,
    this.totalPages = 0,
    this.count = 0,
  }) {
    if (footer != null) {
      if (footer!.cells.length < columns.length) {
        footer!.cells.addAll(
          List.generate(
            columns.length - footer!.cells.length,
            (index) => ListingCell(child: const SizedBox()),
          ),
        );
      }
    }
  }
  final int totalPages;
  final int count;
  final List<ListingRow> rows;
  final List<ListingColumn> columns;
  final ListingRow? footer;
  final List<ListingSelectButton>? selectActions;
  final void Function(List<int> selectedIndexes)? onSelectChanged;
  final bool fetchOnInit;
  final Future<bool> Function({bool refresh, Map<String, dynamic>? extraQuery})?
      fetchMoreData;

  @override
  State<ListingTable> createState() => _ListingTableState();
}

class _ListingTableState extends State<ListingTable> {
  int currentPage = 1;
  final ScrollController _scrollController = ScrollController();
  List<int> selectedIndexes = [];
  bool _isLoading = false;
  String? sortKey;
  bool sortAscending = true;
  bool secondaryTap = false;
  @override
  void initState() {
    super.initState();
    intializeTable();
  }

  Future<void> intializeTable() async {
    if (widget.fetchMoreData != null) {
      if (widget.fetchOnInit) {
        setState(() {
          _isLoading = true;
        });
        await fetchData(
          refresh: true,
        );
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> fetchData({bool refresh = false}) async {
    setState(() {
      _isLoading = true;
    });
    await widget.fetchMoreData!(
      refresh: refresh,
      extraQuery: {
        if (sortKey != null) 'sort[$sortKey]': sortAscending ? -1 : 1,
        'page': currentPage,
        'limit': 25,
      },
    );
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (selectedIndexes.isNotEmpty)
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: widget.selectActions
                    ?.map(
                      (selectAction) => Container(
                        margin: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(4.0),
                        child: InkWell(
                          onTap: () =>
                              selectAction.action?.call(selectedIndexes),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (selectAction.icon != null) selectAction.icon!,
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  selectAction.label ?? '',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 5.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList() ??
                [],
          ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTableDesign(
              child: DataTable2(
                dataRowHeight: 30,
                showBottomBorder: true,
                showCheckboxColumn: false,
                border: listingTableBorder,
                smRatio: 0.5,
                lmRatio: 1.5,
                headingRowHeight: 40,
                headingRowDecoration: headingRowDecoration,
                headingRowColor: headingRowColor,
                scrollController: _scrollController,
                columnSpacing: 23,
                headingTextStyle: mediumTextStyle,
                decoration: listingTableDecoration,
                onSelectAll: (selected) {
                  setState(() {
                    if (selected ?? false) {
                      selectedIndexes = List.generate(
                        widget.rows.length,
                        (index) => index,
                      );
                    } else {
                      selectedIndexes.clear();
                    }
                    widget.onSelectChanged?.call(selectedIndexes);
                  });
                },
                empty: const Center(child: Text('No Items to Display')),
                columns: widget.columns
                    .map(
                      (column) => DataColumn2(
                        fixedWidth: column.fixedWidth,
                        size: column.size,
                        label: Center(
                          child: column.title,
                        ),
                        onSort: column.sortKey != null
                            ? (columnIndex, ascending) {
                                setState(() {
                                  sortKey = column.sortKey;
                                  sortAscending = ascending;
                                });
                                fetchData(refresh: true);
                              }
                            : null,
                      ),
                    )
                    .toList(),
                sortColumnIndex: sortKey == null
                    ? null
                    : widget.columns.indexWhere(
                        (element) => element.sortKey == sortKey,
                      ),
                sortAscending: sortAscending,
                rows: _isLoading
                    ? loadingRows()
                    : widget.rows
                        .mapIndexed(
                          (index, row) => DataRow2(
                            color: listingRowColor(
                              index,
                            ),
                            onSelectChanged: (selected) {
                              setState(() {
                                if (!(selected ?? false)) {
                                  selectedIndexes.remove(index);
                                }
                                if (!selectedIndexes.contains(index) &&
                                    (selected ?? false)) {
                                  selectedIndexes.add(index);
                                }
                                widget.onSelectChanged?.call(selectedIndexes);
                              });
                            },
                            selected: selectedIndexes.contains(index),
                            onTap: row.onTap,
                            onSecondaryTap: (row.contextMenu == null)
                                ? null
                                : () {
                                    setState(() {
                                      secondaryTap = true;
                                    });
                                    context.contextMenuOverlay
                                        .show(row.contextMenu!);
                                  },
                            cells: row.cells
                                .map(
                                  (cell) => DataCell(
                                    Align(
                                      alignment: cell.alignment,
                                      child: cell.child,
                                    ),
                                    showEditIcon: cell.showEditIcon,
                                  ),
                                )
                                .toList(),
                          ),
                        )
                        .toList(),
              ),
            ),
          ),
        ),
        10.verticalSpace,
        Row(children: [
          const Spacer(),
          Center(
            child: Text(
              'Rows per page:  ${widget.count}',
              style: AppDecoration.semiMediumStyle(
                  fontSize: 18, color: AppColors.black),
            ),
          ),
          10.horizontalSpace,
          Center(
            child: Text(
              '$currentPage of ${widget.totalPages}',
              style: AppDecoration.semiMediumStyle(
                  fontSize: 15, color: AppColors.black),
            ),
          ),
          10.horizontalSpace,
          InkWell(
            onTap: currentPage > 1
                ? () {
                    currentPage--;
                    fetchData(refresh: true);
                  }
                : null,
            child: Icon(
              Icons.arrow_back_ios,
              color: currentPage > 1 ? AppColors.black : Colors.grey,
              size: 15,
            ),
          ),
          4.horizontalSpace,
          InkWell(
            onTap: currentPage < widget.totalPages
                ? () {
                    currentPage++;
                    fetchData(refresh: true);
                  }
                : null,
            child: Icon(
              Icons.arrow_forward_ios_rounded,
              color: currentPage < widget.totalPages
                  ? AppColors.black
                  : Colors.grey,
              size: 15,
            ),
          ),
          30.horizontalSpace,
        ]),
        10.verticalSpace,
      ],
    );
  }

  List<DataRow> loadingRows() {
    return List.generate(5, (index) {
      return DataRow2(
          specificRowHeight: 50,
          decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(color: AppColors.white)),
          cells: List.generate(widget.columns.length, (index) {
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
