import 'package:flutter_test/flutter_test.dart';
import 'package:smellsense/app/db/daos/training_period.dao.dart';
import 'package:smellsense/app/db/smellsense.db.dart';

import '../data/training_period.data.dart';

void main() {
  group('TrainingPeriodDao', () {
    late SmellSenseDatabase database;
    late TrainingPeriodDao trainingPeriodDao;

    setUp(() async {
      database =
          await $FloorSmellSenseDatabase.inMemoryDatabaseBuilder().build();
      trainingPeriodDao = database.trainingPeriodDao;
    });

    tearDown(() async {
      await trainingPeriodDao.deleteTrainingPeriod(testTrainingPeriod);
    });

    test('should insert and retrieve the training period', () async {
      await trainingPeriodDao.insertTrainingPeriod(testTrainingPeriod);

      final retrievedPeriod =
          await trainingPeriodDao.findTrainingPeriodById(testTrainingPeriod.id);

      expect(
        retrievedPeriod,
        equals(testTrainingPeriod),
        reason: "The retrieved period should be equal to the inserted period.",
      );
    });
  });
}
