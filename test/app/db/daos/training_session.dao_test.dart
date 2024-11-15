import 'package:flutter_test/flutter_test.dart';
import 'package:smellsense/app/db/daos/training_period.dao.dart';
import 'package:smellsense/app/db/daos/training_session.dao.dart';
import 'package:smellsense/app/db/smellsense.db.dart';

import '../data/entities/training_period.entity.data.dart';
import '../data/entities/training_session.entity.data.dart';

void main() {
  group('Test: TrainingSessionDao', () {
    late SmellSenseDatabase database;
    late TrainingSessionDao trainingSessionDao;
    late TrainingPeriodDao trainingPeriodDao;

    setUp(() async {
      database =
          await $FloorSmellSenseDatabase.inMemoryDatabaseBuilder().build();
      trainingPeriodDao = database.trainingPeriodDao;
      trainingSessionDao = database.trainingSessionDao;

      await trainingPeriodDao.insertTrainingPeriod(testTrainingPeriodEntity);
    });

    tearDown(() async {
      await trainingSessionDao.deleteTrainingSession(testTrainingSessionEntity);
      await trainingPeriodDao.deleteTrainingPeriod(testTrainingPeriodEntity);
      await database.close();
    });

    test('should insert then find the training session', () async {
      await trainingSessionDao.insertTrainingSession(testTrainingSessionEntity);

      final retrievedSession = await trainingSessionDao
          .findTrainingSessionById(testTrainingSessionEntity.id);

      expect(
        retrievedSession,
        equals(testTrainingSessionEntity),
        reason:
            "The found training session should be equal to the inserted training session.",
      );
    });
  });
}
