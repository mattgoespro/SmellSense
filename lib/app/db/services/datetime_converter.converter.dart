import 'package:floor/floor.dart';

class DateTimeTypeConverter extends TypeConverter<DateTime, int> {
  @override
  DateTime decode(int databaseValue) {
    var dateTime = DateTime.fromMillisecondsSinceEpoch(databaseValue);
    var date = stripTime(dateTime);
    print("Decoded date: $date");
    return date;
  }

  @override
  int encode(DateTime value) {
    var dateTime = value.millisecondsSinceEpoch;
    var date = DateTime.fromMillisecondsSinceEpoch(dateTime);
    var dateMillis = stripTime(date).millisecondsSinceEpoch;
    print("Encoded date: ${DateTime.fromMillisecondsSinceEpoch(dateMillis)}");
    return dateMillis;
  }

  DateTime stripTime(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day);
  }
}
