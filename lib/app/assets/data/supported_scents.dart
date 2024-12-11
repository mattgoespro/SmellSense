import 'package:smellsense/app/assets/supported_training_scent.dart';

class SupportedTrainingScentDataLoader {
  List<SupportedTrainingScent>? scents;

  SupportedTrainingScentDataLoader({this.scents});

  factory SupportedTrainingScentDataLoader.fromJson(
    List<Map<String, String>> json,
  ) =>
      SupportedTrainingScentDataLoader(
        scents: json.map(SupportedTrainingScent.fromJson).toList(),
      );

  static SupportedTrainingScentDataLoader loadSupportedTrainingScents() =>
      SupportedTrainingScentDataLoader.fromJson(supportedScentsData);
}
