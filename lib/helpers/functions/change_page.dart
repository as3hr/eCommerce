// ignore_for_file: avoid_print

import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

Future<void> changePage(
  BuildContext context,
  String routeName,
) async {
  context.goNamed(
    routeName,
  );
}
