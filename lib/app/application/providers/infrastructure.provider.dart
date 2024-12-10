import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smellsense/app/application/providers/database_service.provider.dart';
import 'package:smellsense/app/application/providers/supported_training_scent.provider.dart';
import 'package:smellsense/app/db/services/database.service.dart';

class Infrastructure {
  late final DatabaseService databaseService;
  late final SupportedTrainingScentProvider supportedTrainingScentProvider;

  Infrastructure({
    required this.databaseService,
    required this.supportedTrainingScentProvider,
  });

  Infrastructure.of(BuildContext context) {
    var infrastructure = context.read<Infrastructure?>();

    if (infrastructure != null) {
      databaseService = infrastructure.databaseService;
      supportedTrainingScentProvider =
          infrastructure.supportedTrainingScentProvider;
    } else {
      throw Exception("Unable to access infrastructure.");
    }
  }

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
        supportedTrainingScentProvider: SupportedTrainingScentProvider(),
      );
    } catch (exception) {
      print(exception);
      throw Exception(
          "Fatal error: failed to create infrastructure: ${exception.toString()}.");
    }
  }
}
