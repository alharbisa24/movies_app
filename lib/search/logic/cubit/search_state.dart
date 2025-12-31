part of 'search_cubit.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.initial() = _Initial;

  const factory SearchState.loading() = SearchLoading;
  const factory SearchState.success(List<Movie?> movies) = SearchSuccess;
  const factory SearchState.failure(ApiErrorModel error) = SearchFailure;

  const factory SearchState.loadingMore(List<Movie?> movies) = SearchLoadingMore;

  const factory SearchState.genresSuccess(List<Genre> genresList) = SearchGenresSuccess;
  const factory SearchState.genresFailure() = SearchGenresFailure;
}
