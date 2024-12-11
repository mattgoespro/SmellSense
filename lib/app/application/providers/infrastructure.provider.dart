import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smellsense/app/application/providers/database_service.provider.dart';
import 'package:smellsense/app/application/providers/supported_training_scent.provider.dart';
import 'package:smellsense/app/db/services/database.service.dart';
import 'package:smellsense/app/shared/logger.dart';

class Infrastructure {
  late final DatabaseService databaseService;
  late final SupportedTrainingScentProvider supportedTrainingScentProvider;

  Infrastructure({
    required this.databaseService,
    required this.supportedTrainingScentProvider,
  });

  Infrastructure.of(BuildContext context) {
    var infrastructure = context.read<Infrastructure>();

    databaseService = infrastructure.databaseService;
    supportedTrainingScentProvider =
        infrastructure.supportedTrainingScentProvider;
  }

  ///
  /// Get the infrastructure that is provided to all widgets.
  ///
  /// This method should only be called once throughout the application lifecycle.
  ///
  static Future<Infrastructure> getInfrastructure() async {
    try {
      final databaseService = await DatabaseServiceProvider.create();
      Log.trace(databaseService);
      return Infrastructure(
        databaseService: databaseService,
        supportedTrainingScentProvider: SupportedTrainingScentProvider(),
      );
    } catch (exception) {
      Log.error(exception);
      throw Exception(
          "Fatal error: failed to create infrastructure: ${exception.toString()}.");
    }
  }

  Infrastructure.empty() {
    supportedTrainingScentProvider = SupportedTrainingScentProvider();
  }
}
