import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:lottie/lottie.dart';
import 'package:movies/core/helpers/spacing.dart';
import 'package:movies/core/theming/colors.dart';
import 'package:movies/core/theming/font_weights.dart';
import 'package:movies/home/genres/models/genre.dart';
import 'package:movies/home/models/movie.dart';
import 'package:movies/home/ui/movie_details/movie_page.dart';
import 'package:movies/core/helpers/locales/app_locale.dart';
import 'package:movies/search/logic/cubit/search_cubit.dart';

class SearchResult extends StatefulWidget {
  final List<Movie?> moviesList;
  final bool isLoadingMore;
  final Function(String)? onHistoryTap;

  const SearchResult({
    super.key,
    required this.moviesList,
    required this.isLoadingMore,
    this.onHistoryTap,
  });

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
      context.read<SearchCubit>().loadMoreResults();
    }
  }

  @override
  Widget build(BuildContext context) {
    final genresList = context.watch<SearchCubit>().genresList;
    final searchHistory = context.watch<SearchCubit>().searchHistory;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    if (widget.moviesList.isEmpty && !widget.isLoadingMore) {
      return SingleChildScrollView(
        child: Column(
          children: [
            _buildSearchHistory(searchHistory),
            verticalSpace(24),
            Lottie.network(
              'https://lottie.host/d4d17d05-fb83-41c5-8125-fbf1a805318d/LtXlXkuS65.json',
            ),
            Text(
              searchHistory.isEmpty ? AppLocale.search_page_text.getString(context) : AppLocale.search_not_found.getString(context),
              style: TextStyle(
                fontSize: 16.sp,
                color: isDark ? Colors.grey.shade400 : Colors.grey,
              ),
            ),
          ],
        ),
      );
    }

    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        if (searchHistory.isNotEmpty)
          SliverToBoxAdapter(
            child: Column(
              children: [
                _buildSearchHistory(searchHistory),
                verticalSpace(16),
              ],
            ),
          ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              if (index == widget.moviesList.length) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              final movie = widget.moviesList[index];
              if (movie == null) return const SizedBox.shrink();
              return MovieCard(
                movie: movie,
                genresList: genresList,
              );
            },
            childCount: widget.moviesList.length + (widget.isLoadingMore ? 1 : 0),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchHistory(searchHistory) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : Colors.black87;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppLocale.last_search.getString(context),
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: textColor,
              ),
            ),
            TextButton(
              onPressed: () async {
                await context.read<SearchCubit>().clearSearchHistory();
                setState(() {});
              },
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                minimumSize: Size(50.w, 30.h),
              ),
              child: Text(
                AppLocale.search_clear_all.getString(context),
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ],
        ),
        verticalSpace(12),
        Wrap(
          spacing: 8.w,
          runSpacing: 8.h,
          children: searchHistory.map<Widget>((historyItem) {
            return SearchHistoryChip(
              query: historyItem.query,
              onTap: () {
                if (widget.onHistoryTap != null) {
                  widget.onHistoryTap!(historyItem.query);
                }
              },
              onDelete: () async {
                await context.read<SearchCubit>().removeFromSearchHistory(historyItem.query);
                setState(() {});
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}

class SearchHistoryChip extends StatelessWidget {
  final String query;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const SearchHistoryChip({
    Key? key,
    required this.query,
    required this.onTap,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final borderColor = isDark ? Colors.grey.shade600 : Colors.grey.shade300;
    final iconColor = isDark ? Colors.grey.shade400 : Colors.grey.shade600;

    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: borderColor,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.search,
              size: 14.sp,
              color: AppColors.badgesColor,
            ),
            horizontalSpace(6),
            Text(
              query,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.badgesColor,
              ),
            ),
            horizontalSpace(6),
            InkWell(
              onTap: onDelete,
              child: Icon(
                Icons.close,
                size: 14.sp,
                color: iconColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MovieCard extends StatelessWidget {
  final Movie movie;
  final List<Genre> genresList;

  const MovieCard({
    super.key,
    required this.movie,
    required this.genresList,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardColor = isDark ? Colors.grey.shade900 : Colors.white;
    final borderColor = isDark ? Colors.grey.shade700 : Colors.grey.shade200;
    final textColor = isDark ? Colors.white : Colors.black87;
    final subtitleColor = isDark ? Colors.grey.shade400 : Colors.grey.shade600;
    final iconColor = isDark ? Colors.white : Colors.black;

    final List<Genre> movieGenres = movie.genreIds
        ?.map((id) => genresList.firstWhere((g) => g.id == id))
        .toList() ??
        [];

    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: borderColor,
          width: 1,
        ),
      ),
      child: InkWell(
        onTap: () {
          _showMovieDetails(context, movie, movieGenres);
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
              child: Image.network(
                'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                width: 100.w,
                height: 120.h,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: 100.w,
                  height: 120.h,
                  color: isDark ? Colors.grey.shade800 : Colors.grey.shade300,
                  child: Icon(Icons.movie, color: isDark ? Colors.grey.shade400 : Colors.grey),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: textColor,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    verticalSpace(6),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 16.sp),
                        horizontalSpace(4),
                        Text(
                          movie.voteAverage.toStringAsFixed(1),
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: textColor,
                          ),
                        ),
                        horizontalSpace(8),
                        Text(
                          '(${movie.voteAverage})',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: subtitleColor,
                          ),
                        ),
                      ],
                    ),
                    verticalSpace(6),
                    Wrap(
                      spacing: 6,
                      runSpacing: 4,
                      children: movieGenres.take(2).map((genre) {
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                          decoration: BoxDecoration(
                            color: AppColors.badgesColor.withAlpha(25),
                            borderRadius: BorderRadius.circular(99),
                          ),
                          child: Text(
                            genre.name,
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
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: HugeIcon(
                color: iconColor,
                icon: HugeIcons.strokeRoundedCircleArrowRight02,
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showMovieDetails(BuildContext context, Movie movie, List<Genre> movieGenres) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final sheetBackgroundColor = isDark ? Colors.grey.shade900 : Colors.white;
    final barrierColor = isDark ? Colors.black.withOpacity(0.8) : Colors.grey.withOpacity(0.8);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: barrierColor,
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
                        color: sheetBackgroundColor,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: MovieDetailsPage(
                        movie: movie,
                        genres: movieGenres,
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
  }
}
