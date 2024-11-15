import 'package:smellsense/app/shared/dateutils.dart';
import 'package:smellsense/app/shared/modules/training_period.module.dart';

import 'training_session.data.dart';

TrainingPeriod testTrainingPeriod = TrainingPeriod(
  id: "cccb48f8-e4ac-4e1a-a5ff-db82dc1993de",
  startDate: DateTimeUtils.date(),
  sessions: [testTrainingSession],
);
