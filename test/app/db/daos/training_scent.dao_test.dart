import 'package:flutter_test/flutter_test.dart';
import 'package:smellsense/app/db/daos/training_period.dao.dart';
import 'package:smellsense/app/db/daos/training_scent.dao.dart';
import 'package:smellsense/app/db/smellsense.db.dart';

import '../data/entities/training_period.entity.data.dart';
import '../data/entities/training_scent.entity.data.dart';

void main() {
  group('TrainingScentDao', () {
    late SmellSenseDatabase database;
    late TrainingScentDao trainingScentDao;
    late TrainingPeriodDao trainingPeriodDao;

    setUp(() async {
      database =
          await $FloorSmellSenseDatabase.inMemoryDatabaseBuilder().build();
      trainingPeriodDao = database.trainingPeriodDao;
      trainingScentDao = database.trainingScentDao;

      await trainingPeriodDao.insertTrainingPeriod(testTrainingPeriodEntity);
    });

    tearDown(() async {
      await trainingScentDao.deleteTrainingScent(testTrainingScentEntity);
      await trainingPeriodDao.deleteTrainingPeriod(testTrainingPeriodEntity);
      await database.close();
    });

    test('should insert then find the training scent', () async {
      await trainingScentDao.insertTrainingScent(testTrainingScentEntity);

      final retrievedScent = await trainingScentDao
          .findTrainingScentById(testTrainingScentEntity.id);

      expect(
        retrievedScent,
        equals(testTrainingScentEntity),
        reason:
            "The found training scent should be equal to the inserted training scent.",
      );
    });
  });
}
