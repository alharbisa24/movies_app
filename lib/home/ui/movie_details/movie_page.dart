import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:movies/core/di/dependency_injection.dart';
import 'package:movies/core/helpers/spacing.dart';
import 'package:movies/core/theming/colors.dart';
import 'package:movies/core/theming/font_weights.dart';
import 'package:movies/database/app_database.dart';
import 'package:movies/home/genres/models/genre.dart';
import 'package:movies/home/models/movie.dart';
import 'package:movies/core/helpers/locales/app_locale.dart';

class MovieDetailsPage extends StatefulWidget {
  final Movie movie;
  final List<Genre> genres;
  const MovieDetailsPage({super.key, required this.movie, required this.genres});

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  @override
  Widget build(BuildContext context) {
      final theme = Theme.of(context);
  final isDark = theme.brightness == Brightness.dark;
      final textColor = isDark ? Colors.white : Colors.black;

     final db = getIt<AppDatabase>();

    return Scaffold(
backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
                child: Image.network(
                  "https://image.tmdb.org/t/p/w500/${widget.movie.posterPath}",
                  width: double.infinity,
                  height: 350.h,
                  fit: BoxFit.cover,
             errorBuilder: (context, error, stackTrace) => Container(
                width: 100.w,
                height: 350.h,
                color: Colors.grey.shade300,
                child: Icon(Icons.movie, color: Colors.grey),
              ),
              ),
              ),
            
          ),
 
          Positioned(
            top: 16,
            right: 16,
            child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: HugeIcon(
                icon: HugeIcons.strokeRoundedCancel01,
                color: Colors.white,
                size: 24.sp,
              ),
              style: IconButton.styleFrom(
                backgroundColor: Colors.black.withOpacity(0.5),
              ),
            ),
          ),

          Positioned(
            top: 250.h,
            left: 0,
            right: 0,
            bottom: 0,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                decoration: BoxDecoration(
color: theme.colorScheme.surface,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              widget.movie.title,
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeights.bold,
                              ),
                            ),
                          ),
                          StreamBuilder<List<WatchLaterData>>(
                            stream: db.watchWatchLaters(),
                            builder: (context, snapshot) {
                              final favorites = snapshot.data ?? [];
                              final isFavorite = favorites.any((fav) => fav.movieId == widget.movie.id.toString());
                              return InkWell(
                                onTap: () async {
                                  if (isFavorite) {
                                    await db.deleteWatchLater(widget.movie.id);
                                  } else {
                                    await db.addWatchLater(
                                      WatchLaterCompanion.insert(
                                        movieId: widget.movie.id.toString(), addedAt: DateTime.now(),
                                      ),
                                    );
                                  }
                                },
                                child: HugeIcon(
                                  icon: HugeIcons.strokeRoundedBookmark02,
                                  color: isFavorite ? Colors.blue : textColor,
                                  size: 24.sp,
                                ),
                              );
                            },
                          )
                        ],
                      ),
                      verticalSpace(8),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 14.sp,
                          ),
                          horizontalSpace(4),
                          Text(
                            widget.movie.voteAverage.toString(),
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeights.medium,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      verticalSpace(12),
                        Wrap(
                        spacing: 6,
                        runSpacing: 4,
                        children: (widget.movie.genreIds != null && widget.movie.genreIds!.isNotEmpty
                          ? widget.genres.where((genre) => widget.movie.genreIds!.contains(genre.id)).toList()
                          : widget.movie.genresList ?? [])
                          .map((genre) {
                          return Container(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            color: AppColors.badgesColor.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(99),
                          ),
                          child: Text(
                            genre.name,
                            style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeights.medium,
                            color: AppColors.badgesColor,
                            ),
                          ),
                          );
                        }).toList(),
                        ),
                      verticalSpace(12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppLocale.movie_details_language.getString(context),
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeights.regular,
                                  color: Color(0xFF9C9C9C),
                                ),
                              ),
                              Text(
                                widget.movie.originalLanguage,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeights.semiBold,
                                ),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppLocale.movie_details_release_date.getString(context),
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeights.regular,
                                  color: Color(0xFF9C9C9C),
                                ),
                              ),
                              Text(
                                widget.movie.releaseDate ?? "N/A",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeights.semiBold,
                                ),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppLocale.movie_details_is_adults.getString(context),
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeights.regular,
                                  color: Color(0xFF9C9C9C),
                                ),
                              ),
                              Text(
                                widget.movie.adult.toString(),
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeights.semiBold,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      verticalSpace(16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocale.movie_details_description.getString(context),
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeights.extraBold,
                              color: Color(0xFF9C9C9C),
                            ),
                          ),
                          verticalSpace(8),
                          Text(
                            widget.movie.overview ?? "No description available.",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeights.regular,
                              color: textColor,
                            ),
                          )
                        ],
                      ),
                      verticalSpace(16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppLocale.movie_details_cast.getString(context),
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeights.extraBold,
                                  color: Color(0xFF9C9C9C),
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Container(
                                  padding: EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color(0xFFAAA981),
                                      width: 0.5,
                                    ),
                                    borderRadius: BorderRadius.circular(99),
                                  ),
                                  child: Text(
                                    AppLocale.movie_details_see_more.getString(context),
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeights.regular,
                                      color: Color(0xFFAAA981),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          verticalSpace(12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _buildCastMember(),
                              _buildCastMember(),
                              _buildCastMember(),
                              _buildCastMember(),
                            ],
                          ),
                          verticalSpace(24),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCastMember() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            "assets/images/tom_holland.png",
            width: 70.w,
            height: 70.w,
            fit: BoxFit.cover,
          ),
        ),
        verticalSpace(6),
        Text(
          "Tom Holland",
          style: TextStyle(
            color: Color(0xFF110E47),
            fontSize: 11.sp,
            fontWeight: FontWeights.regular,
          ),
        )
      ],
    );
  }
}
