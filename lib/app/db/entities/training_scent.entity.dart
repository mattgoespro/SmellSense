import 'package:floor/floor.dart'
    show ColumnInfo, Entity, ForeignKey, primaryKey;
import 'package:smellsense/app/db/entities/training_period.entity.dart';

@Entity(
  tableName: 'training_scent',
)
class TrainingScentEntity {
  @ColumnInfo(name: 'id')
  @primaryKey
  final String id;

  @ColumnInfo(name: 'supported_scent_id')
  final String supportedScentId;

  TrainingScentEntity({
    required this.id,
    required this.periodId,
    required this.supportedScentId,
  });

  @ColumnInfo(name: 'period_id')
  @ForeignKey(
    childColumns: ['period_id'],
    parentColumns: ['id'],
    entity: TrainingPeriodEntity,
  )
  final String periodId;

  @override
  String toString() =>
      'TrainingScentEntity(id: $id, supportedScentId: $supportedScentId, periodId: $periodId)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TrainingScentEntity &&
        other.id == id &&
        other.supportedScentId == supportedScentId &&
        other.periodId == periodId;
  }

  @override
  int get hashCode =>
      id.hashCode ^ supportedScentId.hashCode ^ periodId.hashCode;
}
