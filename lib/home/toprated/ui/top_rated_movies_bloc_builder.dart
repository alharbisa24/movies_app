import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/home/toprated/logic/cubit/top_rated_movies_cubit.dart';
import 'package:movies/home/toprated/ui/top_rated_movies_shimmer_loading.dart';
import 'package:movies/home/toprated/ui/top_rated_movies_view.dart';

import 'package:movies/home/upcoming/logic/cubit/upcoming_movies_cubit.dart';
import 'package:movies/home/upcoming/ui/upcoming_movies_shimmer_loading.dart';
import 'package:movies/home/upcoming/ui/upcoming_movies_view.dart';

class TopRatedMoviesBlocBuilder extends StatelessWidget {
  const TopRatedMoviesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopRatedMoviesCubit, TopRatedMoviesState>(buildWhen: (previous, current) => 
    current is TopRatedMoviesLoading ||
    current is TopRatedMoviesSuccess || 
    current is TopRatedMoviesFailure,
    builder: (context, state) {

      return state.maybeWhen(
        loading: (){
          return setupLoading();
        },
        success: (TopRatedMoviesList){
          return setupSuccess(TopRatedMoviesList);
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
  return const TopRatedMoviesShimmerLoading();
}

  Widget setupSuccess(moviesList) {
  return TopRatedMoviesView(
    moviesList: moviesList ?? [],
  );
}

  Widget setupError() {
    return const SizedBox.shrink();
  }