import 'package:smellsense/app/static/supported_training_scent.dart';
import 'package:smellsense/app/static/supported_training_scent_data.dart';

class SupportedTrainingScentProvider {
  final SupportedTrainingScentDataLoader _supportedTrainingScentLoader =
      SupportedTrainingScentDataLoader.loadSupportedTrainingScents();

  List<SupportedTrainingScent> listSupportedTrainingScents() {
    return _supportedTrainingScentLoader.scents!;
  }

  SupportedTrainingScent getSupportedTrainingScentById(String id) {
    return _supportedTrainingScentLoader.scents!.firstWhere(
      (scent) => scent.id == id,
      orElse: () =>
          throw Exception("Supported training scent with ID '$id' not found."),
    );
  }

  SupportedTrainingScent findSupportedTrainingScentByName(String name) {
    return _supportedTrainingScentLoader.scents!.firstWhere(
      (scent) => scent.name == name,
      orElse: () => throw Exception(
          "Supported training scent with name '$name' not found."),
    );
  }
}
