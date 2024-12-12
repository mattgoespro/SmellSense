import 'package:smellsense/app/db/services/training_period.service.dart';
import 'package:smellsense/app/db/smellsense.db.dart';
import 'package:smellsense/app/shared/modules/training_period.module.dart';
import 'package:smellsense/app/shared/stringbuilder.dart';

class TrainingSessionHistoryService {
  final SmellSenseDatabase db;
  final TrainingPeriodService trainingPeriodService;

  TrainingSessionHistoryService({
    required this.db,
    required this.trainingPeriodService,
  });

  Future<List<TrainingPeriod>> getTrainingSessionHistory() async {
    try {
      List<TrainingPeriod> trainingPeriods =
          await trainingPeriodService.getAllTrainingPeriods();
      return trainingPeriods;
    } catch (e, stackTrace) {
      throw SmellSenseDatabaseException(
        StringBuilder.builder()
            .append(
                "Failed to retrieve training periods for training session history.")
            .appendLine(e.toString())
            .appendLine(stackTrace.toString())
            .build(),
      );
    }
  }
}
