import 'package:flutter/material.dart';
import 'package:hrd_task_app/features/posts/view/post_screen.dart';
import 'package:hrd_task_app/features/splash/view/splash_screen.dart';
import 'package:hrd_task_app/utils/constants/texts.dart';

class AppRoutes {
  static const String splashScreen = '/';
  static const String postScreen = '/postsScreen';

  static Route<dynamic> onGenereateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case postScreen:
        return MaterialPageRoute(builder: (context) => const PostScreen());
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text(AppTexts.noPageFound),
            ),
          ),
        );
    }
  }
}
