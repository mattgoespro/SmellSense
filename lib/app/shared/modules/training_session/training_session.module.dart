import 'package:smellsense/app/shared/modules/training_session/training_session_entry.module.dart';

class TrainingSession {
  final DateTime date;
  final List<TrainingSessionEntry> entries;

  const TrainingSession({
    required this.date,
    required this.entries,
  });
}

class TrainingSessionEncouragements {
  static int currentIndex = 0;

  static const List<String> _encouragements = [
    "Try to remember exactly how this substance should smell",
    "Imagine yourself holding the real thing in your hands...the look, colours, texture and smell.",
    "Can you recall your last vivid memory of this smell?",
    "What positive associations can you make with this smell?",
  ];

  static String getNextEncouragement() {
    return _encouragements[++currentIndex % _encouragements.length];
  }
}
