import 'package:technical_test_asd/src/core/service/movie_local_service.dart';
import 'package:technical_test_asd/src/core/utils/injection.dart';
import 'package:technical_test_asd/src/shared/data/data_sources/local/abstract_movies_local.dart';
import 'package:technical_test_asd/src/shared/data/data_sources/local/movies_local_impl.dart';
import 'package:technical_test_asd/src/shared/data/repositories/movies_repository_impl.dart';
import 'package:technical_test_asd/src/shared/domain/repositories/abstract_movies_repository.dart';
import 'package:technical_test_asd/src/shared/domain/usecase/delete_favorite_usecase.dart';

void initSharedInjections() {
  sl.registerSingleton<AbstractMoviesLocal>(MoviesLocalImpl(
    sl<MovieLocalService>(),
  ));
  sl.registerSingleton<AbstractMoviesRepository>(
      MoviesRepositoryImpl(sl<AbstractMoviesLocal>()));

  sl.registerSingleton<DeleteFavoriteUseCase>(
      DeleteFavoriteUseCase(sl<AbstractMoviesRepository>()));
}
