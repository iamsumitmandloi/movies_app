import 'package:drift/drift.dart';

@DataClassName('CacheMetadataEntity')
class CacheMetadata extends Table {
  TextColumn get key => text()();
  DateTimeColumn get lastUpdated => dateTime()();
  DateTimeColumn get expiresAt => dateTime()();

  @override
  Set<Column> get primaryKey => {key};
}
