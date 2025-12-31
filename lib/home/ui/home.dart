import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/helpers/extensions.dart';
import 'package:movies/core/helpers/spacing.dart';
import 'package:movies/core/theming/text_styles.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:movies/home/popular/ui/popular_movies_bloc_builder.dart';
import 'package:movies/home/toprated/ui/top_rated_movies_bloc_builder.dart';
import 'package:movies/home/ui/widgets/view_cards.dart';
import 'package:movies/home/upcoming/ui/upcoming_movies_bloc_builder.dart';
import 'package:movies/core/helpers/locales/app_locale.dart';
import 'package:movies/routing/routes.dart';
import 'package:movies/search/ui/search_page.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : Colors.black;
    final subtitleColor = isDark ? Colors.grey.shade400 : Colors.grey;

    return AdaptiveScaffold(  
      body: SafeArea(
        child: 
      SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 24.0.w,
            vertical: 16.0.h
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text(AppLocale.welcome.getString(context), style: AppTextStyles.heading3(color: textColor),),
                    Text(AppLocale.lets_watch_movie.getString(context), style: AppTextStyles.body1(color: subtitleColor),)
                  ],),
                  Spacer(),
                 
                      GestureDetector(
                        onTap: (){
                context.pushNamed(Routes.searchScreen);
                        },
                        child: Container(
                          child: HugeIcon(
                            icon: HugeIcons.strokeRoundedSearch01,
                            size: 22.0.sp,
                            color: textColor,
                          ),
                        ),
                      ),

                ],
              ),
              verticalSpace(
                24
              ),

ViewCards(),
   


verticalSpace(
  24
),

UpcomingMoviesBlocBuilder(),

verticalSpace(
  24
),

TopRatedMoviesBlocBuilder(),

verticalSpace(
  24
),

PopularMoviesBlocBuilder(),
              


              
            ],
          ),
          
        ),
      )),

    );
  }
}