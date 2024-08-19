import 'package:floor/floor.dart';
import 'package:smellsense/app/db/entities/training_session.entity.dart';

@dao
abstract class TrainingSessionDao {
  @Query(
      'SELECT id, period_id, date FROM training_session WHERE period_id = :periodId')
  Future<List<TrainingSessionEntity>> findTrainingSessionsByPeriodId(
    String periodId,
  );

  @Query('SELECT id, period_id, date FROM training_session WHERE id = :id')
  Future<TrainingSessionEntity?> findTrainingSessionById(String id);

  @insert
  Future<void> insertTrainingSession(TrainingSessionEntity session);

  @delete
  Future<void> deleteTrainingSession(TrainingSessionEntity session);
}
