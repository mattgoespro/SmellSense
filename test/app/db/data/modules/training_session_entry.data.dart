import 'package:smellsense/app/shared/modules/training_scent/training_scent.module.dart';
import 'package:smellsense/app/shared/modules/training_session/training_session_entry.module.dart';
import 'package:smellsense/app/shared/modules/training_session/training_session_entry_rating.module.dart';

List<TrainingSessionEntry> testTrainingSessionEntries = [
  TrainingSessionEntry(
    scent: TrainingScent(name: TrainingScentName.cinnamon),
    rating: TrainingSessionEntryRating.weak,
    comment: "My smell is getting better - no longer smelling weird smells :)",
  ),
  TrainingSessionEntry(
    scent: TrainingScent(name: TrainingScentName.lavender),
    rating: TrainingSessionEntryRating.normal,
    comment: "Lavender is smelling as it should.",
  ),
  TrainingSessionEntry(
    scent: TrainingScent(name: TrainingScentName.lemon),
    rating: TrainingSessionEntryRating.heightened,
    comment: "I'm glad I can smell the strong scent of lemon again!",
  ),
  TrainingSessionEntry(
    scent: TrainingScent(name: TrainingScentName.lemon),
    rating: TrainingSessionEntryRating.heightened,
    comment: "Rosemary is smelling good today!",
  ),
];
