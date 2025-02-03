import 'package:technical_test_asd/src/core/config/api/api_client.dart';
import 'package:technical_test_asd/src/core/service/movie_local_service.dart';
import 'package:technical_test_asd/src/core/utils/injection.dart';
import 'package:technical_test_asd/src/modules/detail/data/data_sources/local/abstract_detail_local.dart';
import 'package:technical_test_asd/src/modules/detail/data/data_sources/local/detail_local_impl.dart';
import 'package:technical_test_asd/src/modules/detail/data/data_sources/remote/abstract_detail_api.dart';
import 'package:technical_test_asd/src/modules/detail/data/data_sources/remote/detail_api_impl.dart';
import 'package:technical_test_asd/src/modules/detail/data/repositories/detail_repository_impl.dart';
import 'package:technical_test_asd/src/modules/detail/domain/repositories/abstract_detail_repository.dart';
import 'package:technical_test_asd/src/modules/detail/domain/usecases/get_movie_detail_usecase.dart';
import 'package:technical_test_asd/src/modules/detail/domain/usecases/is_favorite_usecase.dart';
import 'package:technical_test_asd/src/modules/detail/domain/usecases/save_movie_usecase.dart';
import 'package:technical_test_asd/src/modules/detail/presentation/bloc/detail_bloc.dart';
import 'package:technical_test_asd/src/shared/domain/usecase/delete_favorite_usecase.dart';

void initDetailInjections() {
  sl.registerSingleton<AbstractDetailLocal>(
    DetailLocalImpl(sl<MovieLocalService>()),
  );
  sl.registerSingleton<AbstractDetailApi>(
    DetailApiImpl(ApiClient()),
  );
  sl.registerSingleton<AbstractDetailRepository>(
    DetailRepositoryImpl(
      sl<AbstractDetailApi>(),
      sl<AbstractDetailLocal>(),
    ),
  );
  sl.registerSingleton<GetMovieDetailUseCase>(
    GetMovieDetailUseCase(sl<AbstractDetailRepository>()),
  );
  sl.registerSingleton<SaveMovieUseCase>(
    SaveMovieUseCase(sl<AbstractDetailRepository>()),
  );

  sl.registerFactory<IsFavoriteUseCase>(
    () => IsFavoriteUseCase(sl<AbstractDetailRepository>()),
  );

  sl.registerFactory<DetailBloc>(
    () => DetailBloc(
      getMovieDetailUseCase: sl<GetMovieDetailUseCase>(),
      saveMovieUseCase: sl<SaveMovieUseCase>(),
      deleteFavoriteUseCase: sl<DeleteFavoriteUseCase>(),
      isFavoriteUseCase: sl<IsFavoriteUseCase>(),
    ),
  );
}
