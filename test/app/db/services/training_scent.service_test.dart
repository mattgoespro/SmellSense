import 'package:flutter_test/flutter_test.dart';
import 'package:smellsense/app/application/providers/supported_training_scent.provider.dart';
import 'package:smellsense/app/db/services/training_scent.service.dart';
import 'package:smellsense/app/db/smellsense.db.dart';
import 'package:smellsense/app/shared/modules/training_scent/training_scent.module.dart';

import '../data/modules/training_period.data.dart';
import '../data/modules/training_scent.data.dart';

void main() {
  group('TrainingScentService', () {
    late SmellSenseDatabase database;
    late TrainingScentService trainingScentService;

    late SupportedTrainingScentProvider supportedTrainingScentProvider;

    TrainingScent testTrainingScent = testTrainingScents[0];

    setUp(() async {
      database =
          await $FloorSmellSenseDatabase.inMemoryDatabaseBuilder().build();
      supportedTrainingScentProvider = SupportedTrainingScentProvider();
      trainingScentService = TrainingScentService(
        db: database,
        supportedTrainingScentProvider: supportedTrainingScentProvider,
      );
    });

    tearDown(() async {
      await database.close();
    });

    test('should create a new training scent', () async {
      String trainingScentId = await trainingScentService.addTrainingScent(
        testTrainingPeriod.id,
        testTrainingScent,
      );

      final retrievedScent =
          await trainingScentService.getTrainingScent(trainingScentId);

      expect(
        retrievedScent,
        equals(testTrainingScent),
        reason: "The retrieved scent should be equal to the inserted scent.",
      );
    });
  });
}
