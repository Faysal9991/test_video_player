

import 'package:dio/dio.dart';
import 'package:flutter_test_2/data/dataSource/dio/dio_client.dart';
import 'package:flutter_test_2/data/dataSource/dio/logging_interceptor.dart';
import 'package:flutter_test_2/data/repository/video_repo.dart';
import 'package:flutter_test_2/provider/video_provider.dart';
import 'package:flutter_test_2/util/app_constant.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Core
  sl.registerLazySingleton(() => DioClient(AppConstant.baseUrl, sl(),
      sharedPreferences: sl(), loggingInterceptor: sl()));
  // Repository

  sl.registerLazySingleton(() =>VideoRepo(dioClient: sl(), sharedPreferences: sl()));
  
  // Provider
  sl.registerFactory(() => VideoProvider( videoRepo: sl()));
  

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());
}
