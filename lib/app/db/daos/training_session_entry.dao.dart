import 'package:floor/floor.dart';
import 'package:smellsense/app/db/entities/training_session_entry.entity.dart';
import 'package:smellsense/app/shared/string_builder.dart';

@dao
abstract class TrainingSessionEntryDao {
  @Query(
      'SELECT id, session_id, scent_id, rating, parosmia_reaction, parosmia_reaction_severity, comment FROM training_session_entry WHERE session_id = :sessionId')
  Future<List<TrainingSessionEntryEntity>?>
      findTrainingSessionEntriesBySessionId(String sessionId);

  @insert
  Future<void> insertTrainingSessionEntry(TrainingSessionEntryEntity entry);

  @delete
  Future<void> deleteTrainingSessionEntry(TrainingSessionEntryEntity entry);

  @transaction
  Future<void> deleteTrainingSessionEntriesBySessionId(String sessionId) async {
    try {
      final List<TrainingSessionEntryEntity>? entries =
          await findTrainingSessionEntriesBySessionId(sessionId);

      if (entries == null) {
        throw Exception('No entries found for session $sessionId');
      }

      for (final entry in entries) {
        await deleteTrainingSessionEntry(entry);
      }
    } catch (e, stackTrace) {
      throw Exception(
        StringBuilder.builder()
            .append(
              'An error occurred deleting training session entries for session $sessionId',
            )
            .appendLine(e.toString())
            .appendLine(stackTrace.toString())
            .toString(),
      );
    }
  }
}
