import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies/core/networking/api_error_model.dart';
import 'package:movies/core/networking/api_result.dart';
import 'package:movies/database/app_database.dart';
import 'package:movies/home/genres/models/genre.dart';
import 'package:movies/home/genres/repo/genres_repo.dart';
import 'package:movies/home/models/movie.dart';
import 'package:movies/search/data/repo/search_repo.dart';

part 'search_state.dart';
part 'search_cubit.freezed.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepo _SearchRepo;
  final GenresRepo _genresRepo;
  final AppDatabase _database;

  SearchCubit(this._SearchRepo, this._genresRepo, this._database)
      : super(const SearchState.initial());

  List<Movie?>? search = [];
  List<Genre> genresList = [];
  int currentPage = 1;
  int totalPages = 1;
  String currentQuery = '';
  bool isLoadingMore = false;
  List<SearchHistoryData> searchHistory = [];

  Future<void> loadSearchHistory() async {
    searchHistory = await _database.getRecentSearches(limit: 10);
  }

  Future<void> addToSearchHistory(String query) async {
    if (query.trim().isEmpty) return;
    await _database.addSearchQuery(query);
    await loadSearchHistory();
  }

  Future<void> removeFromSearchHistory(String query) async {
    await _database.deleteSearchQuery(query);
    await loadSearchHistory();
  }

  Future<void> clearSearchHistory() async {
    await _database.clearSearchHistory();
    searchHistory = [];
  }

  void getSearch() async {
    emit(const SearchState.loading());

    final genresResult = await _genresRepo.getGenres();
    genresResult.when(
      success: (data) {
        genresList = data.genres;
      },
      failure: (error) {
        emit(SearchState.genresFailure());
        return;
      },
    );

    final moviesResult = await _SearchRepo.searchMovies(1, '');
    moviesResult.when(
      success: (data) {
        search = data.movies;
        emit(SearchState.success(List<Movie?>.from(data.movies)));
      },
      failure: (error) {
        emit(SearchState.failure(error));
      },
    );
  }

  void searchMovies(String query) async {
    if (query.trim().isEmpty) {
      emit(const SearchState.success([]));
      currentQuery = '';
      currentPage = 1;
      search = [];
      return;
    }

    await addToSearchHistory(query);

    currentPage = 1;
    currentQuery = query;
    search = [];

    emit(const SearchState.loading());

    if (genresList.isEmpty) {
      final genresResult = await _genresRepo.getGenres();
      genresResult.when(
        success: (data) {
          genresList = data.genres;
        },
        failure: (error) {
          emit(const SearchState.genresFailure());
          return;
        },
      );
    }

    final moviesResult = await _SearchRepo.searchMovies(currentPage, query);
    moviesResult.when(
      success: (data) {
        search = data.movies;
        totalPages = data.totalPages ?? 1;
        emit(SearchState.success(List<Movie?>.from(data.movies)));
      },
      failure: (error) {
        emit(SearchState.failure(error));
      },
    );
  }

  void loadMoreResults() async {
    if (isLoadingMore || currentPage >= totalPages || currentQuery.isEmpty) {
      return;
    }

    isLoadingMore = true;
    currentPage++;

    emit(SearchState.loadingMore(List<Movie?>.from(search ?? [])));

    final moviesResult = await _SearchRepo.searchMovies(currentPage, currentQuery);
    moviesResult.when(
      success: (data) {
        search = [...search ?? [], ...data.movies];
        totalPages = data.totalPages ?? 1;
        isLoadingMore = false;
        emit(SearchState.success(List<Movie?>.from(search ?? [])));
      },
      failure: (error) {
        currentPage--;
        isLoadingMore = false;
        emit(SearchState.success(List<Movie?>.from(search ?? [])));
      },
    );
  }
}
