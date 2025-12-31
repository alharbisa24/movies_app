import 'dart:async';

import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/helpers/spacing.dart';
import 'package:movies/core/theming/colors.dart';
import 'package:movies/core/theming/font_weights.dart';
import 'package:movies/core/theming/text_styles.dart';
import 'package:movies/home/genres/models/genre.dart';
import 'package:movies/home/models/movie.dart';
import 'package:movies/home/toprated/logic/cubit/top_rated_movies_cubit.dart';
import 'package:movies/home/ui/movie_details/movie_page.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:movies/core/helpers/locales/app_locale.dart';

class TopRatedMoviesView extends StatefulWidget {
      final List<Movie?> moviesList;

  const TopRatedMoviesView({super.key, required this.moviesList});

  @override
  State<TopRatedMoviesView> createState() => _TopRatedMoviesViewState();
}

class _TopRatedMoviesViewState extends State<TopRatedMoviesView> {

  late PageController _controller;
  Timer? _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();

    _controller = PageController(viewportFraction: 0.5);

    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_controller.hasClients) {
        int next = _currentPage + 1;
        if (next == widget.moviesList.length) next = 0;

        _controller.animateToPage(
          next,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );

        _currentPage = next;
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
        final genresList = context.watch<TopRatedMoviesCubit>().genresList;
   final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : Colors.black;
    return AdaptiveScaffold(
      body:     Column(
         children: [
          Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Text(
      AppLocale.top_rated_movies.getString(context), style: AppTextStyles.heading4(color: textColor),
    ),


  ],
),
verticalSpace(
  15
),
       SizedBox(
            height: 300.h,
            child: PageView.builder(
              controller: _controller,
              itemCount: widget.moviesList.length,
              padEnds: false,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index) {
                _currentPage = index;
              },
              itemBuilder: (context, index) {
                final movie = widget.moviesList[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TopRatedMovieWidget(
                    context,
                    movie!,
                    genresList,

                    ),
                  );
            
              },
            ),
                 ),
        
  
         ]
      )

    );
  }
}



Widget TopRatedMovieWidget(BuildContext context, Movie movie, List<Genre> genresList){

final List<Genre> movieGenres = movie.genreIds
  ?.map((id) => genresList.firstWhere((g) => g.id == id))
  .toList() ?? [];
      final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : Colors.black;

   return GestureDetector(
  onTap: (){
showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withOpacity(0.5),
      isDismissible: true,
      enableDrag: true,
  builder: (context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => Navigator.pop(context),
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {},
            child: DraggableScrollableSheet(
              initialChildSize: 0.85,
              minChildSize: 0.4,
              maxChildSize: 0.95,
              builder: (context, scrollController) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(24),
                  ),
                  child: MovieDetailsPage(
                    movie: movie,
                  genres: movieGenres
                  
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  },
);

      
      },
   child:  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          "https://image.tmdb.org/t/p/w500/${movie.posterPath}",
          width: double.infinity,
          height: 220,         
          fit: BoxFit.cover,  
        ),
      ),

      SizedBox(height: 12),

      Text(
        movie.title,
        maxLines: 1,        
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 14.sp, 
          fontWeight: FontWeight.bold,
          color: textColor
        ),
      ),
    verticalSpace(6),

              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 14.sp,
                  ),
                  horizontalSpace(4),
                  Text(
                    movie.voteAverage.toString(),
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeights.medium,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
      SizedBox(height: 4),

           Wrap(
                spacing: 6,
                runSpacing: 4,
                children: movie.genreIds!.take(2).map((genreId) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                    decoration: BoxDecoration(
                      color: AppColors.badgesColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(99),
                    ),
                    child: Text(
                      genresList.firstWhere((genre) => genre.id == genreId).name,
                      style: TextStyle(
                        fontSize: 9.sp,
                        fontWeight: FontWeights.medium,
                        color: AppColors.badgesColor,
                      ),
                    ),
                  );
                }).toList(),
              ),
    ],
    )
    );
    
}