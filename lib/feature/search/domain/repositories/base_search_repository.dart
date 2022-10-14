import 'package:dartz/dartz.dart';
import 'package:disney/core/error/failure.dart';
import 'package:disney/feature/movies/domain/entities/movie.dart';

abstract class BaseSearchRepository{
  Future<Either<Failure,List<Movie>>>search(String name,int page);
}