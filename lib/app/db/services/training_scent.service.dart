import 'package:smellsense/app/application/providers/supported_training_scent.provider.dart';
import 'package:smellsense/app/db/daos/training_scent.dao.dart';
import 'package:smellsense/app/db/entities/training_period.entity.dart';
import 'package:smellsense/app/db/entities/training_scent.entity.dart'
    show TrainingScentEntity;
import 'package:smellsense/app/db/services/util.service.dart';
import 'package:smellsense/app/db/smellsense.db.dart';
import 'package:smellsense/app/shared/modules/training_period.module.dart';
import 'package:smellsense/app/shared/modules/training_scent/training_scent.module.dart'
    show TrainingScent, TrainingScentName;

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

  Future<TrainingScent> findTrainingScentById(String id) async {
    try {
      TrainingScentEntity? entity =
          await _trainingScentDao.findTrainingScentById(id);

      if (entity == null) {
        throw SmellSenseDatabaseException(
            "Error retrieving scent: No scent found with ID '$id'.");
      }

      var supportedScent = supportedTrainingScentProvider
          .findSupportedTrainingScentById(entity.supportedScentId);

      return TrainingScent(
        name: TrainingScentName.fromString(supportedScent.name),
      );
    } catch (e) {
      throw SmellSenseDatabaseException(
          "Error retrieving scent: ${e.toString()}");
    }
  }

  Future<List<TrainingScent>?> findTrainingScentsForPeriod(
    TrainingPeriod period,
  ) async {
    try {
      TrainingPeriodEntity? periodEntity = await db.trainingPeriodDao
          .findTrainingPeriodByStartDate(period.startDate);

      List<TrainingScentEntity>? entities = await _trainingScentDao
          .findTrainingScentsByPeriodId(periodEntity!.id);

      if (entities == null || entities.isEmpty) {
        throw SmellSenseDatabaseException(
            "Error retrieving scents for period: No scents found for period with ID '$period'.");
      }

      var trainingScents = entities.map<Future<TrainingScent>>(
        (entity) async {
          var supportedScent = supportedTrainingScentProvider
              .findSupportedTrainingScentById(entity.supportedScentId);

          return TrainingScent(
            name: TrainingScentName.fromString(supportedScent.name),
          );
        },
      ).toList();

      return Future.wait(trainingScents);
    } catch (e) {
      throw SmellSenseDatabaseException(
          "Error retrieving scents for period: ${e.toString()}");
    }
  }

  Future<void> addTrainingScent(
    TrainingScentEntity scent,
    String periodId,
  ) async {
    try {
      await _trainingScentDao.insertTrainingScent(
        TrainingScentEntity(
          id: uuid(),
          supportedScentId: scent.supportedScentId,
          periodId: periodId,
        ),
      );
    } catch (e) {
      throw SmellSenseDatabaseException(
          "Error inserting scent: ${e.toString()}");
    }
  }
}
