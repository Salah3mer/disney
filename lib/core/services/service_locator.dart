
import 'package:dio/dio.dart';
import 'package:disney/core/network/dio_helper.dart';
import 'package:disney/feature/details/data/data_sources/movie_details_remote_datasorce.dart';
import 'package:disney/feature/details/data/repositories/movie_details_repsitory.dart';
import 'package:disney/feature/details/domain/repositories/base_movie_details_repository.dart';
import 'package:disney/feature/details/domain/usecases/get_movie_cast_usecase.dart';
import 'package:disney/feature/details/domain/usecases/get_movie_details_usecase.dart';
import 'package:disney/feature/details/domain/usecases/get_similer_movies_usecase.dart';
import 'package:disney/feature/details/presentation/cubits/movie_cast_cubit/movie_cast_cubit.dart';
import 'package:disney/feature/details/presentation/cubits/movie_details_cubit/movie_details_cubit.dart';
import 'package:disney/feature/details/presentation/cubits/similer_movies_cubit/similer_movies_cubit.dart';
import 'package:disney/feature/movies/presentation/cubit/popular_movie_cubit/movies_cubit.dart';
import 'package:disney/feature/movies/data/datasources/movie_remote_data_sorce.dart';
import 'package:disney/feature/movies/data/repositories/movies_repository.dart';
import 'package:disney/feature/movies/domain/repositories/base_movies_repository.dart';
import 'package:disney/feature/movies/domain/usecases/get_genres_usecase.dart';
import 'package:disney/feature/movies/domain/usecases/get_now_playing_movies.dart';
import 'package:disney/feature/movies/domain/usecases/get_popular_movies.dart';
import 'package:disney/feature/movies/domain/usecases/get_top_rated_movies.dart';
import 'package:disney/feature/movies/presentation/cubit/genres_cubit/genres_cubit.dart';
import 'package:disney/feature/movies/presentation/cubit/now_playing_movie_cubit/now_playing_movie_cubit.dart';
import 'package:disney/feature/movies/presentation/cubit/top_rated_movies_cubit/top_rated_movies_cubit.dart';
import 'package:disney/feature/search/data/datasources/search_remote_datasorce.dart';
import 'package:disney/feature/search/data/repositories/search_repository.dart';
import 'package:disney/feature/search/domain/repositories/base_search_repository.dart';
import 'package:disney/feature/search/domain/usecases/search_usecase.dart';
import 'package:disney/feature/search/presentation/cubits/search_cubit/search_cubit.dart';

import 'package:get_it/get_it.dart';

final sl=GetIt.instance;

class ServiceLocator{
  void init() {
    ///bloc
    sl.registerFactory(() => PopularMoviesCubit(sl(),));
    sl.registerFactory(() => TopRatedMoviesCubit(getNowTopRatedMoviesUsecase: sl()));
    sl.registerFactory(() => NowPlayingMovieCubit(getNowPlayingMoviesUsecase: sl()));
    sl.registerFactory(() => GenresCubit(genresUsecase: sl() ));
    sl.registerFactory(() => MovieDetailsCubit(getMovieDetailsUsecase: sl() ));
    sl.registerFactory(() => MovieCastCubit(getMovieCastUseCase:  sl() ));
    sl.registerFactory(() => SimilerMoviesCubit(  getSimilerMoviesUsecase: sl() ));
    sl.registerFactory(() => SearchCubit(  getSearchUsecase: sl() ));
    ///UseCases
    sl.registerLazySingleton(() => GetNowPlayingMoviesUsecase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUsecase(sl()));
    sl.registerLazySingleton(() => GetNowTopRatedMoviesUsecase(sl()));
    sl.registerLazySingleton(() => GetGenresUsecase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUsecase(sl()));
    sl.registerLazySingleton(() => GetMovieCastUseCase(sl()));
    sl.registerLazySingleton(() => GetSimilerMoviesUsecase(sl()));
    sl.registerLazySingleton(() => GetSearchUsecase(sl()));
    ///Repository
    sl.registerLazySingleton<BaseMoviesRepository>(() => MoviesRepository(sl()));
    sl.registerLazySingleton<BaseMovieDetailsRepostory>(() => MoveiDetailsRepsitory(sl()));
    sl.registerLazySingleton<BaseSearchRepository>(() => SearchRepositor(baseSearchRemoteDataSorce: sl()));
    ///BaseRemoteDataSorse
    sl.registerLazySingleton<BaseMovieRemoteDataSorce>(() => MovieRemoteDataSorce(dioHelper: sl()));
    sl.registerLazySingleton<BaseMovieDetailsRemoteDatasorce>(() => MovieDetailsRemoteDatasorce(dioHelper: sl()));
    sl.registerLazySingleton<BaseSearchRemoteDataSorce>(() => SearchRemoteDataSorce(dioHelper: sl()));
    ///core
    sl.registerLazySingleton(() => DioHelper(dio: sl()));
    ///extirnal
    sl.registerLazySingleton(() => Dio());

    sl.registerLazySingleton(() =>
        LogInterceptor(responseBody: true, error: true),);
  }



}