import 'package:smellsense/app/db/entities/training_session.entity.dart';
import 'package:smellsense/app/shared/dateutils.dart';

import 'training_period.entity.data.dart';

final testTrainingSessionEntity = TrainingSessionEntity(
  id: "0706bcbb-b604-4fb8-866a-95cc362e9fe1",
  periodId: testTrainingPeriodEntity.id,
  date: DateTimeUtils.date(),
);
