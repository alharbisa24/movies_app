import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/home/popular/logic/cubit/popular_movies_cubit.dart';
import 'package:movies/home/popular/logic/cubit/popular_movies_state.dart';
import 'package:movies/home/popular/ui/popular_movies_shimmer_loading.dart';
import 'package:movies/home/popular/ui/popular_movies_view.dart';

class PopularMoviesBlocBuilder extends StatelessWidget {
  const PopularMoviesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularMoviesCubit, PopularMoviesState>(
      buildWhen: (previous, current) => 
    current is PopularMoviesLoading ||
    current is PopularMoviesSuccess || 
    current is PopularMoviesFailure,
    builder: (context, state) {

      return state.maybeWhen(
        loading: (){
          return setupLoading();
        },
        success: (popularMoviesList){
          return setupSuccess(popularMoviesList);
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
  return const PopularMoviesShimmerLoading();
}

  Widget setupSuccess(moviesList) {
  return PopularMoviesViewPage(
    moviesList: moviesList ?? [],
  );
}

  Widget setupError() {
    return const SizedBox.shrink();
  }