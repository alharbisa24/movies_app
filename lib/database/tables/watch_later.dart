import 'package:drift/drift.dart';

class WatchLater extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get movieId => text()();
  DateTimeColumn get addedAt => dateTime()();
}

