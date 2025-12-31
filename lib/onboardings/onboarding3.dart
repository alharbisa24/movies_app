import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/helpers/extensions.dart';
import 'package:movies/core/helpers/spacing.dart';
import 'package:movies/core/theming/text_styles.dart';
import 'package:movies/home/ui/home.dart';
import 'package:movies/core/helpers/locales/app_locale.dart';
import 'package:movies/routing/routes.dart';
import 'package:movies/core/theming/colors.dart';

class OnBoarding3Page extends StatefulWidget {
  const OnBoarding3Page({super.key});

  @override
  State<OnBoarding3Page> createState() => _OnBoarding3PageState();
}

class _OnBoarding3PageState extends State<OnBoarding3Page> {
  final FlutterLocalization _localization = FlutterLocalization.instance;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : Colors.black;
    final subtitleColor = isDark ? Colors.grey.shade400 : Colors.grey.shade600;
    final inactiveIndicator = isDark ? Colors.grey.shade700 : Colors.grey.shade300;
    final gradientColors = isDark 
        ? [Colors.grey.shade900, Colors.grey.shade900.withOpacity(0.8), Colors.grey.shade900.withOpacity(0.4)]
        : [Colors.white, Colors.white.withOpacity(0.8), Colors.white.withOpacity(0.4)];

    return AdaptiveScaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        top: 10.h,
                        child: ClipRRect(
                          child: Image.asset(
                            "assets/images/onboarding3.png",
                            fit: BoxFit.cover,
                            width: 340.w,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: gradientColors,
                          ),
                        ),
                      )
                    ],
                  ),
                  Positioned(
                    bottom: 20.h,
                    left: 24.w,
                    right: 24.w,
                    child: Column(
                      children: [
                        Text(
                          AppLocale.onboarding3_title.getString(context),
                          style: AppTextStyles.heading2(color: textColor),
                          textAlign: TextAlign.center,
                        ),
                        verticalSpace(12),
                        Text(
                          AppLocale.onboarding3_description.getString(context),
                          style: AppTextStyles.body2(color: subtitleColor),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AdaptiveButton(
                    useSmoothRectangleBorder: false,
                    color: AppColors.primaryColor,
                    minSize: Size(double.infinity, 52.h),
                    onPressed: () {
                      context.pushReplacementNamed(Routes.homeScreen);
                    },
                    label: AppLocale.continue_button.getString(context),
                  ),
                  verticalSpace(24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 24.w,
                        height: 6.h,
                        decoration: BoxDecoration(
                          color: inactiveIndicator,
                          borderRadius: BorderRadius.circular(2.r),
                        ),
                      ),
                      horizontalSpace(8),
                      Container(
                        width: 24.w,
                        height: 6.h,
                        decoration: BoxDecoration(
                          color: inactiveIndicator,
                          borderRadius: BorderRadius.circular(2.r),
                        ),
                      ),
                      horizontalSpace(8),
                      Container(
                        width: 24.w,
                        height: 6.h,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(2.r),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}