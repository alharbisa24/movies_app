import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/di/dependency_injection.dart';
import 'package:movies/home/genres/repo/genres_repo.dart';
import 'package:movies/home/popular/logic/cubit/popular_movies_cubit.dart';
import 'package:movies/home/toprated/logic/cubit/top_rated_movies_cubit.dart';
import 'package:movies/home/upcoming/logic/cubit/upcoming_movies_cubit.dart';
import 'package:movies/mainpage/main.dart';
import 'package:movies/onboardings/onboarding1.dart';
import 'package:movies/onboardings/onboarding2.dart';
import 'package:movies/onboardings/onboarding3.dart';
import 'package:movies/routing/routes.dart';
import 'package:movies/search/logic/cubit/search_cubit.dart';
import 'package:movies/search/ui/search_page.dart';
import 'package:movies/settings/ui/settings_page.dart';
import 'package:movies/watch_later/data/repo/watch_later_repo.dart';
import 'package:movies/watch_later/logic/cubit/watch_later_cubit.dart';
import 'package:movies/watch_later/ui/watch_later_page.dart';

class AppRouter {

   Route generateRoute(RouteSettings settings){
    switch(settings.name){
      case Routes.onBoarding1:
      return MaterialPageRoute(builder: (context) => OnBoarding1Page());

      case Routes.onBoarding2:
      return MaterialPageRoute(builder: (context) => OnBoarding2Page());
    
      case Routes.onBoarding3:
      return MaterialPageRoute(builder: (context) => OnBoarding3Page());
    
      case Routes.homeScreen:
      return MaterialPageRoute(builder: (_) => MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PopularMoviesCubit(getIt(), getIt())..getPopularMovies(),
        ),
        BlocProvider(create: 
        (context) => UpcomingMoviesCubit(getIt(), getIt())..getUpcomingMovies()),
    
        BlocProvider(create: 
        (context) => TopRatedMoviesCubit(getIt(), getIt())..getTopRatedMovies(),
        )
    
      ],
      child: const HomePage(),
        ));

      case Routes.searchScreen:
      return MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => SearchCubit(getIt(), getIt(), getIt())..loadSearchHistory(),
          child: const SearchPage(),
        ),
      );

      case Routes.watchLater:
      return MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (_) => WatchLaterCubit(
            getIt<WatchLaterRepo>(),
          )..getWatchLaterMovies(),
          child: const WatchLaterPage(),
        ),
      );

      case Routes.settings:
      return MaterialPageRoute(builder: (context) => SettingsPage());

    default:
    return MaterialPageRoute(builder: (context) => Text('default'));
  
   }
   }

}