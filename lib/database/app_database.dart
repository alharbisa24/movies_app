import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:movies/database/tables/search_history.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'tables/watch_later.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [WatchLater, SearchHistory])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        if (from < 3) {
          await m.createTable(searchHistory);
          await m.createTable(watchLater);
        }
      },
    );
  }

  Future<int> addWatchLater(WatchLaterCompanion movie) =>
      into(watchLater).insert(movie);

  Future<List<WatchLaterData>> getAllWatchLaters() =>
      select(watchLater).get();

  Stream<List<WatchLaterData>> watchWatchLaters() {
    return select(watchLater).watch();
  }

  Future updateWatchLater(WatchLaterData watchLaterData) =>
      update(watchLater).replace(watchLaterData);

  Future deleteWatchLater(int id) =>
      (delete(watchLater)..where((t) => t.movieId.equals(id.toString()))).go();

  Future<int> addSearchQuery(String query) async {
    final existing = await (select(searchHistory)
          ..where((t) => t.query.equals(query)))
        .getSingleOrNull();

    if (existing != null) {
      await (update(searchHistory)..where((t) => t.id.equals(existing.id)))
          .write(SearchHistoryCompanion(
        searchedAt: Value(DateTime.now()),
      ));
      return existing.id;
    } else {
      return await into(searchHistory).insert(
        SearchHistoryCompanion(
          query: Value(query),
          searchedAt: Value(DateTime.now()),
        ),
      );
    }
  }

  Future<List<SearchHistoryData>> getRecentSearches({int limit = 10}) {
    return (select(searchHistory)
          ..orderBy([(t) => OrderingTerm.desc(t.searchedAt)])
          ..limit(limit))
        .get();
  }

  Stream<List<SearchHistoryData>> watchRecentSearches({int limit = 10}) {
    return (select(searchHistory)
          ..orderBy([(t) => OrderingTerm.desc(t.searchedAt)])
          ..limit(limit))
        .watch();
  }

  Future<void> deleteSearchQuery(String query) {
    return (delete(searchHistory)..where((t) => t.query.equals(query))).go();
  }

  Future<void> clearSearchHistory() {
    return delete(searchHistory).go();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db_v1.sqlite'));
    return NativeDatabase(file);
  });
}
