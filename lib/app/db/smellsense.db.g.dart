// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smellsense.db.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $SmellSenseDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $SmellSenseDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $SmellSenseDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<SmellSenseDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorSmellSenseDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $SmellSenseDatabaseBuilderContract databaseBuilder(String name) =>
      _$SmellSenseDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $SmellSenseDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$SmellSenseDatabaseBuilder(null);
}

class _$SmellSenseDatabaseBuilder
    implements $SmellSenseDatabaseBuilderContract {
  _$SmellSenseDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $SmellSenseDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $SmellSenseDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<SmellSenseDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$SmellSenseDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$SmellSenseDatabase extends SmellSenseDatabase {
  _$SmellSenseDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  TrainingPeriodDao? _trainingPeriodDaoInstance;

  TrainingSessionDao? _trainingSessionDaoInstance;

  TrainingSessionEntryDao? _trainingSessionEntryDaoInstance;

  TrainingScentDao? _trainingScentDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `training_scent` (`id` TEXT NOT NULL, `supported_scent_id` TEXT NOT NULL, `period_id` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `training_period` (`id` TEXT NOT NULL, `start_date` INTEGER NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `training_session` (`id` TEXT NOT NULL, `period_id` TEXT NOT NULL, `date` INTEGER NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `training_session_entry` (`id` TEXT NOT NULL, `session_id` TEXT NOT NULL, `scent_id` TEXT NOT NULL, `rating` INTEGER NOT NULL, `parosmia_reaction` INTEGER, `parosmia_reaction_severity` INTEGER, `comment` TEXT, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  TrainingPeriodDao get trainingPeriodDao {
    return _trainingPeriodDaoInstance ??=
        _$TrainingPeriodDao(database, changeListener);
  }

  @override
  TrainingSessionDao get trainingSessionDao {
    return _trainingSessionDaoInstance ??=
        _$TrainingSessionDao(database, changeListener);
  }

  @override
  TrainingSessionEntryDao get trainingSessionEntryDao {
    return _trainingSessionEntryDaoInstance ??=
        _$TrainingSessionEntryDao(database, changeListener);
  }

  @override
  TrainingScentDao get trainingScentDao {
    return _trainingScentDaoInstance ??=
        _$TrainingScentDao(database, changeListener);
  }
}

class _$TrainingPeriodDao extends TrainingPeriodDao {
  _$TrainingPeriodDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _trainingPeriodEntityInsertionAdapter = InsertionAdapter(
            database,
            'training_period',
            (TrainingPeriodEntity item) => <String, Object?>{
                  'id': item.id,
                  'start_date': _dateTimeTypeConverter.encode(item.startDate)
                }),
        _trainingPeriodEntityUpdateAdapter = UpdateAdapter(
            database,
            'training_period',
            ['id'],
            (TrainingPeriodEntity item) => <String, Object?>{
                  'id': item.id,
                  'start_date': _dateTimeTypeConverter.encode(item.startDate)
                }),
        _trainingPeriodEntityDeletionAdapter = DeletionAdapter(
            database,
            'training_period',
            ['id'],
            (TrainingPeriodEntity item) => <String, Object?>{
                  'id': item.id,
                  'start_date': _dateTimeTypeConverter.encode(item.startDate)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<TrainingPeriodEntity>
      _trainingPeriodEntityInsertionAdapter;

  final UpdateAdapter<TrainingPeriodEntity> _trainingPeriodEntityUpdateAdapter;

  final DeletionAdapter<TrainingPeriodEntity>
      _trainingPeriodEntityDeletionAdapter;

  @override
  Future<List<TrainingPeriodEntity>?> listTrainingPeriods() async {
    return _queryAdapter.queryList('SELECT id, start_date FROM training_period',
        mapper: (Map<String, Object?> row) => TrainingPeriodEntity(
            id: row['id'] as String,
            startDate:
                _dateTimeTypeConverter.decode(row['start_date'] as int)));
  }

  @override
  Future<TrainingPeriodEntity?> findActiveTrainingPeriod() async {
    return _queryAdapter.query(
        'SELECT id, start_date FROM training_period ORDER BY start_date DESC LIMIT 1',
        mapper: (Map<String, Object?> row) => TrainingPeriodEntity(
            id: row['id'] as String,
            startDate:
                _dateTimeTypeConverter.decode(row['start_date'] as int)));
  }

  @override
  Future<TrainingPeriodEntity?> findTrainingPeriodById(String id) async {
    return _queryAdapter.query(
        'SELECT id, start_date FROM training_period WHERE id = ?1',
        mapper: (Map<String, Object?> row) => TrainingPeriodEntity(
            id: row['id'] as String,
            startDate: _dateTimeTypeConverter.decode(row['start_date'] as int)),
        arguments: [id]);
  }

  @override
  Future<TrainingPeriodEntity?> findTrainingPeriodByStartDate(
      DateTime startDate) async {
    return _queryAdapter.query(
        'SELECT id, start_date FROM training_period WHERE start_date = ?1',
        mapper: (Map<String, Object?> row) => TrainingPeriodEntity(
            id: row['id'] as String,
            startDate: _dateTimeTypeConverter.decode(row['start_date'] as int)),
        arguments: [_dateTimeTypeConverter.encode(startDate)]);
  }

  @override
  Future<void> insertTrainingPeriod(TrainingPeriodEntity period) async {
    await _trainingPeriodEntityInsertionAdapter.insert(
        period, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateTrainingPeriod(TrainingPeriodEntity period) async {
    await _trainingPeriodEntityUpdateAdapter.update(
        period, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteTrainingPeriod(TrainingPeriodEntity period) async {
    await _trainingPeriodEntityDeletionAdapter.delete(period);
  }
}

class _$TrainingSessionDao extends TrainingSessionDao {
  _$TrainingSessionDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _trainingSessionEntityInsertionAdapter = InsertionAdapter(
            database,
            'training_session',
            (TrainingSessionEntity item) => <String, Object?>{
                  'id': item.id,
                  'period_id': item.periodId,
                  'date': _dateTimeTypeConverter.encode(item.date)
                }),
        _trainingSessionEntityDeletionAdapter = DeletionAdapter(
            database,
            'training_session',
            ['id'],
            (TrainingSessionEntity item) => <String, Object?>{
                  'id': item.id,
                  'period_id': item.periodId,
                  'date': _dateTimeTypeConverter.encode(item.date)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<TrainingSessionEntity>
      _trainingSessionEntityInsertionAdapter;

  final DeletionAdapter<TrainingSessionEntity>
      _trainingSessionEntityDeletionAdapter;

  @override
  Future<List<TrainingSessionEntity>> findTrainingSessionsByPeriodId(
      String periodId) async {
    return _queryAdapter.queryList(
        'SELECT id, period_id, date FROM training_session WHERE period_id = ?1',
        mapper: (Map<String, Object?> row) => TrainingSessionEntity(
            id: row['id'] as String,
            periodId: row['period_id'] as String,
            date: _dateTimeTypeConverter.decode(row['date'] as int)),
        arguments: [periodId]);
  }

  @override
  Future<TrainingSessionEntity?> findTrainingSessionById(String id) async {
    return _queryAdapter.query(
        'SELECT id, period_id, date FROM training_session WHERE id = ?1',
        mapper: (Map<String, Object?> row) => TrainingSessionEntity(
            id: row['id'] as String,
            periodId: row['period_id'] as String,
            date: _dateTimeTypeConverter.decode(row['date'] as int)),
        arguments: [id]);
  }

  @override
  Future<void> insertTrainingSession(TrainingSessionEntity session) async {
    await _trainingSessionEntityInsertionAdapter.insert(
        session, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteTrainingSession(TrainingSessionEntity session) async {
    await _trainingSessionEntityDeletionAdapter.delete(session);
  }
}

class _$TrainingSessionEntryDao extends TrainingSessionEntryDao {
  _$TrainingSessionEntryDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _trainingSessionEntryEntityInsertionAdapter = InsertionAdapter(
            database,
            'training_session_entry',
            (TrainingSessionEntryEntity item) => <String, Object?>{
                  'id': item.id,
                  'session_id': item.sessionId,
                  'scent_id': item.scentId,
                  'rating': item.rating,
                  'parosmia_reaction': item.parosmiaReaction,
                  'parosmia_reaction_severity': item.parosmiaReactionSeverity,
                  'comment': item.comment
                }),
        _trainingSessionEntryEntityDeletionAdapter = DeletionAdapter(
            database,
            'training_session_entry',
            ['id'],
            (TrainingSessionEntryEntity item) => <String, Object?>{
                  'id': item.id,
                  'session_id': item.sessionId,
                  'scent_id': item.scentId,
                  'rating': item.rating,
                  'parosmia_reaction': item.parosmiaReaction,
                  'parosmia_reaction_severity': item.parosmiaReactionSeverity,
                  'comment': item.comment
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<TrainingSessionEntryEntity>
      _trainingSessionEntryEntityInsertionAdapter;

  final DeletionAdapter<TrainingSessionEntryEntity>
      _trainingSessionEntryEntityDeletionAdapter;

  @override
  Future<List<TrainingSessionEntryEntity>> findTrainingSessionEntries(
      String sessionId) async {
    return _queryAdapter.queryList(
        'SELECT id, session_id, scent_id, rating, parosmia_reaction, parosmia_reaction_severity, comment FROM training_session_entry WHERE session_id = ?1',
        mapper: (Map<String, Object?> row) => TrainingSessionEntryEntity(id: row['id'] as String, sessionId: row['session_id'] as String, scentId: row['scent_id'] as String, rating: row['rating'] as int, comment: row['comment'] as String?, parosmiaReactionSeverity: row['parosmia_reaction_severity'] as int?, parosmiaReaction: row['parosmia_reaction'] as int?),
        arguments: [sessionId]);
  }

  @override
  Future<void> insertTrainingSessionEntry(
      TrainingSessionEntryEntity entry) async {
    await _trainingSessionEntryEntityInsertionAdapter.insert(
        entry, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteTrainingSessionEntry(
      TrainingSessionEntryEntity entry) async {
    await _trainingSessionEntryEntityDeletionAdapter.delete(entry);
  }

  @override
  Future<void> deleteTrainingSessionEntries(String sessionId) async {
    if (database is sqflite.Transaction) {
      await super.deleteTrainingSessionEntries(sessionId);
    } else {
      await (database as sqflite.Database)
          .transaction<void>((transaction) async {
        final transactionDatabase = _$SmellSenseDatabase(changeListener)
          ..database = transaction;
        await transactionDatabase.trainingSessionEntryDao
            .deleteTrainingSessionEntries(sessionId);
      });
    }
  }
}

class _$TrainingScentDao extends TrainingScentDao {
  _$TrainingScentDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _trainingScentEntityInsertionAdapter = InsertionAdapter(
            database,
            'training_scent',
            (TrainingScentEntity item) => <String, Object?>{
                  'id': item.id,
                  'supported_scent_id': item.supportedScentId,
                  'period_id': item.periodId
                }),
        _trainingScentEntityUpdateAdapter = UpdateAdapter(
            database,
            'training_scent',
            ['id'],
            (TrainingScentEntity item) => <String, Object?>{
                  'id': item.id,
                  'supported_scent_id': item.supportedScentId,
                  'period_id': item.periodId
                }),
        _trainingScentEntityDeletionAdapter = DeletionAdapter(
            database,
            'training_scent',
            ['id'],
            (TrainingScentEntity item) => <String, Object?>{
                  'id': item.id,
                  'supported_scent_id': item.supportedScentId,
                  'period_id': item.periodId
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<TrainingScentEntity>
      _trainingScentEntityInsertionAdapter;

  final UpdateAdapter<TrainingScentEntity> _trainingScentEntityUpdateAdapter;

  final DeletionAdapter<TrainingScentEntity>
      _trainingScentEntityDeletionAdapter;

  @override
  Future<TrainingScentEntity?> findTrainingScentById(String id) async {
    return _queryAdapter.query(
        'SELECT id, supported_scent_id, period_id FROM training_scent WHERE id = ?1',
        mapper: (Map<String, Object?> row) => TrainingScentEntity(id: row['id'] as String, periodId: row['period_id'] as String, supportedScentId: row['supported_scent_id'] as String),
        arguments: [id]);
  }

  @override
  Future<List<TrainingScentEntity>?> findTrainingScentsByPeriodId(
      String periodId) async {
    return _queryAdapter.queryList(
        'SELECT id, supported_scent_id, period_id FROM training_scent WHERE period_id = ?1',
        mapper: (Map<String, Object?> row) => TrainingScentEntity(id: row['id'] as String, periodId: row['period_id'] as String, supportedScentId: row['supported_scent_id'] as String),
        arguments: [periodId]);
  }

  @override
  Future<void> insertTrainingScent(TrainingScentEntity scent) async {
    await _trainingScentEntityInsertionAdapter.insert(
        scent, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateTrainingScent(TrainingScentEntity scent) async {
    await _trainingScentEntityUpdateAdapter.update(
        scent, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteTrainingScent(TrainingScentEntity scent) async {
    await _trainingScentEntityDeletionAdapter.delete(scent);
  }
}

// ignore_for_file: unused_element
final _dateTimeTypeConverter = DateTimeTypeConverter();
