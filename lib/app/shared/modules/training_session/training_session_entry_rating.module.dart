enum TrainingSessionEntryRating {
  none("none", 0),
  weak("weak", 1),
  normal("normal", 2),
  heightened("heightened", 3),
  parosmia("parosmia", 4);

  final String rating;
  final int value;

  const TrainingSessionEntryRating(
    this.rating,
    this.value,
  );

  static TrainingSessionEntryRating fromValue(int value) {
    return TrainingSessionEntryRating.values.firstWhere(
      (element) => element.value == value,
    );
  }

  @override
  String toString() {
    return "TrainingSessionEntryRating($rating)";
  }
}

class TrainingSessionEntryRatings {
  static final Map<TrainingSessionEntryRating, String> _ratingText = {
    TrainingSessionEntryRating.none: "No smell at all",
    TrainingSessionEntryRating.weak: "Slight smell",
    TrainingSessionEntryRating.normal: "Moderate smell",
    TrainingSessionEntryRating.heightened: "Strong smell",
    TrainingSessionEntryRating.parosmia: "I smell something different",
  };

  static String? getRatingText(TrainingSessionEntryRating rating) {
    return _ratingText[rating];
  }
}
