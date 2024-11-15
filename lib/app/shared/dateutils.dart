import 'package:intl/intl.dart' show DateFormat;

class DateTimeUtils {
  static final dateFormatter = DateFormat("yMMMEd");

  static DateTime date() {
    final date = DateTime.now();
    return DateTime(date.year, date.month, date.day);
  }

  static DateTime getDateOnly(DateTime date) =>
      DateTime(date.year, date.month, date.day);

  static String toDateString(DateTime date) => dateFormatter.format(date);
}
