import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:portfolio_frontend/core/datasources/portfolio_local_data_source.dart';
import 'package:portfolio_frontend/core/datasources/portfolio_remote_data_source.dart';
import 'package:portfolio_frontend/core/providers/page_index_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/providers/about_me_provider.dart';
import 'core/providers/contact_provider.dart';
import 'core/providers/project_provider.dart';
import 'core/providers/skillset_provider.dart';
import 'core/repositories/portfolio_repository.dart';

GetIt locator = GetIt.instance;

void setupLocator() async {
  // providers
  locator.registerFactory(() => AboutMeProvider(repository: locator()));
  locator.registerFactory(() => ContactProvider(repository: locator()));
  locator.registerFactory(() => ProjectProvider(repository: locator()));
  locator.registerFactory(() => SkillsetProvider(repository: locator()));
  locator.registerFactory(() => PageIndexProvider());

  // repositories
  locator.registerLazySingleton(() => PortfolioRepository(localDataSource: locator(), remoteDataSource: locator()));

  // data sources
  locator.registerLazySingleton(() => PortfolioLocalDataSource(sharedPreferences: locator()));
  locator.registerLazySingleton(() => PortfolioRemoteDataSource(dio: locator()));

  // external
  BaseOptions options = BaseOptions(
    baseUrl: 'https://sanjarbek17.uz/',
    // baseUrl: 'http://127.0.0.1:8000/',
    sendTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 5),
    // headers: {
    //   'Allow-Control-Allow-Origin': '*', // Required for CORS support to work
    //   'Allow-Control-Allow-Methods': 'GET, HEAD, POST, PUT, DELETE, OPTIONS',
    // }
  );
  locator.registerLazySingleton(() => Dio(options));
  // locator.registerLazySingleton(() => DataConnectionChecker());
  final sharedPreferences = await SharedPreferences.getInstance();
  locator.registerLazySingleton(() => sharedPreferences);
}
