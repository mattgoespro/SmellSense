/// The part file `smellsense.db.g.dart` is generated by the `floor` package and is part of this
/// module. Members used in the part file are imported from here.
library;

import 'package:floor/floor.dart';
import 'package:smellsense/app/db/daos/supported_training_scent.dao.dart';
import 'package:smellsense/app/db/daos/training_period.dao.dart';
import 'package:smellsense/app/db/daos/training_scent.dao.dart';
import 'package:smellsense/app/db/daos/training_session.dao.dart';
import 'package:smellsense/app/db/daos/training_session_entry.dao.dart';
import 'package:smellsense/app/db/entities/supported_training_scent.entity.dart';
import 'package:smellsense/app/db/entities/training_period.entity.dart';
import 'package:smellsense/app/db/entities/training_scent.entity.dart';
import 'package:smellsense/app/db/entities/training_session.entity.dart';
import 'package:smellsense/app/db/services/datetime_converter.converter.dart';

import 'entities/training_session_entry.entity.dart';

part 'smellsense.db.g.dart';

@Database(version: 1, entities: [
  SupportedTrainingScentEntity,
  TrainingScentEntity,
  TrainingPeriodEntity,
  TrainingSessionEntity,
  TrainingSessionEntryEntity
])
@TypeConverters([DateTimeTypeConverter])
abstract class SmellSenseDatabase extends FloorDatabase {
  TrainingPeriodDao get trainingPeriodDao;
  TrainingSessionDao get trainingSessionDao;
  TrainingSessionEntryDao get trainingSessionEntryDao;
  SupportedTrainingScentDao get supportedTrainingScentDao;
  TrainingScentDao get trainingScentDao;
}

class SmellSenseDatabaseException implements Exception {
  final String message;

  SmellSenseDatabaseException(this.message);

  @override
  String toString() {
    return 'SmellSenseDatabaseException: $message';
  }
}