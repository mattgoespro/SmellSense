import 'package:smellsense/app/application/providers/supported_training_scent.provider.dart';
import 'package:smellsense/app/db/daos/training_period.dao.dart';
import 'package:smellsense/app/db/entities/training_period.entity.dart';
import 'package:smellsense/app/db/entities/training_scent.entity.dart';
import 'package:smellsense/app/db/services/training_scent.service.dart';
import 'package:smellsense/app/db/services/training_session.service.dart';
import 'package:smellsense/app/db/services/util.service.dart';
import 'package:smellsense/app/db/smellsense.db.dart';
import 'package:smellsense/app/shared/modules/training_period.module.dart';
import 'package:smellsense/app/shared/modules/training_scent/training_scent.module.dart';
import 'package:smellsense/app/shared/modules/training_session/training_session.module.dart';
import 'package:smellsense/app/shared/string_builder.dart';

class TrainingPeriodService {
  final SmellSenseDatabase db;
  final TrainingSessionService _trainingSessionService;
  final TrainingScentService _trainingScentService;

  late TrainingPeriodDao _trainingPeriodDao;
  late SupportedTrainingScentProvider supportedTrainingScentProvider =
      SupportedTrainingScentProvider();

  TrainingPeriodService({
    required this.db,
    required trainingSessionService,
    required trainingScentService,
  })  : _trainingSessionService = trainingSessionService,
        _trainingScentService = trainingScentService {
    _trainingPeriodDao = db.trainingPeriodDao;
  }

  Future<TrainingPeriod> findTrainingPeriodById(String id) async {
    TrainingPeriodEntity? trainingPeriodEntity =
        await db.trainingPeriodDao.findTrainingPeriodById(id);

    if (trainingPeriodEntity == null) {
      throw SmellSenseDatabaseException("Training period not found: $id");
    }

    List<TrainingSession> sessions = await _trainingSessionService
        .getTrainingSessionsForPeriodId(trainingPeriodEntity.id);

    return TrainingPeriod(
      startDate: trainingPeriodEntity.startDate,
      sessions: sessions,
    );
  }

  Future<TrainingPeriod> getActiveTrainingPeriod() async {
    try {
      TrainingPeriodEntity? period =
          await _trainingPeriodDao.findActiveTrainingPeriod();

      if (period == null) {
        throw SmellSenseDatabaseException(
            "Cannot get active training period: No training periods exist.");
      }

      List<TrainingSession> sessions = await _trainingSessionService
          .getTrainingSessionsForPeriodId(period.id);

      return TrainingPeriod(
        startDate: period.startDate,
        sessions: sessions,
      );
    } catch (e) {
      throw SmellSenseDatabaseException(
          "Error retrieving active training period: ${e.toString()}");
    }
  }

  Future<void> createTrainingPeriod(
    DateTime startDate,
    List<TrainingScent> scents,
  ) async {
    try {
      String periodId = uuid();

      await _trainingPeriodDao.insertTrainingPeriod(
        TrainingPeriodEntity(
          id: periodId,
          startDate: startDate,
        ),
      );

      for (TrainingScent scent in scents) {
        var supportedScent = supportedTrainingScentProvider
            .findSupportedTrainingScentByName(scent.name.toString());

        await _trainingScentService.createTrainingScent(
            TrainingScentEntity(
              id: uuid(),
              periodId: periodId,
              supportedScentId: supportedScent.id,
            ),
            periodId);
      }
    } catch (e, stackTrace) {
      throw SmellSenseDatabaseException(
        StringBuilder.builder()
            .append("Error creating training period.")
            .appendLine(e.toString())
            .appendLine(stackTrace.toString())
            .toString(),
      );
    }
  }
}
