import 'package:drift/drift.dart';

@DataClassName('MovieEntity')
class Movies extends Table {
  IntColumn get id => integer()();
  TextColumn get title => text()();
  TextColumn get overview => text()();
  TextColumn get posterPath => text().nullable()();
  TextColumn get backdropPath => text().nullable()();
  RealColumn get voteAverage => real()();
  IntColumn get voteCount => integer()();
  DateTimeColumn get releaseDate => dateTime()();
  TextColumn get genreIds => text()();
  TextColumn get originalLanguage => text()();
  TextColumn get originalTitle => text()();
  BoolColumn get adult => boolean()();
  RealColumn get popularity => real()();
  BoolColumn get isBookmarked => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}
