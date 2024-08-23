import 'package:smellsense/app/shared/modules/training_scent/training_scent_display.module.dart';

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
  teaTree("teaTree");

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

  TrainingScentName name;

  TrainingScent({
    required this.name,
  });

  TrainingScent.fromName(String name)
      : name = TrainingScentName.fromString(name);

  getDisplay() => TrainingScentDisplay.getScent(name);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TrainingScent && other.name == name;
  }

  @override
  int get hashCode => name.hashCode;

  @override
  String toString() {
    return "TrainingScent(name: $name)";
  }
}
