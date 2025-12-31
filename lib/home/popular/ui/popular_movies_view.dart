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
import 'package:movies/home/popular/logic/cubit/popular_movies_cubit.dart';
import 'package:movies/home/ui/movie_details/movie_page.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:movies/core/helpers/locales/app_locale.dart';

class PopularMoviesViewPage extends StatefulWidget {
    final List<Movie?> moviesList;

  const PopularMoviesViewPage({super.key, required this.moviesList});

  @override
  State<PopularMoviesViewPage> createState() => _PopularMoviesViewPageState();
}

class _PopularMoviesViewPageState extends State<PopularMoviesViewPage> {

 


  @override
  Widget build(BuildContext context) {
    final genresList = context.watch<PopularMoviesCubit>().genresList;
   final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : Colors.black;
    return AdaptiveScaffold(
      body: 
       Column(
         children: [
          Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Text(
      AppLocale.popular_movies.getString(context), style: AppTextStyles.heading4(color: textColor),
    ),



  ],
),
verticalSpace(
  15
),
           SizedBox(
            height: 500.h,
            child: ListView.builder(
              itemCount: widget.moviesList.length,
              itemBuilder: (context, index) {
                final movie = widget.moviesList[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: recommendedMovie(
                    context,
                    movie!,
                    genresList,
                  ),
                );
              },
            ),
                 ),
         ],
       ),
    
  );
  }
}


Widget recommendedMovie(BuildContext context, Movie movie, List<Genre> genresList) {
   final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : Colors.black;

final List<Genre> movieGenres = movie.genreIds
  ?.map((id) => genresList.firstWhere((g) => g.id == id))
  .toList() ?? [];

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
  child:  Container(
    margin: EdgeInsets.only(bottom: 12),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
          "https://image.tmdb.org/t/p/w500/${movie.posterPath}",
          width: 90,
          height: 120,
          fit: BoxFit.cover,
              ),
            ),
            if (movie.adult)
          Positioned(
          top: 4,
          right: 4,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(99),
            ),
            child: Text(
              '18+',
              style: TextStyle(
                color: Colors.white,
                fontSize: 10.sp,
                fontWeight: FontWeights.bold,
              ),
            ),
          ),
              ),
          ],
        ),

        horizontalSpace(16),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movie.title, 
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeights.bold,
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

              verticalSpace(4),

              Wrap(
                spacing: 8,
                runSpacing: 4,
                children: movie.genreIds!.take(3).map((genreId) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.badgesColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(99),
                    ),
                    child: Text(
                      genresList.firstWhere((genre) => genre.id == genreId).name,
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeights.medium,
                        color: AppColors.badgesColor,
                      ),
                    ),
                  );
                }).toList(),
              ),

              Text(
                movie.overview ?? AppLocale.no_description.getString(context),
                maxLines: 2,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeights.regular,
                  color: Colors.grey[600]
                ),
              )
            ],
          ),
        ),
      ],
    ),
  
  ),
   );
}
