import 'package:smellsense/app/shared/modules/training_session/training_session_entry.module.dart';

enum TrainingScentName {
  chamomile("chamomile"),
  cinnamon("cinnamon"),
  citronella("citronella"),
  clove("clove"),
  eucalyptus("eucalyptus"),
  garlic("garlic"),
  grapefruit("grapefruit"),
  lavender("lavender"),
  lemon("lemon"),
  mint("mint"),
  orange("orange"),
  rose("rose"),
  rosemary("rosemary"),
  teatree("teatree");

  final String scentName;

  const TrainingScentName(this.scentName);

  static fromString(String name) {
    return TrainingScentName.values.firstWhere(
      (element) => element.scentName == name,
    );
  }

  @override
  toString() => scentName;
}

class TrainingScent {
  static const maxTrainingScents = 4;

  final String id;
  final TrainingScentName name;

  TrainingScent({
    required this.id,
    required this.name,
  });

  TrainingScent.of(TrainingSessionEntry entry)
      : id = entry.id,
        name = entry.scent.name;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TrainingScent && other.name == name;
  }

  @override
  int get hashCode => name.hashCode;

  @override
  String toString() => "TrainingScent(name: $name)";
}
