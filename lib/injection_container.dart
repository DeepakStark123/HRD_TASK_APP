import 'package:get_it/get_it.dart';
import 'features/splash/cubit/splash_cubit.dart';
import 'database/db_helper.dart';
import 'features/posts/service/post_service.dart';
import 'features/posts/cubit/post_cubit.dart';

final getIt = GetIt.instance;

void init() async{
  // Register DbHelper
  getIt.registerLazySingleton(() => DbHelper());

  // Register SplashCubit
  getIt.registerFactory(() => SplashCubit());

  // Register PostService
  getIt.registerLazySingleton(() => PostService(getIt<DbHelper>()));

  // Register PostCubit
  getIt.registerFactory(() => PostCubit(getIt<PostService>()));
}
