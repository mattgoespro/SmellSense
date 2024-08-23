import 'package:smellsense/app/db/entities/training_session_entry.entity.dart';

import 'training_scent.entity.data.dart';
import 'training_session.entity.data.dart';

final testTrainingSessionEntryEntity = TrainingSessionEntryEntity(
  id: "9e2b1811-66a2-4629-b8e1-197db9713265",
  scentId: testTrainingScentEntity.id,
  sessionId: testTrainingSessionEntity.id,
  rating: 3,
  parosmiaReaction: 0,
  parosmiaReactionSeverity: 0,
  comment: "My smell is getting better - no longer smelling weird smells :)",
);

final testTrainingSessionEntryWithParosmiaEntity = TrainingSessionEntryEntity(
  id: "cb0b2cd4-1dbc-40d9-a2ff-a7fe6e4d0a39",
  scentId: testTrainingScentEntity.id,
  sessionId: testTrainingSessionEntity.id,
  rating: 5,
  parosmiaReaction: 2,
  parosmiaReactionSeverity: 3,
  comment: "I'm still smelling weird smells :(",
);
