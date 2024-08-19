import 'package:flutter_test/flutter_test.dart';
import 'package:smellsense/app/db/daos/training_period.dao.dart';
import 'package:smellsense/app/db/daos/training_scent.dao.dart';
import 'package:smellsense/app/db/smellsense.db.dart';

import '../data/training_period.data.dart';
import '../data/training_scent.data.dart';

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

      await trainingPeriodDao.insertTrainingPeriod(testTrainingPeriod);
    });

    tearDown(() async {
      await trainingScentDao.deleteTrainingScent(testTrainingScent);
      await trainingPeriodDao.deleteTrainingPeriod(testTrainingPeriod);
    });

    test('should insert and retrieve the training scent', () async {
      await trainingScentDao.insertTrainingScent(testTrainingScent);

      final retrievedScent =
          await trainingScentDao.findTrainingScentById(testTrainingScent.id);

      expect(
        retrievedScent,
        equals(testTrainingScent),
        reason: "The retrieved scent should be equal to the inserted scent.",
      );
    });
  });
}
