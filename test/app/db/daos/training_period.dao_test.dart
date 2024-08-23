import 'package:flutter_test/flutter_test.dart';
import 'package:smellsense/app/db/daos/training_period.dao.dart';
import 'package:smellsense/app/db/smellsense.db.dart';

import '../data/entities/training_period.entity.data.dart';

void main() {
  group('Test: TrainingPeriodDao', () {
    late SmellSenseDatabase database;
    late TrainingPeriodDao trainingPeriodDao;

    setUp(() async {
      database =
          await $FloorSmellSenseDatabase.inMemoryDatabaseBuilder().build();
      trainingPeriodDao = database.trainingPeriodDao;
    });

    tearDown(() async {
      await trainingPeriodDao.deleteTrainingPeriod(testTrainingPeriodEntity);
      await database.close();
    });

    test('should insert then find a training period', () async {
      await trainingPeriodDao.insertTrainingPeriod(testTrainingPeriodEntity);

      final retrievedPeriod = await trainingPeriodDao
          .findTrainingPeriodById(testTrainingPeriodEntity.id);

      expect(
        retrievedPeriod,
        equals(testTrainingPeriodEntity),
        reason:
            "The found training period should be equal to the inserted training period.",
      );
    });
  });
}
