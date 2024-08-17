import 'package:smellsense/app/application/providers/supported_training_scent.provider.dart';
import 'package:smellsense/app/db/services/training_period.service.dart';
import 'package:smellsense/app/db/services/training_scent.service.dart';
import 'package:smellsense/app/db/services/training_session.service.dart';
import 'package:smellsense/app/db/services/training_session_entry.service.dart';
import 'package:smellsense/app/db/smellsense.db.dart';

class DatabaseService {
  late final SmellSenseDatabase _db;

  late TrainingPeriodService trainingPeriodService;
  late TrainingScentService trainingScentService;
  late TrainingSessionService trainingSessionService;
  late TrainingSessionEntryService trainingSessionEntryService;
  late SupportedTrainingScentProvider supportedTrainingScentProvider;

  DatabaseService({required SmellSenseDatabase db}) {
    _db = db;
    supportedTrainingScentProvider = SupportedTrainingScentProvider();

    trainingScentService = TrainingScentService(
      db: _db,
      supportedTrainingScentProvider: supportedTrainingScentProvider,
    );
    trainingSessionEntryService = TrainingSessionEntryService(
      db: _db,
      trainingScentService: trainingScentService,
    );
    trainingSessionService = TrainingSessionService(
      db: _db,
      trainingSessionEntryService: trainingSessionEntryService,
    );
    trainingPeriodService = TrainingPeriodService(
      db: _db,
      trainingSessionService: trainingSessionService,
      trainingScentService: trainingScentService,
    );
  }

  TrainingPeriodService getTrainingPeriodService() {
    return trainingPeriodService;
  }

  TrainingScentService getTrainingScentService() {
    return trainingScentService;
  }

  TrainingSessionService getTrainingSessionService() {
    return trainingSessionService;
  }

  TrainingSessionEntryService getTrainingSessionEntryService() {
    return trainingSessionEntryService;
  }
}
