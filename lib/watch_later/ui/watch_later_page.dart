import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/helpers/spacing.dart';
import 'package:movies/core/helpers/locales/app_locale.dart';
import 'package:movies/watch_later/ui/watch_later_bloc_builder.dart';

class WatchLaterPage extends StatefulWidget {
  const WatchLaterPage({super.key});

  @override
  State<WatchLaterPage> createState() => _WatchLaterPageState();
}

class _WatchLaterPageState extends State<WatchLaterPage> {
  @override
  Widget build(BuildContext context) {
       final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : Colors.black;
    
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(24.w),
              child: Text(
                AppLocale.watch_later.getString(context),
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
            ),
            verticalSpace(8),
            const Expanded(
              child: WatchLaterBlocBuilder(),
            ),
          ],
        ),
      ),
    );
  }
}