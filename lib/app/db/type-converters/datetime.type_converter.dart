import 'package:floor/floor.dart';
import 'package:smellsense/app/shared/utils/datetimeutils.dart';

class DateTimeTypeConverter extends TypeConverter<DateTime, int> {
  @override
  DateTime decode(int databaseValue) {
    var dateTime = DateTime.fromMillisecondsSinceEpoch(databaseValue);
    return DateTimeUtils.getDateOnly(dateTime);
  }

  @override
  int encode(DateTime value) => value.millisecondsSinceEpoch;
}
