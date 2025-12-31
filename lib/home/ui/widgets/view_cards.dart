import 'dart:async';

import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/helpers/spacing.dart';
import 'package:movies/core/theming/colors.dart';
import 'package:movies/core/theming/font_weights.dart';
import 'package:movies/core/helpers/locales/app_locale.dart';
import 'package:movies/core/theming/text_styles.dart';

class ViewCards extends StatefulWidget {
  const ViewCards({super.key});

  @override
  State<ViewCards> createState() => _ViewCardsState();
}

class _ViewCardsState extends State<ViewCards> {
  final List<Map<String, String>> viewCards = [
    {"title": "Watch popular movies 1917", "description": "Lorem ipsum dolor sit amet, consectetur adipisci elit", "image": "assets/images/home_card_image.png"},
    {"title": "Watch popular movies Inception", "description": "Lorem ipsum dolor sit amet, consectetur adipisci elit", "image": "assets/images/home_card_image.png"},
    {"title": "Watch popular movies Interstellar", "description": "Lorem ipsum dolor sit amet, consectetur adipisci elit", "image": "assets/images/home_card_image.png"},
  ];

  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      Timer.periodic(const Duration(seconds: 3), (timer) {
        if (_controller.hasClients) {
          int next = _currentPage + 1;
          if (next == viewCards.length) next = 0;
          _controller.animateToPage(
            next,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        }
      });
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      body: Column(
        children: [
          SizedBox(
            height: 180.h,
            child: PageView.builder(
              controller: _controller,
              itemCount: viewCards.length,
              padEnds: false,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index) {
                setState(() => _currentPage = index);
              },
              itemBuilder: (context, index) {
                final card = viewCards[index];
                return Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 6
                  ),
                  child: viewCard(
                    card['title']!,
                    card['description']!,
                    card['image']!,
                    context,
                  ),
                );
              },
            ),
          ),
          verticalSpace(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              viewCards.length,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: _currentPage == index ? 30.w : 8.w,
                height: 8.h,
                margin: EdgeInsets.symmetric(horizontal: 4.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: _currentPage == index
                      ? AppColors.primaryColor
                      : Colors.grey.withOpacity(0.5),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget viewCard(String title, String description, String image, BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      color: AppColors.primaryColor,
      borderRadius: BorderRadius.circular(16.0),
    ),
    child: Stack(
      alignment: Alignment.center,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Image.asset(
            image,
            fit: BoxFit.cover,
            height: 230.h,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 10,
          child: Image.asset(
            "assets/images/linear_vector.png"
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              bottomLeft: Radius.circular(16.0),   
            ),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: 
              [
                AppColors.primaryColor,
                AppColors.primaryColor.withOpacity(0.9),
                AppColors.primaryColor.withOpacity(0.3),
                AppColors.primaryColor.withOpacity(0.1),
              ],
            )
          ),
        ),
        Positioned(
          left: 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppLocale.watch_popular_movies.getString(context), style: AppTextStyles.heading4(color: Colors.white),),
              verticalSpace(8),
              Text(AppLocale.card_description.getString(context), style:AppTextStyles.body4(color: Colors.grey.shade400),),
              verticalSpace(12),
              TextButton(
                onPressed: (){},
                child: Text(
                  AppLocale.watch_now.getString(context), 
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeights.semiBold,
                    color: AppColors.primaryColor,
                  )
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                ),
              )
            ],
          ),
        ),
      ],
    ),
  );
}