import 'package:flutter_test/flutter_test.dart';
import 'package:smellsense/app/db/smellsense.db.dart';

void dbTest(Function(SmellSenseDatabase) testFn) {
  late SmellSenseDatabase database;

  setUp(() async {
    database = await $FloorSmellSenseDatabase.inMemoryDatabaseBuilder().build();
  });

  tearDown(() async {
    await database.close();
  });

  testFn(database);
}
