import 'package:collection/collection.dart';
import 'package:context_menus/context_menus.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:ecommerce_admin_panel/helpers/styles/app_colors.dart';
import 'package:ecommerce_admin_panel/helpers/styles/app_decoration.dart';
import 'package:ecommerce_admin_panel/helpers/widgets/listing_table/table_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
    this.searchHintText,
    this.hideSearchField = false,
    this.hidePagination = false,
    this.onSelectChanged,
    this.footer,
    this.fetchOnInit = false,
    this.selectActions,
    this.searchKey,
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
  final String? searchKey;
  final List<ListingRow> rows;
  final List<ListingColumn> columns;
  final ListingRow? footer;
  final List<ListingSelectButton>? selectActions;
  final void Function(List<int> selectedIndexes)? onSelectChanged;
  final bool hideSearchField;
  final bool fetchOnInit;
  final String? searchHintText;
  final Future<bool> Function({bool refresh, Map<String, dynamic>? extraQuery})?
      fetchMoreData;

  @override
  State<ListingTable> createState() => _ListingTableState();
}

class _ListingTableState extends State<ListingTable> {
  int currentPage = 1;
  Rx<String> searchVal = ''.obs;
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
        if (widget.searchKey != null && searchVal.value.isNotEmpty)
          widget.searchKey.toString(): searchVal,
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
        if (!widget.hideSearchField) ...[
          10.verticalSpace,
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0, left: 12),
              child: Container(
                width: 0.6.sw,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Row(
                  children: [
                    const Icon(Icons.search_rounded, color: Colors.grey),
                    10.horizontalSpace,
                    SizedBox(
                      height: 35,
                      width: 0.5.sw,
                      child: TextFormField(
                        scrollPadding: const EdgeInsets.all(0),
                        style: Theme.of(context).textTheme.bodyMedium,
                        onChanged: (val) {
                          searchVal.value = val;
                          debounce(searchVal, (_) {
                            currentPage = 1;
                            fetchData(refresh: true);
                          }, time: const Duration(milliseconds: 1200));
                        },
                        decoration: fieldDecoration(
                          hintText: widget.searchHintText,
                        ),
                      ),
                    ),
                    5.verticalSpace,
                  ],
                ),
              ),
            ),
          )
        ],
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
                    widget.totalPages == 0
                        ? '0 of 0'
                        : '$currentPage of ${widget.totalPages}',
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
