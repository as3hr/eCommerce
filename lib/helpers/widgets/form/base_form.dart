import 'package:ecommerce_admin_panel/helpers/extensions/theme_colors.dart';
import 'package:ecommerce_admin_panel/helpers/functions/loading_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../functions/show_toast.dart';
import 'base_form_button.dart';
import 'form_controller.dart';
import 'form_fields.dart';
import 'functions/form_helpers.dart';

class BaseForm<T> extends StatefulWidget {
  final List<BaseFormFieldModel> formFieldsList;
  final Future Function()? savefunction;
  final Future Function()? updatefunction;
  final Future Function()? deletefunction;
  final Future Function()? getFormData;
  final bool isNew;
  const BaseForm({
    super.key,
    this.isNew = true,
    this.getFormData,
    required this.formFieldsList,
    this.savefunction,
    this.updatefunction,
    this.deletefunction,
  });
  @override
  State<BaseForm> createState() => _BaseFormState();
}

class _BaseFormState extends State<BaseForm> {
  @override
  void initState() {
    super.initState();
    getFormData();
  }

  final controlS = const SingleActivator(
    LogicalKeyboardKey.keyS,
    control: true,
  );

  final controlU = const SingleActivator(
    LogicalKeyboardKey.keyU,
    control: true,
  );

  final controlD = const SingleActivator(
    LogicalKeyboardKey.keyD,
    control: true,
  );

  Future<void> getFormData() async {
    if (widget.getFormData != null) {
      loadingWrapper(() async {
        await widget.getFormData!.call().then((value) => setState(() {}));
      });
    }
  }

  Future<void> saveForm() async {
    if (widget.savefunction != null) {
      await loadingWrapper(() async {
        await widget.savefunction!.call();
      });
      showToast(message: 'Record created successfully');
    }
  }

  Future<void> updateForm() async {
    if (widget.updatefunction != null) {
      await loadingWrapper(() async {
        await widget.updatefunction!.call();
      });
      showToast(message: 'Record updated successfully');
    }
  }

  Future<void> deleteForm() async {
    if (widget.deletefunction != null) {
      await loadingWrapper(() async {
        await widget.deletefunction!.call();
      });
      showToast(message: 'Record deleted successfully');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FormController>(
      init: FormController(),
      builder: (controller) {
        return Shortcuts(
          shortcuts: <ShortcutActivator, Intent>{
            controlS: const SaveIntent(),
            controlU: const UpdateIntent(),
            controlD: const DeleteIntent(),
          },
          child: Actions(
              actions: {
                SaveIntent: CallbackAction(
                  onInvoke: (intent) {
                    widget.isNew ? saveForm() : null;
                    return null;
                  },
                ),
                UpdateIntent: CallbackAction(
                  onInvoke: (intent) {
                    widget.isNew ? null : updateForm();
                    return null;
                  },
                ),
                DeleteIntent: CallbackAction(
                  onInvoke: (intent) {
                    deleteForm();
                    return null;
                  },
                ),
              },
              child: FocusScope(
                autofocus: true,
                child: Column(
                  children: [
                    SizedBox(
                      height: 0.08.sh,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          BaseFormButton(
                            text: 'Delete',
                            textColor: Colors.red,
                            toolTipText: widget.isNew ? null : 'Delete',
                            onPressed:
                                widget.isNew || widget.deletefunction == null
                                    ? null
                                    : deleteForm,
                          ),
                          BaseFormButton(
                            text: 'Update',
                            toolTipText: widget.isNew ? null : 'Update',
                            onPressed:
                                widget.isNew || widget.updatefunction == null
                                    ? null
                                    : updateForm,
                          ),
                          BaseFormButton(
                            text: 'Save',
                            toolTipText: widget.isNew ? 'Save' : null,
                            onPressed:
                                widget.isNew && widget.savefunction != null
                                    ? saveForm
                                    : null,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Container(
                          color: ThemeColors.white,
                          width: 1.sw,
                          child: Form(
                            child: Column(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: ListView.builder(
                                      itemCount: widget.formFieldsList.length,
                                      itemBuilder: (context, listIndex) {
                                        final item =
                                            widget.formFieldsList[listIndex];
                                        return SizedBox(
                                          child: FormHelpers.getFieldWidget(
                                              item, context),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        );
      },
    );
  }
}
