import 'package:flutter/material.dart';

class DateHelper {
  static String formatDate(DateTime date) {
    DateTime now = DateTime.now();
    Duration difference = now.difference(date);

    if (difference.inMinutes <= 1) {
      return 'now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inHours < 24) {
      if (difference.inHours == 1) {
        return '1 hour ago';
      }
      return '${difference.inHours} hours ago';
    } else if (difference.inDays < 30) {
      if (difference.inDays == 1) {
        return 'yesterday';
      }
      return '${difference.inDays} days ago';
    } else if (difference.inDays < 365) {
      int months = (difference.inDays / 30).floor();
      if (months == 1) {
        return 'last month';
      }
      return '$months months ago';
    } else {
      int years = (difference.inDays / 365).floor();
      if (years == 1) {
        return 'last year';
      }
      return '$years years ago';
    }
  }

  static Future<DateTime?> getDateFromPicker(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2028),
    );
    return date;
  }
}
