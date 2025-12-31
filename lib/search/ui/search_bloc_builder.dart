import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/helpers/spacing.dart';
import 'package:movies/search/logic/cubit/search_cubit.dart';
import 'package:movies/search/ui/search_result.dart';
import 'package:movies/search/ui/search_shimmer_loader.dart';

class SearchBlocBuilder extends StatelessWidget {
  final Function(String)? onHistoryTap;

  const SearchBlocBuilder({super.key, this.onHistoryTap});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      buildWhen: (previous, current) =>
        current is SearchLoading ||
        current is SearchSuccess ||
        current is SearchFailure ||
        current is SearchLoadingMore,
      builder: (context, state) {
        return state.maybeWhen(
          loading: () {
            return setupLoading();
          },
          loadingMore: (moviesList) {
            return setupSuccess(moviesList, isLoadingMore: true);
          },
          success: (moviesList) {
            return setupSuccess(moviesList, isLoadingMore: false);
          },
          failure: (error) {
            return setupError(error);
          },
          orElse: () {
            return setupSuccess(const [], isLoadingMore: false);
          },
        );
      },
    );
  }

  Widget setupLoading() {
    return const SearchShimmerLoader();
  }

  Widget setupSuccess(dynamic moviesList, {required bool isLoadingMore}) {
    return SearchResult(
      moviesList: moviesList != null ? List.from(moviesList) : [],
      isLoadingMore: isLoadingMore,
      onHistoryTap: onHistoryTap,
    );
  }

  Widget setupError(error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 48.sp, color: Colors.red),
          verticalSpace(16),
          Text(
            'Error',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          verticalSpace(8),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Text(
              error.message ?? "Something went wrong",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey.shade700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

