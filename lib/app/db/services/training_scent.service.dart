import 'package:smellsense/app/application/providers/supported_training_scent.provider.dart';
import 'package:smellsense/app/db/daos/training_scent.dao.dart';
import 'package:smellsense/app/db/entities/training_period.entity.dart';
import 'package:smellsense/app/db/entities/training_scent.entity.dart'
    show TrainingScentEntity;
import 'package:smellsense/app/db/smellsense.db.dart';
import 'package:smellsense/app/shared/modules/training_scent/training_scent.module.dart'
    show TrainingScent, TrainingScentName;
import 'package:smellsense/app/shared/string_builder.dart';

class TrainingScentService {
  final SmellSenseDatabase db;
  final SupportedTrainingScentProvider supportedTrainingScentProvider;

  late TrainingScentDao _trainingScentDao;

  TrainingScentService({
    required this.db,
    required this.supportedTrainingScentProvider,
  }) {
    _trainingScentDao = db.trainingScentDao;
  }

  Future<TrainingScent> getTrainingScent(String id) async {
    try {
      TrainingScentEntity? entity =
          await _trainingScentDao.findTrainingScentById(id);

      if (entity == null) {
        throw SmellSenseDatabaseException("Training scent not found: $id");
      }

      var supportedScent = supportedTrainingScentProvider
          .getSupportedTrainingScentById(entity.supportedScentId);

      return TrainingScent(
        id: entity.id,
        name: TrainingScentName.fromString(supportedScent.name),
      );
    } catch (e, stackTrace) {
      throw SmellSenseDatabaseException(
        StringBuilder.builder()
            .append("Failed to retrieve training scent with ID '$id'.")
            .appendLine(e.toString())
            .appendLine(stackTrace.toString())
            .build(),
      );
    }
  }

  Future<List<TrainingScent>?> findTrainingScents(
    String periodId,
  ) async {
    try {
      TrainingPeriodEntity? periodEntity =
          await db.trainingPeriodDao.findTrainingPeriodById(periodId);

      if (periodEntity == null) {
        throw SmellSenseDatabaseException(
          "Failed to retrieve scents: period ID '$periodId' not found.",
        );
      }

      List<TrainingScentEntity>? entities =
          await _trainingScentDao.findTrainingScentsByPeriodId(periodEntity.id);

      if (entities == null || entities.isEmpty) {
        throw SmellSenseDatabaseException(
          "Failed to retrieve scents: no scents found for period with ID '$periodId'.",
        );
      }

      return Future.wait(
        entities.map<Future<TrainingScent>>(
          (entity) async {
            var supportedScent = supportedTrainingScentProvider
                .getSupportedTrainingScentById(entity.supportedScentId);

            return TrainingScent(
              id: entity.id,
              name: TrainingScentName.fromString(supportedScent.name),
            );
          },
        ).toList(),
      );
    } catch (e) {
      throw SmellSenseDatabaseException(
        StringBuilder.builder()
            .append(
              "Failed to retrieve training scents for period starting on '$periodId'.",
            )
            .appendLine(e.toString())
            .build(),
      );
    }
  }

  Future<void> createTrainingScent(
    String periodId,
    TrainingScent scent,
  ) async {
    try {
      var supportedScent = supportedTrainingScentProvider
          .findSupportedTrainingScentByName(scent.name.name);

      await _trainingScentDao.insertTrainingScent(
        TrainingScentEntity(
          id: scent.id,
          periodId: periodId,
          supportedScentId: supportedScent.id,
        ),
      );
    } catch (e) {
      throw SmellSenseDatabaseException(
        StringBuilder.builder()
            .append(
              "Failed to add scent '${scent.name.name}' to period '$periodId'.",
            )
            .appendLine(e.toString())
            .build(),
      );
    }
  }
}
