import 'package:technical_test_asd/src/core/service/movie_local_service.dart';
import 'package:technical_test_asd/src/core/utils/injection.dart';
import 'package:technical_test_asd/src/modules/favorite/data/data_sources/local/abstract_favorite_local.dart';
import 'package:technical_test_asd/src/modules/favorite/data/data_sources/local/favorite_local_impl.dart';
import 'package:technical_test_asd/src/modules/favorite/data/repositories/favorite_repository_impl.dart';
import 'package:technical_test_asd/src/modules/favorite/domain/repositories/abstract_favorite_repository.dart';
import 'package:technical_test_asd/src/modules/favorite/domain/usecases/get_favorite_usecase.dart';
import 'package:technical_test_asd/src/modules/favorite/presentation/bloc/favorite_bloc.dart';
import 'package:technical_test_asd/src/shared/domain/usecase/delete_favorite_usecase.dart';

void initFavoriteInjections() {
  sl.registerSingleton<AbstractFavoriteLocal>(
      FavoriteLocalImpl(sl<MovieLocalService>()));
  sl.registerSingleton<AbstractFavoriteRepository>(
      FavoriteRepositoryImpl(sl<AbstractFavoriteLocal>()));
  sl.registerSingleton<GetFavoriteUseCase>(
      GetFavoriteUseCase(sl<AbstractFavoriteRepository>()));
  sl.registerFactory(
    () => FavoriteBloc(
      getMovieUsecase: sl<GetFavoriteUseCase>(),
      deleteFavoriteUseCase: sl<DeleteFavoriteUseCase>(),
    ),
  );
}
