import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrd_task_app/features/splash/cubit/splash_cubit.dart';
import 'package:hrd_task_app/utils/constants/image_strings.dart';
import 'package:hrd_task_app/utils/constants/sizes.dart';
import 'package:hrd_task_app/utils/routes/app_routes.dart';

import '../cubit/splash_state.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is SplashFinished) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppRoutes.postScreen,
            (route) => false,
          );
        }
      },
      child: const Scaffold(
        body: Center(
          child: Image(
            image: AssetImage(AppImages.splashImage),
            fit: BoxFit.cover,
            height: AppSizes.imageCommonSize,
            width: AppSizes.imageCommonSize,
          ),
        ),
      ),
    );
  }
}
