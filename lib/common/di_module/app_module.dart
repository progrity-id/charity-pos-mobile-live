import 'package:charity_cashier/data/datasources/category_remote_data_source.dart';
import 'package:charity_cashier/data/datasources/product_remote_data_source.dart';
import 'package:charity_cashier/data/datasources/transaction_remote_data_source.dart';
import 'package:charity_cashier/data/repositories/auth_repository_impl.dart';
import 'package:charity_cashier/data/repositories/cart_repository.dart';
import 'package:charity_cashier/data/repositories/category_repository.dart';
import 'package:charity_cashier/data/repositories/product_repository.dart';
import 'package:charity_cashier/data/repositories/transaction_repository.dart';
import 'package:charity_cashier/domain/repositories/auth_repository.dart';
import 'package:charity_cashier/domain/usecases/check_auth_usecase.dart';
import 'package:charity_cashier/domain/usecases/post_login_usecase.dart';
import 'package:charity_cashier/presentation/cart/bloc/cart_bloc.dart';
import 'package:charity_cashier/presentation/dashboard/bloc/cart_home/cart_home_bloc.dart';
import 'package:charity_cashier/presentation/dashboard/bloc/dashboard_bloc.dart';
import 'package:charity_cashier/presentation/login/bloc/login_bloc.dart';
import 'package:charity_cashier/presentation/payment/bloc/payment_bloc.dart';
import 'package:charity_cashier/presentation/splashscreen/bloc/splashscreen_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/datasources/auth_remote_data_source.dart';
import '../../domain/usecases/get_user_usecase.dart';
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
  sl.registerLazySingleton<TransactionRemoteDataSource>(
      () => TransactionRemoteDataSource(sl()));

  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(sl(), sl(), sl()));
  sl.registerLazySingleton<CategoryRepository>(() => CategoryRepository(sl()));
  sl.registerLazySingleton<ProductRepository>(() => ProductRepository(sl()));
  sl.registerLazySingleton<CartRepository>(() => CartRepository());
  sl.registerLazySingleton<TransactionRepository>(
      () => TransactionRepository(sl()));

  sl.registerLazySingleton(() => PostLoginUseCase(sl()));
  sl.registerLazySingleton(() => CheckAuthUseCase(sl()));
  sl.registerLazySingleton(() => GetUserUseCase(sl()));

  ///Bloc DI
  sl.registerFactory(() => LoginBloc(sl()));
  sl.registerFactory(() => SplashscreenBloc(sl()));
  sl.registerFactory(() => DashboardBloc(sl(), sl(), sl(), sl()));
  sl.registerFactory(() => CartHomeBloc(sl()));
  sl.registerFactory(() => CartBloc(sl(), sl()));
  sl.registerFactory(() => PaymentBloc(sl(), sl(), sl()));
}
