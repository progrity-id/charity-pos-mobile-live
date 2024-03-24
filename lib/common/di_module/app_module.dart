import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config/dio_config.dart';

final sl = GetIt.instance;

Future configureDependencies() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  sl.registerLazySingleton(
      () => createDio(baseUrl: "https://ws-charity-2024.progrity.id/"));
}
