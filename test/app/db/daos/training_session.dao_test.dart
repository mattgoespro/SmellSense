import 'package:flutter_test/flutter_test.dart';
import 'package:smellsense/app/db/daos/training_period.dao.dart';
import 'package:smellsense/app/db/daos/training_session.dao.dart';
import 'package:smellsense/app/db/smellsense.db.dart';

import '../data/training_period.data.dart';
import '../data/training_session.data.dart';

void main() {
  group('TrainingSessionDao', () {
    late SmellSenseDatabase database;
    late TrainingSessionDao trainingSessionDao;
    late TrainingPeriodDao trainingPeriodDao;

    setUp(() async {
      database =
          await $FloorSmellSenseDatabase.inMemoryDatabaseBuilder().build();
      trainingPeriodDao = database.trainingPeriodDao;
      trainingSessionDao = database.trainingSessionDao;

      await trainingPeriodDao.insertTrainingPeriod(testTrainingPeriod);
    });

    tearDown(() async {
      await trainingSessionDao.deleteTrainingSession(testTrainingSession);
      await trainingPeriodDao.deleteTrainingPeriod(testTrainingPeriod);
    });

    test('should insert and retrieve the training session', () async {
      await trainingSessionDao.insertTrainingSession(testTrainingSession);

      final retrievedSession = await trainingSessionDao
          .findTrainingSessionById(testTrainingSession.id);

      expect(
        retrievedSession,
        equals(testTrainingSession),
        reason:
            "The retrieved session should be equal to the inserted session.",
      );
    });
  });
}
