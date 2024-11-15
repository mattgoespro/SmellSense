import 'package:flutter/material.dart';

enum TrainingSessionEntryAlteredReactionSeverity {
  none(0),
  mild(1),
  moderate(2),
  severe(3);

  final int severity;

  const TrainingSessionEntryAlteredReactionSeverity(this.severity);

  static fromValue(int value) =>
      TrainingSessionEntryAlteredReactionSeverity.values.firstWhere(
        (element) => element.index == value,
      );

  @override
  String toString() => "TrainingSessionEntryAlteredReactionSeverity($index)";
}

enum TrainingSessionEntryAlteredReaction {
  none(
    0,
    null,
  ),
  angry(
    1,
    Icon(Icons.sentiment_very_dissatisfied),
  ),
  disgusted(
    2,
    Icon(Icons.sentiment_dissatisfied),
  ),
  unhappy(
    3,
    Icon(Icons.mood_bad),
  ),
  neutral(
    4,
    Icon(Icons.sentiment_neutral),
  ),
  pleased(
    5,
    Icon(Icons.sentiment_satisfied),
  ),
  happy(
    6,
    Icon(Icons.sentiment_very_satisfied),
  );

  final int reaction;
  final Icon? icon;

  const TrainingSessionEntryAlteredReaction(this.reaction, this.icon);

  static fromValue(int value) {
    return TrainingSessionEntryAlteredReaction.values.firstWhere(
      (element) => element.reaction == value,
    );
  }

  @override
  String toString() => "TrainingSessionEntryParosmiaReaction($reaction)";
}

class TrainingSessionEntryParosmia {
  static const Map<String, String> _reactions = {
    'angry': 'assets/svg/emojis/angry.svg',
    'disgusted': 'assets/svg/emojis/disgusted.svg',
    'unhappy': 'assets/svg/emojis/unhappy.svg',
    'neutral': 'assets/svg/emojis/neutral.svg',
    'pleased': 'assets/svg/emojis/pleased.svg',
    'happy': 'assets/svg/emojis/happy.svg',
  };

  static const Map<TrainingSessionEntryAlteredReactionSeverity, String>
      _reactionSeverities = {
    TrainingSessionEntryAlteredReactionSeverity.mild: "Mild",
    TrainingSessionEntryAlteredReactionSeverity.moderate: "Moderate",
    TrainingSessionEntryAlteredReactionSeverity.severe: "Severe",
  };

  static String getParosmiaReactionEmoji(String reaction) =>
      _reactions[reaction]!;

  static Iterable<MapEntry<String, String>> getParosmiaReactions() =>
      _reactions.entries;

  static Iterable<MapEntry<TrainingSessionEntryAlteredReactionSeverity, String>>
      getParosmiaSeverities() => _reactionSeverities.entries;

  static String getParosmiaSeverityDisplayValue(
          TrainingSessionEntryAlteredReactionSeverity severity) =>
      _reactionSeverities[severity]!;
}
