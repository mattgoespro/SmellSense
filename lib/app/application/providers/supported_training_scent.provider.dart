import 'package:smellsense/app/static/supported_training_scent_data.dart';

class SupportedTrainingScentProvider {
  final SupportedTrainingScentData _supportedTrainingScentLoader =
      SupportedTrainingScentData();

  SupportedTrainingScent findSupportedTrainingScent(String id) {
    if (_supportedTrainingScentLoader.scents == null) {
      throw Exception('Supported training scent data is not loaded');
    }

    return _supportedTrainingScentLoader.scents!.firstWhere(
      (element) => element.id == id,
      orElse: () => throw Exception('Supported training scent not found'),
    );
  }
}
