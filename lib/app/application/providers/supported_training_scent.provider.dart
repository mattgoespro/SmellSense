import 'package:smellsense/app/static/supported_training_scent_data.dart';

class SupportedTrainingScentProvider {
  final SupportedTrainingScentData _supportedTrainingScentLoader =
      loadSupportedTrainingScents();

  SupportedTrainingScent findSupportedTrainingScentById(String id) {
    if (_supportedTrainingScentLoader.scents == null) {
      throw Exception('Supported training scent data is not loaded');
    }

    return _supportedTrainingScentLoader.scents!.firstWhere(
      (scent) => scent.id == id,
      orElse: () => throw Exception('Supported training scent not found'),
    );
  }

  SupportedTrainingScent findSupportedTrainingScentByName(String name) {
    if (_supportedTrainingScentLoader.scents == null) {
      throw Exception('Supported training scent data is not loaded');
    }

    return _supportedTrainingScentLoader.scents!.firstWhere(
      (scent) => scent.name == name,
      orElse: () => throw Exception('Supported training scent not found'),
    );
  }
}
