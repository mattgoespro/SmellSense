import 'package:smellsense/app/db/daos/training_session.dao.dart';
import 'package:smellsense/app/db/entities/training_session.entity.dart';
import 'package:smellsense/app/db/services/training_session_entry.service.dart';
import 'package:smellsense/app/db/smellsense.db.dart';
import 'package:smellsense/app/shared/modules/training_session/training_session.module.dart';
import 'package:smellsense/app/shared/modules/training_session/training_session_entry.module.dart';
import 'package:smellsense/app/shared/string_builder.dart';
import 'package:smellsense/app/shared/utils.dart';

class TrainingSessionService {
  final SmellSenseDatabase db;
  final TrainingSessionEntryService trainingSessionEntryService;
  late TrainingSessionDao _trainingSessionDao;

  TrainingSessionService({
    required this.db,
    required this.trainingSessionEntryService,
  }) {
    _trainingSessionDao = db.trainingSessionDao;
  }

  Future<void> addTrainingSessionsForPeriodId(
    String periodId,
    List<TrainingSession> sessions,
  ) async {
    try {
      for (var session in sessions) {
        var sessionId = uuid();

        await _trainingSessionDao.insertTrainingSession(
          TrainingSessionEntity(
            id: sessionId,
            periodId: periodId,
            date: session.date,
          ),
        );
      }
    } catch (e, stackTrace) {
      throw SmellSenseDatabaseException(
        StringBuilder.builder()
            .append("Error adding sessions for period '$periodId'.")
            .appendLine(e.toString())
            .appendLine(stackTrace.toString())
            .build(),
      );
    }
  }

  Future<List<TrainingSession>> getTrainingSessionsForPeriodId(
    String periodId,
  ) async {
    List<TrainingSession> sessions = [];

    try {
      List<TrainingSessionEntity> sessionEntities =
          await _trainingSessionDao.findTrainingSessionsByPeriodId(periodId);

      for (var entity in sessionEntities) {
        List<TrainingSessionEntry> sessionEntries =
            await trainingSessionEntryService
                .getTrainingSessionEntries(entity.id);

        sessions.add(
          TrainingSession(
            date: entity.date,
            entries: sessionEntries,
          ),
        );
      }

      return sessions;
    } catch (e) {
      throw SmellSenseDatabaseException(
        StringBuilder.builder()
            .append("Error getting sessions for period '$periodId'.")
            .appendLine(e.toString())
            .build(),
      );
    }
  }
}
