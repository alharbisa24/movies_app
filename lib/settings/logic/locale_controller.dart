import 'package:flutter/material.dart';
import 'package:movies/core/helpers/shared_prefs_helper.dart';

class LocaleController extends ChangeNotifier {
  static const String _localeKey = 'app_locale';
  Locale _locale = const Locale('en');

  Locale get locale => _locale;

  LocaleController() {
    _loadLocale();
  }

  Future<void> _loadLocale() async {
    try {
      final code = await SharedPrefHelper.getString(_localeKey);
      _locale = Locale(code.isEmpty ? 'en' : code);
      notifyListeners();
    } catch (e) {
      _locale = const Locale('en');
    }
  }

  Future<void> setLocale(String languageCode) async {
    try {
      await SharedPrefHelper.setData(_localeKey, languageCode);
      _locale = Locale(languageCode);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  String getLanguageName() {
    return _locale.languageCode == 'en' ? 'English' : 'العربية';
  }
}
