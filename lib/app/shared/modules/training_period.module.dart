import 'package:smellsense/app/shared/modules/training_session/training_session.module.dart';

class TrainingPeriod {
  String id;
  final DateTime startDate;
  final List<TrainingSession> sessions;

  TrainingPeriod({
    required this.id,
    required this.startDate,
    required this.sessions,
  });

  @override
  String toString() {
    var sessionsString = sessions.map((e) => e.toString()).join("\n, ");

    return "TrainingPeriod(startDate: $startDate, sessions: $sessionsString)";
  }
}
