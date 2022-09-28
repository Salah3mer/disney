import 'package:dartz/dartz.dart';
import 'package:disney/core/error/failure.dart';
import 'package:disney/feature/movies/domain/entities/genres.dart';
import 'package:disney/feature/movies/domain/entities/movie.dart';

abstract class BaseMoviesRepository{
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, List<Movie>>> getTopRatedMovies();
  Future<Either<Failure, List<Genres>>> getGenres();
}