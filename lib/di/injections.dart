import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../shared_libraries/core/network/dio_handler.dart';
import '../shared_libraries/utils/setup/app_setup.dart';

final sl = GetIt.instance;

class Injections {
  Future<void> initialize() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sl.registerLazySingleton<Dio>(() => sl<DioHandler>().dio);
    sl.registerLazySingleton<DioHandler>(
      () => DioHandler(
        sharedPreferences: sharedPreferences,
        apiBaseUrl: Config.baseUrl,
      ),
    );
  }
}
