import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:drift_sqflite/drift_sqflite.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart' as sqflite;

import '../../core/constants/api_constants.dart';
import 'entities/movie_entity.dart';
import 'entities/cache_metadata_entity.dart';
import 'dao/movie_dao.dart';
import 'dao/cache_metadata_dao.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [Movies, CacheMetadata],
  daos: [MovieDao, CacheMetadataDao],
)
@singleton
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => DatabaseConstants.dbVersion;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
      await m.createAll();

      await customStatement(
        'CREATE INDEX IF NOT EXISTS idx_movie_title ON movies(title)',
      );
      await customStatement(
        'CREATE INDEX IF NOT EXISTS idx_movie_bookmark ON movies(is_bookmarked)',
      );
      await customStatement(
        'CREATE INDEX IF NOT EXISTS idx_movie_release_date ON movies(release_date)',
      );
    },
  );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    if (Platform.isAndroid || Platform.isIOS) {
      final dbFolder = await sqflite.getDatabasesPath();
      final file = File(p.join(dbFolder, DatabaseConstants.dbName));
      return SqfliteQueryExecutor.inDatabaseFolder(
        path: file.path,
        logStatements: true,
      );
    } else {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, DatabaseConstants.dbName));
      return NativeDatabase(file);
    }
  });
}
