import 'package:dartz/dartz.dart';
import 'package:disney/core/error/failure.dart';
import 'package:disney/feature/details/domain/entities/movie_details.dart';
import 'package:disney/feature/details/domain/repositories/base_movie_details_repository.dart';

class GetMovieDetailsUsecase{
  final BaseMovieDetailsRepostory baseMovieDetailsRepostory;

  GetMovieDetailsUsecase(this.baseMovieDetailsRepostory);
  Future<Either< Failure,MovieDetails>>  excute(int movieId) async{
  return await baseMovieDetailsRepostory.getMovieDetails(movieId);
  }
}