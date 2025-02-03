import 'package:get_it/get_it.dart';
import 'package:technical_test_asd/src/core/config/database/movie_database.dart';
import 'package:technical_test_asd/src/core/service/movie_local_service.dart';
import 'package:technical_test_asd/src/modules/detail/detail_injection.dart';
import 'package:technical_test_asd/src/modules/favorite/favorite_injection.dart';
import 'package:technical_test_asd/src/modules/home/home_injection.dart';
import 'package:technical_test_asd/src/shared/shared_injection.dart';

final sl = GetIt.instance;

Future<void> initInjections() async {
  sl.registerLazySingleton<MovieDatabase>(() => MovieDatabase());
  sl.registerLazySingleton<MovieLocalService>(
      () => MovieLocalService(sl<MovieDatabase>()));

  initSharedInjections();
  initHomeInjections();
  initFavoriteInjections();
  initDetailInjections();
}
