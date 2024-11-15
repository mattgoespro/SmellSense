import 'package:smellsense/app/shared/modules/training_scent/training_scent.module.dart';
import 'package:smellsense/app/shared/modules/training_session/training_session_entry_altered_reaction.module.dart';
import 'package:smellsense/app/shared/modules/training_session/training_session_entry_rating.module.dart';

class TrainingSessionEntry {
  final String id;
  final TrainingScent scent;
  TrainingSessionEntryRating rating;
  TrainingSessionEntryAlteredReactionSeverity parosmiaReactionSeverity;
  TrainingSessionEntryAlteredReaction parosmiaReaction;
  String? comment;

  TrainingSessionEntry({
    required this.id,
    required this.scent,
    required this.rating,
    required this.parosmiaReaction,
    required this.parosmiaReactionSeverity,
    this.comment,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TrainingSessionEntry &&
        other.scent == scent &&
        other.rating.value == rating.value &&
        other.parosmiaReactionSeverity.severity ==
            parosmiaReactionSeverity.severity &&
        other.parosmiaReaction.reaction == parosmiaReaction.reaction &&
        other.comment == comment;
  }

  @override
  int get hashCode {
    return scent.hashCode ^
        rating.hashCode ^
        parosmiaReactionSeverity.hashCode ^
        parosmiaReaction.hashCode ^
        comment.hashCode;
  }

  @override
  String toString() =>
      "TrainingSessionEntry(scent: $scent, rating: $rating, parosmiaReactionSeverity: $parosmiaReactionSeverity, parosmiaReaction: $parosmiaReaction, comment: $comment)";
}
