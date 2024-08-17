import 'package:floor/floor.dart' show ColumnInfo, primaryKey, Entity;

@Entity(
  tableName: 'training_period',
)
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

  @override
  String toString() => 'TrainingPeriodEntity(id: $id, startDate: $startDate)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TrainingPeriodEntity &&
        other.id == id &&
        other.startDate == startDate;
  }

  @override
  int get hashCode => id.hashCode ^ startDate.hashCode;
}
