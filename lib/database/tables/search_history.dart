import 'package:drift/drift.dart';

class SearchHistory extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get query => text().withLength(min: 1, max: 255)();
  DateTimeColumn get searchedAt => dateTime()();
}
