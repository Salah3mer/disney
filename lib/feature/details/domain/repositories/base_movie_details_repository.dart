import 'package:dartz/dartz.dart';
import 'package:disney/core/error/failure.dart';
import 'package:disney/feature/details/domain/entities/movie_details.dart';

abstract class BaseMovieDetailsRepostory{
  Future<Either< Failure,MovieDetails>> getMovieDetails(int movieId);
}