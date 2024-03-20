import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormController<T> extends GetxController {}

class SaveIntent extends Intent {
  const SaveIntent();
}

class DeleteIntent extends Intent {
  const DeleteIntent();
}

class UpdateIntent extends Intent {
  const UpdateIntent();
}
