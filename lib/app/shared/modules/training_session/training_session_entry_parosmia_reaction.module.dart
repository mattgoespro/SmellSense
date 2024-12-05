enum TrainingSessionEntryParosmiaSeverity {
  none(0),
  mild(1),
  moderate(2),
  severe(3);

  final int severity;

  const TrainingSessionEntryParosmiaSeverity(this.severity);

  static TrainingSessionEntryParosmiaSeverity fromValue(int value) {
    return TrainingSessionEntryParosmiaSeverity.values.firstWhere(
      (element) => element.index == value,
    );
  }

  static List<TrainingSessionEntryParosmiaSeverity> getSeverities() {
    return TrainingSessionEntryParosmiaSeverity.values;
  }

  @override
  String toString() {
    return "TrainingSessionEntryParosmiaReactionSeverity($index)";
  }
}

enum TrainingSessionEntryParosmiaReaction {
  none(0),
  angry(1),
  disgusted(2),
  unhappy(3),
  neutral(4),
  pleased(5),
  happy(6);

  final int reaction;

  const TrainingSessionEntryParosmiaReaction(this.reaction);

  static TrainingSessionEntryParosmiaReaction fromValue(int value) {
    return TrainingSessionEntryParosmiaReaction.values.firstWhere(
      (element) => element.reaction == value,
    );
  }

  static List<TrainingSessionEntryParosmiaReaction> getReactions() {
    return TrainingSessionEntryParosmiaReaction.values;
  }

  @override
  String toString() {
    return "TrainingSessionEntryParosmiaReaction($reaction)";
  }
}
