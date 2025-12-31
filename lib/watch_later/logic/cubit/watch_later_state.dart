part of 'watch_later_cubit.dart';

@freezed
class WatchLaterState with _$WatchLaterState {
  const factory WatchLaterState.initial() = _Initial;
  const factory WatchLaterState.loading() = WatchLaterLoading;
  const factory WatchLaterState.success(List<Movie> movies) = WatchLaterSuccess;
  const factory WatchLaterState.failure(ApiErrorModel error) = WatchLaterFailure;
  const factory WatchLaterState.empty() = WatchLaterEmpty;
}
