import 'package:charity_cashier/data/datasources/category_remote_data_source.dart';
import 'package:charity_cashier/data/datasources/product_remote_data_source.dart';
import 'package:charity_cashier/data/repositories/auth_repository_impl.dart';
import 'package:charity_cashier/data/repositories/category_repository.dart';
import 'package:charity_cashier/data/repositories/product_repository.dart';
import 'package:charity_cashier/domain/repositories/auth_repository.dart';
import 'package:charity_cashier/domain/usecases/check_auth_usecase.dart';
import 'package:charity_cashier/domain/usecases/post_login_usecase.dart';
import 'package:charity_cashier/presentation/dashboard/bloc/dashboard_bloc.dart';
import 'package:charity_cashier/presentation/login/bloc/login_bloc.dart';
import 'package:charity_cashier/presentation/splashscreen/bloc/splashscreen_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/datasources/auth_remote_data_source.dart';
import '../config/dio_config.dart';

final sl = GetIt.instance;

Future configureDependencies() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  sl.registerLazySingleton(
      () => createDio(baseUrl: "https://ws-charity-2024-live.progrity.id/"));

  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<CategoryRemoteDataSource>(
      () => CategoryRemoteDataSource(sl()));
  sl.registerLazySingleton<ProductRemoteDataSource>(
      () => ProductRemoteDataSource(sl()));

  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(sl(), sl(), sl()));
  sl.registerLazySingleton<CategoryRepository>(() => CategoryRepository(sl()));
  sl.registerLazySingleton<ProductRepository>(() => ProductRepository(sl()));

  sl.registerLazySingleton(() => PostLoginUseCase(sl()));
  sl.registerLazySingleton(() => CheckAuthUseCase(sl()));

  ///Bloc DI
  sl.registerFactory(() => LoginBloc(sl()));
  sl.registerFactory(() => SplashscreenBloc(sl()));
  sl.registerFactory(() => DashboardBloc(sl(), sl()));
}
