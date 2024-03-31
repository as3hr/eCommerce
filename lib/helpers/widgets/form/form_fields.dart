import 'package:ecommerce_admin_panel/helpers/widgets/form/fields/image_field/image_type.dart';

class BaseFormFieldModel<T> {
  String? title;
  T? preFilledValue;
  void Function(T)? onSelected;
  bool isNum;
  bool isRequired;
  bool readOnly;
  String? hintText;
  List<BaseFormFieldModel>? childrens;
  BaseFormFieldModel({
    this.readOnly = false,
    this.childrens,
    this.preFilledValue,
    this.onSelected,
    this.isNum = false,
    this.isRequired = false,
    this.title,
    this.hintText,
  });
}

class BaseSuggestionFieldModel<T> extends BaseFormFieldModel<T> {
  Future<List<T>> Function(String)? onChanged;
  T? preFilledVal;
  bool hideSuffixIcon;
  BaseSuggestionFieldModel({
    super.hintText,
    this.hideSuffixIcon = false,
    this.onChanged,
    required super.title,
    this.preFilledVal,
    super.readOnly,
    super.isNum,
    super.isRequired,
    super.onSelected,
  });
}

class BaseMultiSelectFieldModel<T> extends BaseFormFieldModel<T> {
  List<T>? selectedValues;
  List<T>? dropdownItems;

  BaseMultiSelectFieldModel({
    super.hintText,
    this.selectedValues,
    required super.title,
    super.readOnly,
    super.isNum,
    super.isRequired,
    super.onSelected,
    this.dropdownItems,
  });
}

class BaseDropDownFieldModel<T> extends BaseFormFieldModel<T> {
  List<T>? dropdownItems;
  T? preFilledVal;

  BaseDropDownFieldModel({
    super.hintText,
    required super.title,
    this.preFilledVal,
    super.readOnly,
    super.isNum,
    super.isRequired,
    super.onSelected,
    this.dropdownItems,
  });
}

class BaseNestedFieldModel<T> extends BaseFormFieldModel<T> {
  BaseNestedFieldModel({
    required super.childrens,
  });
}

class BaseImageFieldModel<T> extends BaseFormFieldModel<T> {
  List<String> preFixImages;
  Function(List<ImageType>) getImages;
  BaseImageFieldModel({
    required this.preFixImages,
    required this.getImages,
  });
}

class BaseTextFieldModel<T> extends BaseFormFieldModel<T> {
  String? prefixText;
  bool isMultiLineField;

  BaseTextFieldModel({
    super.hintText,
    this.isMultiLineField = false,
    this.prefixText,
    required super.title,
    super.readOnly,
    super.isNum,
    super.isRequired,
    super.onSelected,
  });
}

class BaseNumberFieldModel<T> extends BaseFormFieldModel<T> {
  double? prefixNumber;

  BaseNumberFieldModel({
    super.hintText,
    this.prefixNumber,
    required super.title,
    super.readOnly,
    super.isNum,
    super.isRequired,
    super.onSelected,
  });
}

class BaseDateFieldModel<T> extends BaseFormFieldModel<T> {
  DateTime? preFilledDate;
  BaseDateFieldModel({
    this.preFilledDate,
    super.hintText,
    required super.title,
    super.readOnly,
    super.isNum,
    super.isRequired,
    super.onSelected,
  });
}

class BaseCheckFieldModel<T> extends BaseFormFieldModel<T> {
  bool? isChecked;

  BaseCheckFieldModel({
    super.hintText,
    required super.title,
    super.preFilledValue,
    super.readOnly,
    super.isNum,
    super.isRequired,
    super.onSelected,
    this.isChecked,
  });
}

class BaseDualCheckFieldModel<T> extends BaseFormFieldModel<T> {
  bool? isChecked1;
  bool? isChecked2;
  void Function(bool?)? onChanged1;
  void Function(bool?)? onChanged2;
  final dynamic preFilledValue2;
  final dynamic preFilledValue1;
  final String title1;
  final String title2;

  BaseDualCheckFieldModel({
    super.hintText,
    required this.title1,
    required this.title2,
    this.onChanged1,
    this.onChanged2,
    this.preFilledValue1,
    this.preFilledValue2,
    this.isChecked1,
    this.isChecked2,
  });
}

class BaseEmptyFieldModel<T> extends BaseFormFieldModel<T> {
  BaseEmptyFieldModel();
}
