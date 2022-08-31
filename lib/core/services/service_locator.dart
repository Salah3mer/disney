
import 'package:disney/movies/data/datasources/movie_remote_data_sorce.dart';
import 'package:disney/movies/data/repositories/movies_repository.dart';
import 'package:disney/movies/domain/repositories/base_movies_repository.dart';
import 'package:disney/movies/domain/usecases/get_now_playing_movies.dart';
import 'package:disney/movies/domain/usecases/get_popular_movies.dart';
import 'package:disney/movies/domain/usecases/get_top_rated_movies.dart';
import 'package:disney/movies/presentation/cubit/movies_cubit.dart';

import 'package:get_it/get_it.dart';

final sl=GetIt.instance;

class ServiceLocator{
  void init() {
    ///bloc
    sl.registerFactory(() => MoviesCubit(sl(),sl(),sl()));
    ///UseCases
    sl.registerLazySingleton(() => GetNowPlayingMoviesUsecase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUsecase(sl()));
    sl.registerLazySingleton(() => GetNowTopRatedMoviesUsecase(sl()));
    ///Repository
    sl.registerLazySingleton<BaseMoviesRepository>(() => MoviesRepository(sl()));
    ///BaseRemoteDataSorse
    sl.registerLazySingleton<BaseMovieRemoteDataSorce>(() => MovieRemoteDataSorce());
  }



}