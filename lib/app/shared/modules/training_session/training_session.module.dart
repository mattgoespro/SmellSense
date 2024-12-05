import 'package:flutter/foundation.dart';
import 'package:smellsense/app/shared/modules/training_session/training_session_entry.module.dart';

class TrainingSession {
  final String id;
  final DateTime date;
  final List<TrainingSessionEntry> entries;

  const TrainingSession({
    required this.id,
    required this.date,
    required this.entries,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TrainingSession &&
        other.date == date &&
        listEquals(other.entries, entries);
  }

  @override
  int get hashCode => date.hashCode ^ entries.hashCode;

  @override
  String toString() {
    String entriesString = entries.map((e) => e.toString()).join("\n, ");

    return "TrainingSession(date: $date, entries: $entriesString)";
  }
}
