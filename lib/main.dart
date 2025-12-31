import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/di/dependency_injection.dart';
import 'package:movies/movies_app.dart';
import 'package:movies/routing/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await dotenv.load(fileName: ".env");
  await FlutterLocalization.instance.ensureInitialized();
  setupGetIt();

  runApp(MoviesApp(appRouter: AppRouter()));
}


