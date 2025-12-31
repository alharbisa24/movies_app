import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/di/dependency_injection.dart';
import 'package:movies/core/helpers/spacing.dart';
import 'package:movies/core/theming/font_weights.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:movies/home/genres/repo/genres_repo.dart';
import 'package:movies/home/ui/home.dart';
import 'package:movies/core/helpers/locales/app_locale.dart';
import 'package:movies/settings/logic/locale_controller.dart';
import 'package:movies/settings/ui/settings_page.dart';
import 'package:movies/watch_later/data/repo/watch_later_repo.dart';
import 'package:movies/watch_later/logic/cubit/watch_later_cubit.dart';
import 'package:movies/watch_later/ui/watch_later_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  late final List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = [
      HomePageWidget(),
      BlocProvider(
        create: (_) => WatchLaterCubit(
          getIt<WatchLaterRepo>(),
        )..getWatchLaterMovies(),
        child: const WatchLaterPage(),
      ),
      SettingsPage(),
    ];
  }
  @override
  Widget build(BuildContext context) {
        final localeController = context.watch<LocaleController>();
    final selectedLanguage = localeController.getLanguageName();

    return AdaptiveScaffold(
      bottomNavigationBar: AdaptiveBottomNavigationBar(
    items: selectedLanguage == 'العربية'
            ? [
                AdaptiveNavigationDestination(
                  icon: 'gear',
                  label: AppLocale.settings_menu.getString(context),
                ),
                AdaptiveNavigationDestination(
                  icon: 'bookmark',
                  label: AppLocale.watchlater_menu.getString(context),
                ),
                AdaptiveNavigationDestination(
                  icon: 'house',
                  label: AppLocale.home_menu.getString(context),
                ),
              ]
            : [
                AdaptiveNavigationDestination(
                  icon: 'house',
                  label: AppLocale.home_menu.getString(context),
                ),
                AdaptiveNavigationDestination(
                  icon: 'bookmark',
                  label: AppLocale.watchlater_menu.getString(context),
                ),
                AdaptiveNavigationDestination(
                  icon: 'gear',
                  label: AppLocale.settings_menu.getString(context),
                ),
              ],
        selectedIndex: selectedLanguage == 'العربية'
            ? (2 - selectedIndex) 
            : selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = selectedLanguage == 'العربية' ? (2 - index) : index;
          });
        },
      ),
  
  
      body: pages[selectedIndex] 

    );
  }
}