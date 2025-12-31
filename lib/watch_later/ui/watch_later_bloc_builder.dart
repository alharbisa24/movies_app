import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:movies/core/helpers/locales/app_locale.dart';
import 'package:movies/core/helpers/spacing.dart';
import 'package:movies/core/theming/colors.dart';
import 'package:movies/watch_later/logic/cubit/watch_later_cubit.dart';
import 'package:movies/watch_later/ui/watch_later_shimmer_loading.dart';
import 'package:movies/watch_later/ui/watch_later_view.dart';

class WatchLaterBlocBuilder extends StatelessWidget {
  const WatchLaterBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WatchLaterCubit, WatchLaterState>(
      buildWhen: (previous, current) =>
          current is WatchLaterLoading ||
          current is WatchLaterSuccess ||
          current is WatchLaterFailure ||
          current is WatchLaterEmpty,
      builder: (context, state) {
        return state.maybeWhen(
          loading: () {
            return setupLoading();
          },
          success: (movies) {
            return setupSuccess(movies);
          },
          empty: () {
            return setupEmpty(context);
          },
          failure: (error) {
            return setupError(error);
          },
          orElse: () {
            return const SizedBox.shrink();
          },
        );
      },
    );
  }
}

Widget setupLoading() {
  return const WatchLaterShimmerLoading();
}

Widget setupSuccess(movies) {
  return WatchLaterView(
    moviesList: movies ?? [],
  );
}

Widget setupEmpty(context) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(32.w),
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.bookmark_border_rounded,
            size: 80.sp,
            color: AppColors.primaryColor,
          ),
        ),
        verticalSpace(24),
        Text(
          AppLocale.no_movies_title.getString(context),
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ), 
        verticalSpace(8),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 48.w),
          child: Text(
            AppLocale.no_movies_description.getString(context),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey.shade600,
              height: 1.5,
            ),
          ),
        ),
      ],
    ),
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
