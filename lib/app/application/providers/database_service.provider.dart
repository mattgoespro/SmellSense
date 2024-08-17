import 'package:smellsense/app/db/services/database.service.dart';
import 'package:smellsense/app/db/smellsense.db.dart';

class DatabaseServiceProvider {
  static const String dbName = 'smellsense_database.db';

  static late SmellSenseDatabase _database;

  ///
  /// Create the database service.
  ///
  /// This function should only be called once before the application initializes.
  ///
  static Future<DatabaseService> createDatabaseService() async {
    var db = await $FloorSmellSenseDatabase
        .databaseBuilder(DatabaseServiceProvider.dbName)
        .build();

    return DatabaseService(db: db);
  }

  static SmellSenseDatabase get database {
    return _database;
  }
}
