import 'package:floor/floor.dart';
import 'package:smellsense/db/entities/training_session.entity.dart';
import 'package:smellsense/db/entities/training_session_entry.entity.dart';

@dao
abstract class TrainingSessionDao {
  @Query(
      'SELECT id, period_id FROM TrainingSession as ts INNER JOIN TrainingPeriod as tsp ON ts.period_id = tsp.id WHERE tsp.id = :periodId')
  Stream<List<TrainingSessionEntryEntity>> findTrainingSessionsByPeriodId(
      String periodId);

  @insert
  Future<void> insertTrainingSession(TrainingSessionEntity session);
}
