import 'package:flutter_test/flutter_test.dart';
import 'package:smellsense/app/application/providers/supported_training_scent.provider.dart';
import "package:smellsense/app/db/services/training_period.service.dart";
import 'package:smellsense/app/db/services/training_scent.service.dart';
import 'package:smellsense/app/db/services/training_session.service.dart';
import 'package:smellsense/app/db/services/training_session_entry.service.dart';
import 'package:smellsense/app/db/smellsense.db.dart';

import '../data/modules/training_period.data.dart';

void main() {
  group('Test: TrainingPeriodService', () {
    late SmellSenseDatabase database;
    late TrainingPeriodService trainingPeriodService;
    late SupportedTrainingScentProvider supportedTrainingScentProvider;
    late TrainingScentService trainingScentService;
    late TrainingSessionService trainingSessionService;
    late TrainingSessionEntryService trainingSessionEntryService;

    setUp(() async {
      database =
          await $FloorSmellSenseDatabase.inMemoryDatabaseBuilder().build();
      supportedTrainingScentProvider = SupportedTrainingScentProvider();
      trainingScentService = TrainingScentService(
        db: database,
        supportedTrainingScentProvider: supportedTrainingScentProvider,
      );
      trainingSessionEntryService = TrainingSessionEntryService(
        db: database,
        supportedTrainingScentProvider: supportedTrainingScentProvider,
        trainingScentService: trainingScentService,
      );
      trainingSessionService = TrainingSessionService(
        db: database,
        trainingSessionEntryService: trainingSessionEntryService,
      );
      trainingPeriodService = TrainingPeriodService(
        db: database,
        trainingSessionService: trainingSessionService,
      );
    });

    tearDown(() async {
      await database.close();
    });

    test('should create a new training period as the active training period',
        () async {
      await trainingPeriodService.createTrainingPeriod(
        testTrainingPeriod,
      );

      final activeTrainingPeriod =
          await trainingPeriodService.getTrainingPeriod();

      expect(
        activeTrainingPeriod.startDate,
        equals(testTrainingPeriod.startDate),
        reason:
            "The retrieved active training period should be the training period that was created.",
      );
    });
  });
}
