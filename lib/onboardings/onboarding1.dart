import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/helpers/extensions.dart';
import 'package:movies/core/helpers/shared_prefs_helper.dart';
import 'package:movies/core/helpers/spacing.dart';
import 'package:movies/core/theming/text_styles.dart';
import 'package:movies/core/helpers/locales/app_locale.dart';
import 'package:movies/routing/routes.dart';
import 'package:movies/core/theming/colors.dart';
import 'package:flutter_localization/flutter_localization.dart';

class OnBoarding1Page extends StatefulWidget {
  const OnBoarding1Page({super.key});

  @override
  State<OnBoarding1Page> createState() => _OnBoarding1PageState();
}

class _OnBoarding1PageState extends State<OnBoarding1Page> {
  final FlutterLocalization _localization = FlutterLocalization.instance;


  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : Colors.black;
    final subtitleColor = isDark ? Colors.grey.shade400 : Colors.grey.shade600;
    final inactiveIndicator = isDark ? Colors.grey.shade700 : Colors.grey.shade300;

    return AdaptiveScaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.r),
                      child: Image.asset(
                        "assets/images/onboarding1.png",
                      ),
                    ),
                    verticalSpace(48),
                    Text(
                      AppLocale.onboarding1_title.getString(context),
                      style: AppTextStyles.heading2(color: textColor),
                      textAlign: TextAlign.center,
                    ),
                    verticalSpace(16),
                    Text(
                      AppLocale.onboarding1_description.getString(context),
                      style: AppTextStyles.body2(color: subtitleColor),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
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
                    onPressed: () async {
                          await SharedPrefHelper.setData('sawOnboarding', true);
                      context.pushNamed(Routes.onBoarding2);
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
                          color: AppColors.primaryColor,
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
                          color: inactiveIndicator,
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
