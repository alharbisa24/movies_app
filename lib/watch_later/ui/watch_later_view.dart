import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/helpers/spacing.dart';
import 'package:movies/core/theming/colors.dart';
import 'package:movies/home/genres/models/genre.dart';
import 'package:movies/home/models/movie.dart';
import 'package:movies/home/ui/movie_details/movie_page.dart';
import 'package:movies/core/helpers/locales/app_locale.dart';
import 'package:movies/watch_later/logic/cubit/watch_later_cubit.dart';

class WatchLaterView extends StatelessWidget {
  final List<Movie> moviesList;

  const WatchLaterView({super.key, required this.moviesList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      itemCount: moviesList.length,
      itemBuilder: (context, index) {
        final movie = moviesList[index];
        return WatchLaterMovieCard(
          movie: movie,
        );
      },
    );
  }
}

class WatchLaterMovieCard extends StatelessWidget {
  final Movie movie;

  const WatchLaterMovieCard({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardColor = isDark ? Colors.grey.shade900 : Colors.white;
    final borderColor = isDark ? Colors.grey.shade700 : Colors.grey.shade300;
    final textColor = isDark ? Colors.white : Colors.black87;
    final subtitleColor = isDark ? Colors.grey.shade400 : Colors.grey.shade600;
    final descriptionColor = isDark ? Colors.grey.shade300 : Colors.grey.shade700;

    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: borderColor
        )
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => _showMovieDetails(context, movie),
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: EdgeInsets.all(12.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: 'movie_${movie.id}',
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                        width: 90.w,
                        height: 135.h,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          width: 90.w,
                          height: 135.h,
                          decoration: BoxDecoration(
                            color: isDark ? Colors.grey.shade800 : Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            Icons.movie,
                            color: subtitleColor,
                            size: 40.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                horizontalSpace(16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                          letterSpacing: -0.5,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      verticalSpace(8),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 4.h,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.amber.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.star_rounded,
                                  color: Colors.amber.shade700,
                                  size: 16.sp,
                                ),
                                horizontalSpace(4),
                                Text(
                                  movie.voteAverage.toStringAsFixed(1),
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.amber.shade900,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          horizontalSpace(8),
                          Icon(
                            Icons.calendar_today_rounded,
                            size: 14.sp,
                            color: subtitleColor,
                          ),
                          horizontalSpace(4),
                          Text(
                            movie.releaseDate ?? AppLocale.unknown.getString(context),
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: subtitleColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      verticalSpace(8),
                      Text(
                        movie.overview ?? AppLocale.no_description.getString(context),
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: descriptionColor,
                          height: 1.5,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                horizontalSpace(8),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        onPressed: () => _showRemoveDialog(context, movie),
                        icon: Icon(
                          Icons.bookmark,
                          color: AppColors.primaryColor,
                          size: 24.sp,
                        ),
                        padding: EdgeInsets.all(8.w),
                        constraints: BoxConstraints(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showRemoveDialog(BuildContext context, Movie movie) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.question,
      animType: AnimType.scale,
      title: AppLocale.remove_from_watch_later.getString(context),
      desc: AppLocale.remove_confirm_message.getString(context).replaceAll('%s', movie.title),
      btnCancelText: AppLocale.cancel.getString(context),
      btnOkText: AppLocale.remove.getString(context),
      btnCancelOnPress: () {},
      btnOkOnPress: () async {
        await context.read<WatchLaterCubit>().removeFromWatchLater(movie.id);
        
        AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          animType: AnimType.leftSlide,
          title: AppLocale.removed.getString(context),
          desc: AppLocale.removed_message.getString(context).replaceAll('%s', movie.title),
          autoHide: Duration(seconds: 2),
          onDismissCallback: (type) {},
        ).show();
      },
      btnCancelColor: Colors.grey.shade400,
      btnOkColor: AppColors.primaryColor,
    ).show();
  }

  void _showMovieDetails(BuildContext context, Movie movie) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final sheetBackgroundColor = isDark ? Colors.grey.shade900 : Colors.white;

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
          child: DraggableScrollableSheet(
            initialChildSize: 0.9,
            minChildSize: 0.5,
            maxChildSize: 0.95,
            builder: (context, scrollController) {
              return GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    color: sheetBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(28),
                      topRight: Radius.circular(28),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 20,
                        offset: Offset(0, -5),
                      ),
                    ],
                  ),
                  child: MovieDetailsPage(
                    movie: movie,
                    genres: movie.genreIds?.map((id) => Genre(id: id, name: '')).toList() ?? [],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
