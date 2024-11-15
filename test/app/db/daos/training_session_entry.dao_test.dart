import 'package:flutter_test/flutter_test.dart';
import 'package:smellsense/app/db/daos/training_period.dao.dart';
import 'package:smellsense/app/db/daos/training_session.dao.dart';
import 'package:smellsense/app/db/daos/training_session_entry.dao.dart';
import 'package:smellsense/app/db/smellsense.db.dart';

import '../data/entities/training_period.entity.data.dart';
import '../data/entities/training_session.entity.data.dart';
import '../data/entities/training_session_entry.entity.data.dart';

void main() {
  group('Test: TrainingSessionEntryDao', () {
    late SmellSenseDatabase database;
    late TrainingSessionDao trainingSessionDao;
    late TrainingPeriodDao trainingPeriodDao;
    late TrainingSessionEntryDao trainingSessionEntryDao;

    setUp(() async {
      database =
          await $FloorSmellSenseDatabase.inMemoryDatabaseBuilder().build();
      trainingPeriodDao = database.trainingPeriodDao;
      trainingSessionDao = database.trainingSessionDao;
      trainingSessionEntryDao = database.trainingSessionEntryDao;
    });

    tearDown(() async {
      await trainingSessionEntryDao
          .deleteTrainingSessionEntry(testTrainingSessionEntryEntity);
      await trainingSessionDao.deleteTrainingSession(testTrainingSessionEntity);
      await trainingPeriodDao.deleteTrainingPeriod(testTrainingPeriodEntity);
      await database.close();
    });

    test('should insert then find the training session entry', () async {
      await trainingPeriodDao.insertTrainingPeriod(testTrainingPeriodEntity);
      await trainingSessionDao.insertTrainingSession(testTrainingSessionEntity);
      await trainingSessionEntryDao
          .insertTrainingSessionEntry(testTrainingSessionEntryEntity);

      final retrievedSessionEntries = await trainingSessionEntryDao
          .findTrainingSessionEntries(testTrainingSessionEntity.id);

      expect(retrievedSessionEntries, hasLength(1),
          reason:
              "The found training session entries should have a length of 1.");
      expect(
        retrievedSessionEntries![0],
        equals(testTrainingSessionEntryEntity),
        reason:
            "The found training session entry should be equal to the inserted training session entry.",
      );
    });
  });
}
