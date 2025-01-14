import 'package:flutter/material.dart';
import 'injection_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrd_task_app/utils/constants/texts.dart';
import 'features/splash/cubit/splash_cubit.dart';
import 'features/posts/cubit/post_cubit.dart';
import 'utils/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SplashCubit>(
          create: (_) => getIt<SplashCubit>()..startSplash(),
        ),
        BlocProvider<PostCubit>(
          create: (_) => getIt<PostCubit>(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppTexts.appName,
        initialRoute: AppRoutes.splashScreen,
        onGenerateRoute: AppRoutes.onGenereateRoute,
      ),
    );
  }
}
