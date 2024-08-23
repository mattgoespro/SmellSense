import 'package:smellsense/app/application/providers/supported_training_scent.provider.dart';
import 'package:smellsense/app/db/services/training_period.service.dart';
import 'package:smellsense/app/db/services/training_scent.service.dart';
import 'package:smellsense/app/db/services/training_session.service.dart';
import 'package:smellsense/app/db/services/training_session_entry.service.dart';
import 'package:smellsense/app/db/smellsense.db.dart';
import 'package:smellsense/app/shared/modules/training_scent/training_scent.module.dart';
import 'package:smellsense/app/shared/modules/training_session/training_session.module.dart';
import 'package:smellsense/app/shared/string_builder.dart';

class DatabaseService {
  late final SmellSenseDatabase db;

  late final TrainingPeriodService _trainingPeriodService;
  late final TrainingScentService _trainingScentService;
  late final TrainingSessionService _trainingSessionService;
  late final TrainingSessionEntryService _trainingSessionEntryService;
  late final SupportedTrainingScentProvider _supportedTrainingScentProvider;

  DatabaseService({
    required this.db,
    required SupportedTrainingScentProvider supportedTrainingScentProvider,
  }) {
    _supportedTrainingScentProvider = supportedTrainingScentProvider;
    _trainingScentService = TrainingScentService(
      db: db,
      supportedTrainingScentProvider: _supportedTrainingScentProvider,
    );
    _trainingSessionEntryService = TrainingSessionEntryService(
      db: db,
      supportedTrainingScentProvider: _supportedTrainingScentProvider,
      trainingScentService: _trainingScentService,
    );
    _trainingSessionService = TrainingSessionService(
      db: db,
      trainingSessionEntryService: _trainingSessionEntryService,
    );
    _trainingPeriodService = TrainingPeriodService(
      db: db,
      trainingSessionService: _trainingSessionService,
    );
  }

  createTrainingPeriod(
    DateTime startDate,
    List<TrainingScent> scents,
  ) async {
    try {
      var periodId =
          await _trainingPeriodService.createTrainingPeriod(startDate);

      for (TrainingScent scent in scents) {
        await _trainingScentService.addTrainingScent(periodId, scent);
      }
    } catch (error, stackTrace) {
      throw SmellSenseDatabaseException(
        StringBuilder.builder()
            .append("Error creating training period.")
            .appendLine(error.toString())
            .appendLine(stackTrace.toString())
            .build(),
      );
    }
  }

  recordTrainingSession(
    TrainingSession session,
  ) async {
    try {
      var period = await _trainingPeriodService.getTrainingPeriod();

      await _trainingSessionService.addTrainingSession(
        period.id,
        session,
      );
    } catch (error, stackTrace) {
      throw SmellSenseDatabaseException(
        StringBuilder.builder()
            .append("Error recording training sessions.")
            .appendLine(error.toString())
            .appendLine(stackTrace.toString())
            .build(),
      );
    }
  }
}
