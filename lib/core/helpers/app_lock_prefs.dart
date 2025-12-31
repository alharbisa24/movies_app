import 'package:movies/core/helpers/shared_prefs_helper.dart';

class AppLockPreferences {
  static const String _appLockKey = 'app_lock_enabled';

  static Future<bool> isEnabled() async {
    return await SharedPrefHelper.getBool(_appLockKey);
  }

  static Future<void> setEnabled(bool enabled) async {
    await SharedPrefHelper.setData(_appLockKey, enabled);
  }
}