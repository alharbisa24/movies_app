import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:movies/core/helpers/app_lock_prefs.dart';
import 'package:movies/core/helpers/shared_prefs_helper.dart';
import 'package:movies/settings/ui/lock_screen.dart';
import 'package:provider/provider.dart';
import 'package:movies/core/theming/app_theme.dart';
import 'package:movies/core/helpers/locales/app_locale.dart';
import 'package:movies/routing/app_router.dart';
import 'package:movies/routing/routes.dart';
import 'package:movies/settings/logic/locale_controller.dart';
import 'package:movies/settings/logic/cubit/theme_cubit.dart';
import 'package:movies/settings/logic/cubit/theme_state.dart';

class MoviesApp extends StatefulWidget {
  final AppRouter appRouter;

  const MoviesApp({super.key, required this.appRouter});

  @override
  State<MoviesApp> createState() => _MoviesAppState();
}

class _MoviesAppState extends State<MoviesApp> {
  final FlutterLocalization _localization = FlutterLocalization.instance;

  bool _isLoading = true;
  bool _showLock = false;
  bool _hasSeenOnboarding = false;

  @override
  void initState() {
    super.initState();
    _localization.init(
      mapLocales: AppLocale.LOCALES,
      initLanguageCode: 'en',
    );
    _init();
  }

  Future<void> _init() async {
    bool lockEnabled = await AppLockPreferences.isEnabled();
    bool sawOnboarding = await SharedPrefHelper.getBool('sawOnboarding');

    if (mounted) {
      setState(() {
        _showLock = lockEnabled;
        _hasSeenOnboarding = sawOnboarding;
        _isLoading = false;
      });
    }
  }

  void _unlock() {
    setState(() => _showLock = false);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocaleController()),
        BlocProvider(create: (_) => ThemeCubit()),
      ],
      child: Consumer<LocaleController>(
        builder: (context, localeController, _) {
          _localization.translate(localeController.locale.languageCode);

          return BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, themeState) {
              return ScreenUtilInit(
                designSize: const Size(375, 812),
                minTextAdapt: true,
                child: MaterialApp(
                  supportedLocales: _localization.supportedLocales,
                  localizationsDelegates: _localization.localizationsDelegates,
                  locale: localeController.locale,
                  title: 'Movies App',
                  theme: AppTheme.lightTheme,
                  darkTheme: AppTheme.darkTheme,
                  themeMode: themeState.themeMode,
                  debugShowCheckedModeBanner: false,
                  onGenerateRoute: widget.appRouter.generateRoute,
                  initialRoute: _hasSeenOnboarding ? Routes.homeScreen : Routes.onBoarding1,
                  builder: (context, child) {
                    if (_isLoading) {
                      return const Scaffold(
                        body: Center(child: CircularProgressIndicator()),
                      );
                    }

                    if (_showLock) {
                      return LockScreen(onAuthenticated: _unlock);
                    }

                    return child ?? const SizedBox();
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
