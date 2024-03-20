// import '../../side_bar/tab_screen.dart';
// import '../../tabbar/tab_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../../../../theme.dart';

class BaseSuggestionField<T> extends StatefulWidget {
  const BaseSuggestionField({
    Key? key,
    this.title,
    this.onChanged,
    this.onSelected,
    this.itemBuilder,
    this.hintText,
    this.prefixText,
    this.controller,
    this.preFilledValue,
    this.isNum = false,
    this.isRequired = false,
    this.updateText = true,
    this.hideSuffixIcon = false,
    this.fieldWidth,
    this.readOnly = false,
    this.width,
  }) : super(key: key);
  final bool readOnly;
  final bool hideSuffixIcon;
  final String? title;
  final Future<List<T>> Function(String)? onChanged;
  final Function(T)? onSelected;
  final Widget Function(BuildContext, T)? itemBuilder;
  final TextEditingController? controller;
  final String? hintText;
  final String? prefixText;
  final T? preFilledValue;
  final bool isNum;
  final bool isRequired;
  final bool updateText;
  final double? fieldWidth;
  final double? width;

  @override
  State<BaseSuggestionField<T>> createState() => _BaseSuggestionFieldState<T>();
}

class _BaseSuggestionFieldState<T> extends State<BaseSuggestionField<T>> {
  late final TextEditingController controller;
  T? selectedItem;
  @override
  void initState() {
    super.initState();
    controller = widget.controller ?? TextEditingController();
    if (widget.preFilledValue != null) {
      selectedItem = widget.preFilledValue;
      controller.text = widget.preFilledValue?.toString() ?? '';
    }
  }

  List<dynamic> newSuggestions = [];
  // final tabController = Get.find<TabBarController>();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 60,
          width: widget.width,
          child: IgnorePointer(
            ignoring: widget.readOnly,
            child: Center(
              child: TypeAheadFormField(
                textFieldConfiguration: TextFieldConfiguration(
                  style: Theme.of(context).textTheme.bodyMedium,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 2, color: Colors.blue),
                      borderRadius: BorderRadius.circular(2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 0.75),
                      borderRadius: BorderRadius.circular(2),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    label: Text(
                      widget.title.toString(),
                    ),
                    suffixIcon: !widget.hideSuffixIcon
                        ? InkWell(
                            onTap: () {
                              // final screen =
                              //     FormHelpers.onLabelTap(widget.onChanged);
                              // tabController.pushTab(
                              //   TabScreen(
                              //     title: screen[0],
                              //     routeName: screen[1],
                              //   ),
                              //   destinationScreenRouteName: screen[2],
                              // );
                              // tabController.update();
                            },
                            child: const Icon(
                              Icons.add,
                              size: 18,
                              color: Colors.blue,
                            ),
                          )
                        : null,
                    contentPadding: const EdgeInsets.only(left: 10),
                    labelStyle: textFieldTextStyle,
                    hintText: widget.hintText,
                    errorStyle: const TextStyle(height: 0.001, fontSize: 0.001),
                  ),
                  inputFormatters: [
                    if (widget.isNum)
                      FilteringTextInputFormatter.allow(
                        RegExp(r'^[0-9]+\.?[0-9]*$'),
                      ),
                  ],
                  onChanged: (val) {
                    setState(() {
                      selectedItem = null;
                    });
                  },
                  controller: controller,
                ),
                noItemsFoundBuilder: (value) {
                  return const Center(child: Text('No Items found'));
                },
                itemBuilder: (context, itemData) {
                  return SizedBox(
                    height: 40,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 8.0, bottom: 0, top: 0),
                      child: Text(
                        itemData.toString(),
                        style: TextStyle(
                          fontSize: 15,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  );
                },
                onSuggestionSelected: widget.onSelected != null
                    ? (val) {
                        if (val == 'Add Item') {
                          // final screen =
                          //     FormHelpers.onLabelTap(widget.onChanged);
                          // tabController.pushTab(
                          //   TabScreen(
                          //     title: screen[0],
                          //     routeName: screen[1],
                          //   ),
                          //   destinationScreenRouteName: screen[2],
                          // );
                          // tabController.update();
                        }
                        widget.onSelected!(val as T);
                        if (widget.updateText) {
                          controller.text = val.toString();
                        }
                        setState(() {
                          selectedItem = val;
                        });
                      }
                    : (val) {},
                suggestionsCallback: (title) async {
                  newSuggestions = await widget.onChanged?.call(title) ?? [];
                  // newSuggestions.add('Add Item');
                  return newSuggestions;
                },
                validator: (val) {
                  if (widget.isRequired && (val?.isEmpty ?? true)) {
                    return 'This is a required field.';
                  }
                  return null;
                },
                hideOnEmpty: widget.onChanged == null,
                hideOnLoading: widget.onChanged == null,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
