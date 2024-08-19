import 'package:flutter_test/flutter_test.dart';
import 'package:smellsense/app/db/daos/training_period.dao.dart';
import 'package:smellsense/app/db/daos/training_session.dao.dart';
import 'package:smellsense/app/db/daos/training_session_entry.dao.dart';
import 'package:smellsense/app/db/smellsense.db.dart';

import '../data/training_period.data.dart';
import '../data/training_session.data.dart';
import '../data/training_session_entry.data.dart';

void main() {
  group('TrainingSessionEntryDao', () {
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
          .deleteTrainingSessionEntry(testTrainingSessionEntry);
      await trainingSessionDao.deleteTrainingSession(testTrainingSession);
      await trainingPeriodDao.deleteTrainingPeriod(testTrainingPeriod);
    });

    test('should insert and retrieve the training session entry', () async {
      await trainingPeriodDao.insertTrainingPeriod(testTrainingPeriod);
      await trainingSessionDao.insertTrainingSession(testTrainingSession);
      await trainingSessionEntryDao
          .insertTrainingSessionEntry(testTrainingSessionEntry);

      final retrievedSessionEntries = await trainingSessionEntryDao
          .findTrainingSessionEntriesBySessionId(testTrainingSession.id);

      expect(retrievedSessionEntries, hasLength(1),
          reason: "The retrieved session entries should have a length of 1.");
      expect(
        retrievedSessionEntries![0],
        equals(testTrainingSessionEntry),
        reason:
            "The retrieved session entry should be equal to the inserted session entry.",
      );
    });
  });
}
