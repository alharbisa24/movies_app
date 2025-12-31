import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movies/home/upcoming/logic/cubit/upcoming_movies_cubit.dart';
import 'package:movies/home/upcoming/ui/upcoming_movies_shimmer_loading.dart';
import 'package:movies/home/upcoming/ui/upcoming_movies_view.dart';

class UpcomingMoviesBlocBuilder extends StatelessWidget {
  const UpcomingMoviesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpcomingMoviesCubit, UpcomingMoviesState>(buildWhen: (previous, current) => 
    current is UpcomingMoviesLoading ||
    current is UpcomingMoviesSuccess || 
    current is UpcomingMoviesFailure,
    builder: (context, state) {

      return state.maybeWhen(
        loading: (){
          return setupLoading();
        },
        success: (upcomingMoviesList){
          return setupSuccess(upcomingMoviesList);
        },
        failure: (error){
          return setupError();
        },
        orElse: () {
          return const SizedBox.shrink();
        }
      );
  
    }
    );
    
    
  }
}

Widget setupLoading() {
  return const UpcomingMoviesShimmerLoading();
}

  Widget setupSuccess(moviesList) {
  return UpcomingMoviesView(
    moviesList: moviesList ?? [],
  );
}

  Widget setupError() {
    return const SizedBox.shrink();
  }