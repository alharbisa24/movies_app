import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/di/dependency_injection.dart';
import 'package:movies/core/helpers/locales/app_locale.dart';
import 'package:movies/core/services/local_auth_service.dart';
import 'package:movies/core/theming/colors.dart';

class LockScreen extends StatefulWidget {
  final VoidCallback onAuthenticated;

  const LockScreen({super.key, required this.onAuthenticated});

  @override
  State<LockScreen> createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> {
  final LocalAuthService _authService = getIt<LocalAuthService>();
  bool _isLoading = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), _authenticate);
  }

  Future<void> _authenticate() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
      _error = null;
    });

    bool success = await _authService.authenticate();

    if (!mounted) return;

    if (success) {
      widget.onAuthenticated();
    } else {
      setState(() {
        _isLoading = false;
        _error = AppLocale.auth_error.getString(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF121212) : Colors.grey.shade50,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(24.w),
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
                    Icons.lock_rounded,
                    size: 80.sp,
                    color: AppColors.primaryColor,
                  ),
                ),
                SizedBox(height: 32.h),
                Text(
                  AppLocale.auth_title.getString(context),
                  style: TextStyle(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  AppLocale.auth_description.getString(context),
                  style: TextStyle(fontSize: 16.sp, color: Colors.grey.shade600),
                  textAlign: TextAlign.center,
                ),
                if (_error != null) ...[
                  SizedBox(height: 24.h),
                  Text(
                    _error!,
                    style: TextStyle(fontSize: 14.sp, color: Colors.red),
                  ),
                ],
                SizedBox(height: 48.h),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: _isLoading ? null : _authenticate,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    icon: _isLoading
                        ? SizedBox(
                            width: 20.w,
                            height: 20.h,
                            child: const CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : Icon(Icons.fingerprint, size: 28.sp),
                    label: Text(
                      _isLoading
                          ? AppLocale.auth_button_process.getString(context)
                          : AppLocale.auth_button.getString(context),
                      style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}