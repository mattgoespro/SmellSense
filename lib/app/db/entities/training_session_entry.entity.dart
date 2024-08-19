import 'package:floor/floor.dart'
    show ColumnInfo, ForeignKey, Entity, primaryKey;
import 'package:smellsense/app/db/entities/training_scent.entity.dart';
import 'package:smellsense/app/db/entities/training_session.entity.dart';

@Entity(
  tableName: 'training_session_entry',
)
class TrainingSessionEntryEntity {
  @ColumnInfo(name: 'id')
  @primaryKey
  final String id;

  @ColumnInfo(name: 'session_id')
  @ForeignKey(
    entity: TrainingSessionEntity,
    parentColumns: ['id'],
    childColumns: ['session_id'],
  )
  final String sessionId;

  @ForeignKey(
    entity: TrainingScentEntity,
    parentColumns: ['id'],
    childColumns: ['scent_id'],
  )
  @ColumnInfo(name: 'scent_id')
  final String scentId;

  @ColumnInfo(name: 'rating')
  final int rating;

  @ColumnInfo(name: 'parosmia_reaction')
  final int? parosmiaReaction;

  @ColumnInfo(name: 'parosmia_reaction_severity')
  final int? parosmiaReactionSeverity;

  @ColumnInfo(name: 'comment')
  final String? comment;

  TrainingSessionEntryEntity({
    required this.id,
    required this.sessionId,
    required this.scentId,
    required this.rating,
    this.comment,
    this.parosmiaReactionSeverity,
    this.parosmiaReaction,
  });

  @override
  String toString() {
    return 'TrainingSessionEntryEntity(id: $id, sessionId: $sessionId, scentId: $scentId, rating: $rating, comment: $comment, parosmiaReaction: $parosmiaReaction, parosmiaReactionSeverity: $parosmiaReactionSeverity)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TrainingSessionEntryEntity &&
        other.id == id &&
        other.sessionId == sessionId &&
        other.scentId == scentId &&
        other.rating == rating &&
        other.comment == comment &&
        other.parosmiaReaction == parosmiaReaction &&
        other.parosmiaReactionSeverity == parosmiaReactionSeverity;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      sessionId.hashCode ^
      scentId.hashCode ^
      rating.hashCode ^
      comment.hashCode ^
      parosmiaReaction.hashCode ^
      parosmiaReactionSeverity.hashCode;
}
