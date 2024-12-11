import 'package:smellsense/app/db/services/training_period.service.dart';
import 'package:smellsense/app/db/smellsense.db.dart';
import 'package:smellsense/app/shared/modules/training_period.module.dart';
import 'package:smellsense/app/shared/modules/training_session/training_session_entry.module.dart';
import 'package:smellsense/app/shared/modules/training_session_history.module.dart';
import 'package:smellsense/app/shared/string_builder.dart';

class TrainingSessionHistoryService {
  final SmellSenseDatabase db;
  final TrainingPeriodService trainingPeriodService;

  TrainingSessionHistoryService({
    required this.db,
    required this.trainingPeriodService,
  });

  Future<TrainingSessionHistory> getTrainingSessionHistory() async {
    List<TrainingSessionHistory> sessionHistories = [];

    try {
      List<TrainingPeriod> trainingPeriods =
          await trainingPeriodService.getAllTrainingPeriods();
    } catch (e, stackTrace) {}
  }
}
