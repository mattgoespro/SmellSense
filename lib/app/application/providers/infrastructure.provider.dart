import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smellsense/app/application/providers/asset.provider.dart';
import 'package:smellsense/app/application/providers/database_service.provider.dart';
import 'package:smellsense/app/application/providers/supported_training_scent.provider.dart';
import 'package:smellsense/app/db/services/database.service.dart';

class Infrastructure {
  late final DatabaseService databaseService;
  late final AssetProvider assetProvider;
  late final SupportedTrainingScentProvider supportedTrainingScentProvider;

  Infrastructure({
    required this.databaseService,
    required this.assetProvider,
    required this.supportedTrainingScentProvider,
  });

  Infrastructure.of(BuildContext context) {
    var infrastructure = context.read<Infrastructure?>();

    if (infrastructure != null) {
      assetProvider = infrastructure.assetProvider;
      databaseService = infrastructure.databaseService;
      supportedTrainingScentProvider =
          infrastructure.supportedTrainingScentProvider;
    }
  }

  AssetProvider getAssetProvider() => assetProvider;

  ///
  /// Get the infrastructure that is provided to all widgets.
  ///
  /// This method should only be called once throughout the application lifecycle.
  ///
  static Future<Infrastructure> getInfrastructure() async {
    try {
      final databaseService = await DatabaseServiceProvider.create();

      return Infrastructure(
        databaseService: databaseService,
        assetProvider: AssetProvider(),
        supportedTrainingScentProvider: SupportedTrainingScentProvider(),
      );
    } catch (exception) {
      throw Exception(
          "Fatal: Failed to create infrastructure: ${exception.toString()}.");
    }
  }
}
