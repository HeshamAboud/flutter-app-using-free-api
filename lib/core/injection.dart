import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:map_app/feture/posts_screen/bussiness_logic/posts_cubit.dart';
import '../feture/posts_screen/data/repository/repo_post.dart';
import 'app_interraptor.dart';
import 'network/web_services.dart';

final getIt = GetIt.instance;
void initGetIt() {
  getIt.registerLazySingleton<AppInterceptor>(() => AppInterceptor(dio: createAndSetupDio()));
  getIt.registerLazySingleton<PostsCubit>(() => PostsCubit(getIt()));
  getIt.registerLazySingleton<PostsRepository>(() => PostsRepository(getIt()));
  getIt.registerLazySingleton<AppWebServices>(() => AppWebServices(createAndSetupDio()));
}

  createAndSetupDio(){
  Dio dio = Dio();

  dio..options.connectTimeout = const Duration(seconds: 30)
    ..options.receiveTimeout = const Duration(seconds: 30) ;
  dio.interceptors.add(AppInterceptor(dio: dio));
  dio.interceptors.add(LogInterceptor(
    responseBody: true,
    error: true,
    requestHeader: false,
    responseHeader: true,
    request : true,
    requestBody : true,
  ));
  return dio;
}