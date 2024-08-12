import 'package:smellsense/app/application/providers/asset.provider.dart';
import 'package:smellsense/app/application/providers/database_service.provider.dart';
import 'package:smellsense/app/application/providers/supported_training_scent.provider.dart';
import 'package:smellsense/app/db/services/database.service.dart';

class Infrastructure {
  final DatabaseService databaseService;
  final AssetProvider assetProvider;
  final SupportedTrainingScentProvider supportedTrainingScentProvider;

  Infrastructure({
    required this.databaseService,
    required this.assetProvider,
    required this.supportedTrainingScentProvider,
  });

  AssetProvider getAssetProvider() => assetProvider;

  ///
  /// Get the infrastructure that is provided to all widgets.
  ///
  /// This method should only be called once throughout the application lifecycle.
  ///
  static Future<Infrastructure> getInfrastructure() async {
    try {
      final databaseService =
          await DatabaseServiceProvider.createDatabaseService();

      return Infrastructure(
        databaseService: databaseService,
        assetProvider: AssetProvider(),
        supportedTrainingScentProvider: SupportedTrainingScentProvider(),
      );
    } catch (exception) {
      throw Exception(
          "Fatal: failed to create infrastructure: ${exception.toString()}");
    }
  }
}
