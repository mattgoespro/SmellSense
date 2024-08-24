import 'package:smellsense/app/shared/modules/training_session/training_session_entry.module.dart';
import 'package:smellsense/app/shared/modules/training_session/training_session_entry_parosmia_reaction.module.dart';
import 'package:smellsense/app/shared/modules/training_session/training_session_entry_rating.module.dart';

import 'training_scent.data.dart';

List<TrainingSessionEntry> testTrainingSessionEntries = [
  TrainingSessionEntry(
    id: "8afd4d34-4603-4916-ac59-573af89f325d",
    scent: testTrainingScents[0],
    rating: TrainingSessionEntryRating.weak,
    parosmiaReaction: TrainingSessionEntryParosmiaReaction.neutral,
    parosmiaReactionSeverity: TrainingSessionEntryParosmiaReactionSeverity.mild,
    comment:
        "My smell is getting better, but lavender is still smelling slightly strange.",
  ),
  TrainingSessionEntry(
    id: "1a9fa05d-c28a-4f6b-ba5e-fdacb44f53b0",
    scent: testTrainingScents[1],
    rating: TrainingSessionEntryRating.normal,
    parosmiaReaction: TrainingSessionEntryParosmiaReaction.none,
    parosmiaReactionSeverity: TrainingSessionEntryParosmiaReactionSeverity.none,
    comment: "Lavender is smelling as it should.",
  ),
  TrainingSessionEntry(
    id: "bdd636f2-041b-4dd3-9e2d-792eed06135c",
    scent: testTrainingScents[2],
    rating: TrainingSessionEntryRating.heightened,
    parosmiaReaction: TrainingSessionEntryParosmiaReaction.none,
    parosmiaReactionSeverity: TrainingSessionEntryParosmiaReactionSeverity.none,
    comment: "I'm glad I can smell the strong scent of lemon again!",
  ),
  TrainingSessionEntry(
    id: "c86832fc-de4e-417f-9149-94acc9169416",
    scent: testTrainingScents[3],
    rating: TrainingSessionEntryRating.heightened,
    parosmiaReaction: TrainingSessionEntryParosmiaReaction.none,
    parosmiaReactionSeverity: TrainingSessionEntryParosmiaReactionSeverity.none,
    comment: "Rosemary is smelling good today!",
  ),
];
