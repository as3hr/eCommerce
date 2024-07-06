import 'package:collection/collection.dart';
import 'package:context_menus/context_menus.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme.dart';
import '../../functions/loading_wrapper.dart';
import '../color_changing_container.dart';
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
  final ScrollController _scrollController = ScrollController();
  List<int> selectedIndexes = [];
  bool _isLoading = false;
  bool _loadFinished = false;
  String? sortKey;
  bool sortAscending = true;
  bool secondaryTap = false;
  @override
  void initState() {
    super.initState();
    if (widget.fetchMoreData != null) {
      _scrollController.addListener(onScrollCallback);
      if (widget.fetchOnInit) {
        loadingWrapper(
          () => fetchData(
            refresh: true,
          ),
          context,
        );
      }
    }
  }

  Future<void> onScrollCallback({bool refresh = false}) async {
    if (_scrollController.hasClients &&
        _scrollController.position.extentAfter <= 1000.0 &&
        !_isLoading &&
        !_loadFinished) {
      fetchData(refresh: refresh);
    }
  }

  Future<void> fetchData({bool refresh = false}) async {
    setState(() {
      _isLoading = true;
    });
    _loadFinished = await widget.fetchMoreData!(
      refresh: refresh,
      extraQuery: {
        if (sortKey != null) 'sort[$sortKey]': sortAscending ? -1 : 1,
      },
    );
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(onScrollCallback);
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
                checkboxHorizontalMargin: 10,
                dataRowHeight: 30,
                checkboxAlignment: Alignment.centerLeft,
                showBottomBorder: true,
                border: listingTableBorder,
                smRatio: 0.5,
                lmRatio: 1.5,
                headingCheckboxTheme: checkBoxTheme,
                headingRowHeight: 40,
                headingRowDecoration: headingRowDecoration,
                headingRowColor: headingRowColor,
                datarowCheckboxTheme: checkBoxTheme,
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
                                loadingWrapper(
                                    () => fetchData(refresh: true), context);
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
                rows: widget.rows
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
        if (_isLoading)
          SizedBox(
            height: 40,
            child: ColorChangingContainer(
              color1: Theme.of(context).colorScheme.onSecondary,
              color2: Theme.of(context).colorScheme.surface,
              child: const Center(
                child: Text('Loading data...'),
              ),
            ),
          ),
        if (widget.footer != null)
          Container(
            color: Colors.orange,
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: List.generate(widget.footer!.cells.length, (i) {
                final child = Container(
                  padding: EdgeInsets.only(
                    left: i > 0 ? 12 : 0,
                    right: (i < widget.footer!.cells.length - 1) ? 12.0 : 0,
                  ),
                  alignment: widget.footer!.cells[i].alignment,
                  child: widget.footer!.cells[i].child,
                );
                if (widget.columns[i].fixedWidth != null) {
                  return SizedBox(
                    width: widget.columns[i].fixedWidth,
                    child: child,
                  );
                } else {
                  final int flex;
                  switch (widget.columns[i].size) {
                    case ColumnSize.S:
                      flex = 1;
                      break;
                    case ColumnSize.L:
                      flex = 3;
                      break;
                    case ColumnSize.M:
                    default:
                      flex = 2;
                      break;
                  }
                  return Expanded(flex: flex, child: child);
                }
              }),
            ),
          ),
      ],
    );
  }
}
