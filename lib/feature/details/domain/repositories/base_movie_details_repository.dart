import 'package:dartz/dartz.dart';
import 'package:disney/core/error/failure.dart';
import 'package:disney/feature/details/domain/entities/cast.dart';
import 'package:disney/feature/details/domain/entities/movie_details.dart';
import 'package:disney/feature/movies/domain/entities/movie.dart';

abstract class BaseMovieDetailsRepostory{
  Future<Either< Failure,MovieDetails>> getMovieDetails(int movieId);
  Future<Either< Failure,List<Cast>>> getCastDetails(int movieId);
  Future<Either< Failure,List<Movie>>> getSimilerMovies(int movieId);

}