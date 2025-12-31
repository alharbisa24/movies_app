import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:movies/core/networking/api_service.dart';
import 'package:movies/core/networking/dio_factory.dart';
import 'package:movies/core/services/local_auth_service.dart';
import 'package:movies/database/app_database.dart';
import 'package:movies/home/genres/api/genres_api_service.dart';
import 'package:movies/home/genres/repo/genres_repo.dart';
import 'package:movies/home/popular/data/api/popular_movies_api_service.dart';
import 'package:movies/home/popular/data/repo/popular_movies_repo.dart';
import 'package:movies/home/toprated/data/api/top_rated_movies_api_service.dart';
import 'package:movies/home/toprated/data/repo/top_rated_movies_repo.dart';
import 'package:movies/home/upcoming/data/api/upcoming_movies_api_service.dart';
import 'package:movies/home/upcoming/data/repo/upcoming_movies_repo.dart';
import 'package:movies/search/data/api/search_api_service.dart';
import 'package:movies/search/data/repo/search_repo.dart';
import 'package:movies/watch_later/data/api/watch_later_api_service.dart';
import 'package:movies/watch_later/data/repo/watch_later_repo.dart';

final getIt = GetIt.instance;
Future<void> setupGetIt() async {
  
 Dio dio = DioFactory.getDio();

   getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  getIt.registerLazySingleton<AppDatabase>(() => AppDatabase());

  getIt.registerLazySingleton<LocalAuthService>(() => LocalAuthService());

  getIt.registerLazySingleton<PopularMoviesApiService>(() => PopularMoviesApiService(dio));
  getIt.registerLazySingleton<PopularMoviesRepo>(() => PopularMoviesRepo(getIt<PopularMoviesApiService>()));

  getIt.registerLazySingleton<GenresApiService>(
    () => GenresApiService(dio)
  );

  getIt.registerLazySingleton<GenresRepo>(
    () => GenresRepo(getIt<GenresApiService>())
  );

  getIt.registerLazySingleton<UpcomingMoviesApiService>(() => UpcomingMoviesApiService(dio));
  getIt.registerLazySingleton<UpcomingMoviesRepo>(() => UpcomingMoviesRepo(getIt<UpcomingMoviesApiService>()));


  getIt.registerLazySingleton<TopRatedMoviesApiService>(() => TopRatedMoviesApiService(dio));
  getIt.registerLazySingleton<TopRatedMoviesRepo>(() => TopRatedMoviesRepo(getIt<TopRatedMoviesApiService>()));

  getIt.registerLazySingleton<SearchApiService>(() => SearchApiService(dio));
  getIt.registerLazySingleton<SearchRepo>(() => SearchRepo(getIt<SearchApiService>()));


  getIt.registerLazySingleton<WatchLaterApiService>(() => WatchLaterApiService(dio));
  getIt.registerLazySingleton<WatchLaterRepo>(() => WatchLaterRepo(getIt<WatchLaterApiService>(), getIt<AppDatabase>()));

}