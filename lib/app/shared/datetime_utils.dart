import 'package:intl/intl.dart' show DateFormat;

class DateTimeUtils {
  static final dateFormatter = DateFormat("yMMMEd");

  static DateTime getDate() {
    final date = DateTime.now();
    return DateTime(date.year, date.month, date.day);
  }

  static String formatDate(DateTime date) {
    return dateFormatter.format(date);
  }
}
