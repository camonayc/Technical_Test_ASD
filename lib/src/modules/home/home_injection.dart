import 'package:technical_test_asd/src/core/config/api/api_client.dart';
import 'package:technical_test_asd/src/core/service/movie_local_service.dart';
import 'package:technical_test_asd/src/core/utils/injection.dart';
import 'package:technical_test_asd/src/modules/home/data/data_sources/local/abstract_home_local.dart';
import 'package:technical_test_asd/src/modules/home/data/data_sources/local/home_local_impl.dart';
import 'package:technical_test_asd/src/modules/home/data/data_sources/remote/abstract_home_api.dart';
import 'package:technical_test_asd/src/modules/home/data/data_sources/remote/home_api_impl.dart';
import 'package:technical_test_asd/src/modules/home/data/repositories/home_repository_impl.dart';
import 'package:technical_test_asd/src/modules/home/domain/repositories/abstract_home_repository.dart';
import 'package:technical_test_asd/src/modules/home/domain/usecases/get_movie_usecase.dart';
import 'package:technical_test_asd/src/modules/home/domain/usecases/search_movie_usecase.dart';
import 'package:technical_test_asd/src/modules/home/presentation/bloc/home_bloc.dart';

void initHomeInjections() {
  sl.registerSingleton<AbstractHomeLocal>(
      HomeLocalImpl(sl<MovieLocalService>()));
  sl.registerSingleton<AbstractHomeApi>(HomeApiImpl(ApiClient()));
  sl.registerSingleton<AbstractHomeRepository>(
      HomeRepositoryImpl(sl<AbstractHomeApi>()));
  sl.registerSingleton<GetMovieUsecase>(
      GetMovieUsecase(sl<AbstractHomeRepository>()));
  sl.registerSingleton<SearchMovieUseCase>(
      SearchMovieUseCase(sl<AbstractHomeRepository>()));

  sl.registerFactory(
    () => HomeBloc(
      getMovieUsecase: sl<GetMovieUsecase>(),
      searchMoviesUseCase: sl<SearchMovieUseCase>(),
    ),
  );
}
