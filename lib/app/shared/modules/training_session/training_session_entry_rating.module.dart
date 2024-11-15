enum TrainingSessionEntryRating {
  none("none", 0),
  weak("weak", 1),
  normal("normal", 2),
  strong("strong", 3),
  altered("altered", 4);

  final String rating;
  final int value;

  const TrainingSessionEntryRating(
    this.rating,
    this.value,
  );

  static TrainingSessionEntryRating fromValue(int value) =>
      TrainingSessionEntryRating.values.firstWhere(
        (element) => element.value == value,
      );

  @override
  String toString() => "TrainingSessionEntryRating($rating)";
}
