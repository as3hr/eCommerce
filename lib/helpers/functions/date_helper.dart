import 'package:intl/intl.dart';

class DateHelper {
  static String formatDate(DateTime date) {
    return DateFormat('EEEE,  HH:mm').format(date.toLocal());
  }
}
