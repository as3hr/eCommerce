import 'package:collection/collection.dart';
import 'package:context_menus/context_menus.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:ecommerce_admin_panel/helpers/styles/app_colors.dart';
import 'package:ecommerce_admin_panel/helpers/styles/app_decoration.dart';
import 'package:ecommerce_admin_panel/helpers/widgets/listing_table/table_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    this.hidePagination = false,
    this.onSelectChanged,
    this.footer,
    this.fetchOnInit = false,
    this.selectActions,
    this.rowHeight,
    required this.totalPages,
    required this.count,
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
  final bool hidePagination;
  final double? rowHeight;
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
                dataRowHeight: widget.rowHeight ?? 50,
                showBottomBorder: true,
                showCheckboxColumn: false,
                border: listingTableBorder,
                headingRowHeight: 50,
                headingRowDecoration: headingRowDecoration,
                headingRowColor: headingRowColor,
                scrollController: _scrollController,
                columnSpacing: 23,
                headingTextStyle: largeTextStyle,
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
                    ? TableHelpers.loadingRows(widget.columns.length)
                    : widget.rows
                        .mapIndexed(
                          (index, row) => DataRow2(
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(
                                    color: Colors.grey.withOpacity(0.05))),
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
        if (!widget.hidePagination)
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Center(
                  child: Text(
                    'Row count:  ${widget.count}',
                    style: AppDecoration.semiMediumStyle(
                        fontSize: 18, color: AppColors.black),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Center(
                  child: Text(
                    '$currentPage of ${widget.totalPages}',
                    style: AppDecoration.semiMediumStyle(
                        fontSize: 15, color: AppColors.black),
                  ),
                ),
              ),
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
                  size: 20,
                ),
              ),
              8.horizontalSpace,
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
                  size: 20,
                ),
              ),
              20.horizontalSpace,
            ],
          ),
        10.verticalSpace,
      ],
    );
  }
}
