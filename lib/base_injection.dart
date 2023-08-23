
import 'package:arabitac/core/services/local/cache_consumer.dart';
import 'package:arabitac/core/services/network/api_consumer.dart';
import 'package:arabitac/data/datasource/remote/dio/dio_client.dart';
import 'package:arabitac/data/datasource/remote/dio/logging_interceptor.dart';
import 'package:arabitac/features/auth_features/feature_data/repositoy/app_repository_imp.dart';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/auth_features/feature_domain/repositoy/app_repo.dart';


final getIt = GetIt.instance;

Future<void> init() async {
  /// Core
  getIt.registerLazySingleton(() => DioClient("", getIt(), loggingInterceptor: getIt(), cacheConsumer: getIt()));

  /// External
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);
  getIt.registerLazySingleton(() => Dio());
  getIt.registerLazySingleton(() => LoggingInterceptor());
  getIt.registerLazySingleton(() => const FlutterSecureStorage());
  getIt.registerLazySingleton(() => AppPrefs(secureStorage: getIt(), sharedPreferences: getIt()));
  //
  // getIt.registerLazySingleton<PrettyDioLogger>(() => PrettyDioLogger(requestHeader: true, requestBody: true, responseHeader: true));
  // getIt.registerLazySingleton(() => ApiConsumer(getIt<Dio>(), getIt<PrettyDioLogger>(), getIt()));

  getIt.registerLazySingleton<AppRepository>(() => AppRepositoryImp(networkClient: getIt()));
}
