import 'package:flutter_test/flutter_test.dart';
import 'package:smellsense/app/application/providers/supported_training_scent.provider.dart';
import 'package:smellsense/app/db/services/training_period.service.dart';
import 'package:smellsense/app/db/services/training_scent.service.dart';
import 'package:smellsense/app/db/services/training_session.service.dart';
import 'package:smellsense/app/db/services/training_session_entry.service.dart';
import 'package:smellsense/app/db/smellsense.db.dart';
import 'package:smellsense/app/shared/modules/training_scent/training_scent.module.dart';

import '../data/modules/training_period.data.dart';
import '../data/modules/training_scent.data.dart';

void main() {
  group('Test: TrainingScentService', () {
    late SmellSenseDatabase db;
    late TrainingPeriodService trainingPeriodService;
    late TrainingSessionService trainingSessionService;
    late TrainingSessionEntryService trainingSessionEntryService;
    late TrainingScentService trainingScentService;

    late SupportedTrainingScentProvider supportedTrainingScentProvider;

    TrainingScent testTrainingScent = testTrainingScents[0];

    setUp(() async {
      db = await $FloorSmellSenseDatabase.inMemoryDatabaseBuilder().build();
      supportedTrainingScentProvider = SupportedTrainingScentProvider();
      trainingScentService = TrainingScentService(
        db: db,
        supportedTrainingScentProvider: supportedTrainingScentProvider,
      );
      trainingSessionEntryService = TrainingSessionEntryService(
        db: db,
        trainingScentService: trainingScentService,
        supportedTrainingScentProvider: supportedTrainingScentProvider,
      );
      trainingSessionService = TrainingSessionService(
        db: db,
        trainingSessionEntryService: trainingSessionEntryService,
      );
      trainingPeriodService = TrainingPeriodService(
        db: db,
        trainingSessionService: trainingSessionService,
      );

      await trainingPeriodService.createTrainingPeriod(testTrainingPeriod);
    });

    tearDown(() async {
      await db.close();
    });

    test('should create a new training scent', () async {
      await trainingScentService.createTrainingScent(
        testTrainingPeriod.id,
        testTrainingScent,
      );

      final retrievedScent =
          await trainingScentService.getTrainingScent(testTrainingScent.id);

      expect(
        retrievedScent,
        equals(testTrainingScent),
        reason:
            "The retrieved training scent should be the training scent that was created.",
      );
    });
  });
}
