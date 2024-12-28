import 'package:smellsense/app/application/providers/supported_training_scent.provider.dart';
import 'package:smellsense/app/db/daos/training_session_entry.dao.dart';
import 'package:smellsense/app/db/entities/training_session_entry.entity.dart';
import 'package:smellsense/app/db/services/training_scent.service.dart';
import 'package:smellsense/app/db/smellsense.db.dart';
import 'package:smellsense/app/shared/modules/training_scent/training_scent.module.dart';
import 'package:smellsense/app/shared/modules/training_session/training_session_entry.module.dart';
import 'package:smellsense/app/shared/modules/training_session/training_session_entry_parosmia_reaction.module.dart';
import 'package:smellsense/app/shared/modules/training_session/training_session_entry_rating.module.dart';
import 'package:smellsense/app/shared/utils/stringbuilder.dart';
import 'package:smellsense/app/assets/supported_training_scent.dart';

class TrainingSessionEntryService {
  final SmellSenseDatabase db;
  final TrainingScentService trainingScentService;
  final SupportedTrainingScentProvider supportedTrainingScentProvider;

  late TrainingSessionEntryDao _trainingSessionEntryDao;

  TrainingSessionEntryService({
    required this.db,
    required this.supportedTrainingScentProvider,
    required this.trainingScentService,
  }) {
    _trainingSessionEntryDao = db.trainingSessionEntryDao;
  }

  Future<List<TrainingSessionEntry>> getTrainingSessionEntries(
    String sessionId,
  ) async {
    try {
      List<TrainingSessionEntryEntity>? entryEntities =
          await _trainingSessionEntryDao.findTrainingSessionEntries(sessionId);

      // entryEntities!.forEach((entity) => print("$entity\n"));

      return Future.wait(
        entryEntities.map<Future<TrainingSessionEntry>>(
          (entity) async {
            TrainingScent scent =
                await trainingScentService.getTrainingScent(entity.id);

            return TrainingSessionEntry(
              id: entity.id,
              scent: scent,
              rating: TrainingSessionEntryRating.fromValue(entity.rating),
              comment: entity.comment,
              parosmiaReaction: TrainingSessionEntryParosmiaReaction.fromValue(
                entity.parosmiaReaction ?? 0,
              ),
              parosmiaReactionSeverity:
                  TrainingSessionEntryParosmiaSeverity.fromValue(
                entity.parosmiaReactionSeverity ?? 0,
              ),
            );
          },
        ).toList(),
      );
    } catch (e, stackTrace) {
      throw SmellSenseDatabaseException(
        StringBuilder.builder()
            .append("Error getting session entries for session '$sessionId'.")
            .appendLine(e.toString())
            .appendLine(stackTrace.toString())
            .build(),
      );
    }
  }

  Future<void> recordTrainingSessionEntry(
    String sessionId,
    TrainingSessionEntry entry,
  ) async {
    try {
      SupportedTrainingScent supportedScent =
          supportedTrainingScentProvider.findSupportedTrainingScentByName(
        entry.scent.name.name,
      );

      await _trainingSessionEntryDao.insertTrainingSessionEntry(
        TrainingSessionEntryEntity(
          id: entry.id,
          sessionId: sessionId,
          scentId: supportedScent.id,
          rating: entry.rating.value,
          comment: entry.comment,
          parosmiaReaction: entry.parosmiaReaction.reaction,
          parosmiaReactionSeverity: entry.parosmiaReactionSeverity.severity,
        ),
      );
    } catch (e, stackTrace) {
      throw SmellSenseDatabaseException(
        StringBuilder.builder()
            .append("Error adding session entry for session '$sessionId'.")
            .appendLine(e.toString())
            .appendLine(stackTrace.toString())
            .build(),
      );
    }
  }
}
