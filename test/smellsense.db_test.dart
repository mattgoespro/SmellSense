import 'package:flutter_test/flutter_test.dart';
import "package:smellsense/app/db/daos/training_period.dao.dart";
import "package:smellsense/app/db/daos/training_session.dao.dart";
import "package:smellsense/app/db/entities/training_period.entity.dart";
import "package:smellsense/app/db/entities/training_session.entity.dart";
import "package:smellsense/app/db/smellsense.db.dart";
import "package:smellsense/app/shared/datetime_utils.dart";

void main() {
  group('Database', () {
    late SmellSenseDatabase database;
    // late TrainingScentDao trainingScentDao;
    // late TrainingSessionEntryDao trainingSessionEntryDao;

    setUp(() async {
      database =
          await $FloorSmellSenseDatabase.inMemoryDatabaseBuilder().build();
    });

    tearDown(() async {
      await database.close();
    });

    group('TrainingPeriodDao', () {
      late TrainingPeriodDao trainingPeriodDao;
      final trainingPeriod = TrainingPeriodEntity(
        id: "e192b38e-58d9-49c8-8b8d-1368998f0f6d",
        startDate: DateTimeUtils.getDate(),
      );

      setUp(() async {
        trainingPeriodDao = database.trainingPeriodDao;
      });

      tearDown(() async {
        await trainingPeriodDao.deleteTrainingPeriod(trainingPeriod);
      });

      test('should insert and retrieve the training period', () async {
        await trainingPeriodDao.insertTrainingPeriod(trainingPeriod);

        final retrievedPeriod =
            await trainingPeriodDao.findTrainingPeriodById(trainingPeriod.id);

        expect(
          retrievedPeriod,
          equals(trainingPeriod),
          reason:
              "The retrieved period should be equal to the inserted period.",
        );
      });

      group('TrainingSessionDao', () {
        late TrainingSessionDao trainingSessionDao;
        late TrainingPeriodDao trainingPeriodDao;

        setUp(() async {
          trainingPeriodDao = database.trainingPeriodDao;
          trainingSessionDao = database.trainingSessionDao;

          await trainingPeriodDao.insertTrainingPeriod(trainingPeriod);
        });

        tearDown(() async {
          await trainingPeriodDao.deleteTrainingPeriod(trainingPeriod);
        });

        test('should insert and retrieve the training session', () async {
          final trainingSession = TrainingSessionEntity(
            id: "0706bcbb-b604-4fb8-866a-95cc362e9fe1",
            periodId: trainingPeriod.id,
            date: DateTimeUtils.getDate(),
          );

          await trainingSessionDao.insertTrainingSession(trainingSession);

          final retrievedSession = await trainingSessionDao
              .findTrainingSessionById(trainingSession.id);

          expect(
            retrievedSession,
            equals(trainingSession),
            reason:
                "The retrieved session should be equal to the inserted session.",
          );
        });
      });
    });
  });
}
