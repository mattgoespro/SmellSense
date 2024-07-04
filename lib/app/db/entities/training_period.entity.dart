import 'package:floor/floor.dart' show ColumnInfo, entity, primaryKey;

@entity
class TrainingPeriodEntity {
  @ColumnInfo(name: 'id')
  @primaryKey
  final String id;

  @ColumnInfo(name: 'start_date')
  final DateTime startDate;

  TrainingPeriodEntity({
    required this.id,
    required this.startDate,
  });
}