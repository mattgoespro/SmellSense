import 'package:flutter_test/flutter_test.dart';
import 'package:smellsense/app/application/providers/supported_training_scent.provider.dart';
import 'package:smellsense/app/assets/supported_training_scent.dart';

void main() {
  group('Test: SupportedTrainingScentProvider', () {
    late SupportedTrainingScentProvider supportedTrainingScentProvider;
    final SupportedTrainingScent cinnamonScent =
        SupportedTrainingScent.fromJson(
      {
        "id": "83375a4b-327f-48cf-aebe-e16a953305a7",
        "name": "cinnamon",
        "displayName": "assets.data.supported_scents.display_name.cinnamon",
        "displayColor": "0xFF5D4037",
        "displayImage": "assets/images/cinnamon.png",
      },
    );

    setUp(() {
      supportedTrainingScentProvider = SupportedTrainingScentProvider();
    });

    test('should load and parse the supported training scent JSON data', () {
      expect(
        supportedTrainingScentProvider,
        isNotNull,
      );
    });

    test('should get a supported training scent by its ID', () {
      final scent = supportedTrainingScentProvider
          .getSupportedTrainingScentById(cinnamonScent.id);

      expect(
        scent,
        equals(cinnamonScent),
      );
    });

    test('should find a supported training scent by its name', () {
      final scent = supportedTrainingScentProvider
          .findSupportedTrainingScentByName(cinnamonScent.name);

      expect(
        scent,
        equals(cinnamonScent),
      );
    });
  });
}
