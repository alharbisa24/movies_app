import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:movies/core/helpers/app_lock_prefs.dart';
import 'package:provider/provider.dart';
import 'package:movies/core/helpers/spacing.dart';
import 'package:movies/core/theming/colors.dart';
import 'package:shimmer/shimmer.dart';
import 'package:movies/settings/logic/locale_controller.dart';
import 'package:movies/settings/logic/cubit/theme_cubit.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:movies/core/helpers/locales/app_locale.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isAppLocked = false;

  @override
  void initState() {
    super.initState();
    _loadAppLock();
  }
  Future<void> _loadAppLock() async {
    bool enabled = await AppLockPreferences.isEnabled();
    setState(() => _isAppLocked = enabled);
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF121212) : Colors.grey.shade50,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(isDark),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionTitle(AppLocale.preferences.getString(context), isDark),
                    verticalSpace(12),
                    _buildLanguageTile(isDark),
                    verticalSpace(12),
                    _buildThemeTile(isDark),
                    verticalSpace(24),
                    _buildSectionTitle(AppLocale.security.getString(context), isDark),
                    verticalSpace(12),
                    _buildSettingsCard([
                      _buildAppLockTile(isDark),
                    ], isDark),
                    verticalSpace(24),
                    _buildSectionTitle(AppLocale.about.getString(context), isDark),
                    verticalSpace(12),
                    _buildSettingsCard([
                      _buildVersionTile(isDark),
                    ], isDark),
                    verticalSpace(32),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(bool isDark) {
    return Padding(
      padding: EdgeInsets.all(24.w),
      child: Text(
        AppLocale.settings.getString(context),
        style: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.bold,
          color: isDark ? Colors.white : Colors.black,
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, bool isDark) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
          color: isDark ? Colors.grey.shade400 : Colors.grey.shade700,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildSettingsCard(List<Widget> children, bool isDark) {
    return Container(
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(children: children),
    );
  }

  Widget _buildLanguageTile(bool isDark) {
    final localeController = context.watch<LocaleController>();
    final selectedLanguage = localeController.getLanguageName();

    return Container(
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 2.h),
        leading: Icon(Icons.language_rounded, color: Colors.lightBlue, size: 20.sp),
        title: Text(
          AppLocale.language.getString(context),
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: isDark ? Colors.white : Colors.black87,
          ),
        ),
        subtitle: Text(
          selectedLanguage,
          style: TextStyle(fontSize: 12.sp, color: Colors.grey.shade600),
        ),
        trailing: Icon(Icons.chevron_right_rounded, color: Colors.grey.shade400, size: 24.sp),
        onTap: () => _showLanguageBottomSheet(isDark),
      ),
    );
  }

  Widget _buildThemeTile(bool isDark) {
    final themeCubit = context.watch<ThemeCubit>();
    final currentTheme = themeCubit.getThemeName();

    return Container(
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 2.h),
        leading: Icon(Icons.palette_rounded, color: Colors.purpleAccent, size: 20.sp),
        title: Text(
          AppLocale.theme.getString(context),
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: isDark ? Colors.white : Colors.black87,
          ),
        ),
        subtitle: Text(
          currentTheme,
          style: TextStyle(fontSize: 12.sp, color: Colors.grey.shade600),
        ),
        trailing: Icon(Icons.chevron_right_rounded, color: Colors.grey.shade400, size: 24.sp),
        onTap: () => _showThemeBottomSheet(isDark),
      ),
    );
  }

  Widget _buildAppLockTile(bool isDark) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Row(
        children: [
          Icon(Icons.lock_rounded, color: Colors.orange, size: 24.sp),
          horizontalSpace(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocale.app_lock.getString(context),
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    color: isDark ? Colors.white : Colors.black87,
                  ),
                ),
                verticalSpace(2),
                Text(
                  AppLocale.app_lock_description.getString(context),
                  style: TextStyle(fontSize: 10.sp, color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
          horizontalSpace(12),
          GestureDetector(
            onTap: () async {
    setState(() => _isAppLocked = !_isAppLocked);
    await AppLockPreferences.setEnabled(_isAppLocked);
    if (_isAppLocked) {
      _showAppLockDialog();
    }
  },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 51.w,
              height: 31.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: _isAppLocked ? AppColors.primaryColor : Colors.grey.shade300,
              ),
              child: AnimatedAlign(
                duration: const Duration(milliseconds: 200),
                alignment: _isAppLocked ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  width: 27.w,
                  height: 27.h,
                  margin: EdgeInsets.symmetric(horizontal: 2.w),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 4, offset: const Offset(0, 2)),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }



  Widget _buildVersionTile(bool isDark) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      leading: Container(
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
        child: Icon(Icons.info_rounded, color: Colors.grey.shade700, size: 24.sp),
      ),
      title: Text(AppLocale.version.getString(context), style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600, color: isDark ? Colors.white : Colors.black87)),
      subtitle: Text('1.0.0', style: TextStyle(fontSize: 13.sp, color: Colors.grey.shade600)),
    );
  }

  Widget _buildDivider() {
    return Divider(height: 1, thickness: 1, indent: 70.w, endIndent: 20.w, color: Colors.grey.shade200);
  }

  void _showLanguageBottomSheet(bool isDark) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (ctx) {
        return Container(
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(28), topRight: Radius.circular(28)),
          ),
          padding: EdgeInsets.symmetric(vertical: 24.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(width: 40.w, height: 4.h, decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(2))),
              verticalSpace(20),
              Text(AppLocale.select_language.getString(context), style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: AppColors.primaryColor)),
              verticalSpace(20),
              _buildLanguageOption(AppLocale.english.getString(context), 'en', isDark),
              _buildLanguageOption(AppLocale.arabic.getString(context), 'ar', isDark),
              verticalSpace(16),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLanguageOption(String title, String code, bool isDark) {
    final localeController = context.read<LocaleController>();
    bool isSelected = localeController.locale.languageCode == code;

    return InkWell(
      onTap: () {
        localeController.setLocale(code);
        Navigator.pop(context);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF2A2A2A) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: isSelected ? AppColors.primaryColor : Colors.grey.shade300, width: isSelected ? 2.5 : 1.5),
        ),
        child: Row(
          children: [
            Icon(Icons.flag_circle_rounded, color: isSelected ? AppColors.primaryColor : Colors.grey.shade500, size: 24.sp),
            horizontalSpace(12),
            Expanded(child: Text(title, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: isSelected ? AppColors.primaryColor : (isDark ? Colors.white : Colors.black87)))),
            SizedBox(
              width: 28,
              height: 28,
              child: isSelected
                  ? Lottie.network('https://lottie.host/e9adb247-90e8-4568-a2aa-6489a2bc633c/nkLaO6qlAC.json', repeat: false, width: 24.w, height: 24.h)
                  : Container(decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.grey.shade400, width: 2))),
            ),
          ],
        ),
      ),
    );
  }

  void _showThemeBottomSheet(bool isDark) {
    final themeCubit = context.read<ThemeCubit>();

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Container(
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(28), topRight: Radius.circular(28)),
              ),
              padding: EdgeInsets.all(15.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(width: 40.w, height: 4.h, decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(2))),
                  verticalSpace(10),
                  Text(AppLocale.theme.getString(context), style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: AppColors.primaryColor)),
                  verticalSpace(24),
                  Row(
                    children: [
                      Expanded(child: _buildModernThemeCard(AppLocale.light.getString(context), ThemeMode.light, themeCubit, setModalState, isDark).animate().fadeIn(duration: 600.ms).slideY(begin: 0.3, end: 0, duration: 400.ms)),
                      horizontalSpace(16),
                      Expanded(child: _buildModernThemeCard(AppLocale.dark.getString(context), ThemeMode.dark, themeCubit, setModalState, isDark).animate().fadeIn(duration: 600.ms).slideY(begin: 0.3, end: 0, duration: 400.ms)),
                    ],
                  ),
                  verticalSpace(24),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildModernThemeCard(String title, ThemeMode themeMode, ThemeCubit themeCubit, StateSetter setModalState, bool isDark) {
    final bool isSelected = themeCubit.state.themeMode == themeMode;

    return GestureDetector(
      onTap: () {
        themeCubit.setTheme(themeMode);
        setModalState(() {});
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: isSelected ? AppColors.primaryColor : Colors.grey.shade300, width: isSelected ? 2.5 : 1.5),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 28,
                  height: 28,
                  child: isSelected
                      ? Lottie.network('https://lottie.host/e9adb247-90e8-4568-a2aa-6489a2bc633c/nkLaO6qlAC.json', repeat: false, width: 24.w, height: 24.h)
                      : Container(decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.grey.shade400, width: 2))),
                ),
                horizontalSpace(10),
                Text(title, style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600, color: isSelected ? AppColors.primaryColor : (isDark ? Colors.white : Colors.black))),
              ],
            ),
            verticalSpace(10),
            Container(
              decoration: BoxDecoration(color: themeMode.toString() == 'ThemeMode.light' ? Colors.grey.shade200 : Colors.black, borderRadius: BorderRadius.circular(16)),
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(color: themeMode.toString() == 'ThemeMode.light' ? Colors.white : Colors.grey.shade800, borderRadius: BorderRadius.circular(16)),
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Shimmer.fromColors(baseColor: Colors.grey.shade300, highlightColor: Colors.white, child: Container(height: 13.h, width: 120.w, decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(6)))),
                    verticalSpace(8),
                    Shimmer.fromColors(baseColor: Colors.grey.shade300, highlightColor: Colors.white, child: Container(height: 13.h, width: 80.w, decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(6)))),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showAppLockDialog() {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.scale,
      title: AppLocale.app_lock_enabled.getString(context),
      desc: AppLocale.app_lock_enabled_desc.getString(context),
      btnOkText: AppLocale.got_it.getString(context),
      btnOkOnPress: () {},
      btnOkColor: AppColors.primaryColor,
    ).show();
  }
}
