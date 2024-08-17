import 'package:floor/floor.dart'
    show ColumnInfo, ForeignKey, Entity, primaryKey;
import 'package:smellsense/app/db/entities/training_period.entity.dart';

@Entity(
  tableName: 'training_session',
)
class TrainingSessionEntity {
  @primaryKey
  final String id;

  @ForeignKey(
    entity: TrainingPeriodEntity,
    parentColumns: ['id'],
    childColumns: ['period_id'],
  )
  @ColumnInfo(name: 'period_id')
  final String periodId;

  @ColumnInfo(name: 'date')
  final DateTime date;

  TrainingSessionEntity({
    required this.id,
    required this.periodId,
    required this.date,
  });

  @override
  String toString() =>
      'TrainingSessionEntity(id: $id, periodId: $periodId, date: $date)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TrainingSessionEntity &&
        other.id == id &&
        other.periodId == periodId &&
        other.date == date;
  }

  @override
  int get hashCode => id.hashCode ^ periodId.hashCode ^ date.hashCode;
}
