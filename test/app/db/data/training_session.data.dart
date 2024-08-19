import 'package:smellsense/app/db/entities/training_session.entity.dart';
import 'package:smellsense/app/shared/datetime_utils.dart';

import 'training_period.data.dart';

final testTrainingSession = TrainingSessionEntity(
  id: "0706bcbb-b604-4fb8-866a-95cc362e9fe1",
  periodId: testTrainingPeriod.id,
  date: DateTimeUtils.getDate(),
);
