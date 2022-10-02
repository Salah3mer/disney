import 'package:dartz/dartz.dart';
import 'package:disney/core/error/failure.dart';
import 'package:disney/feature/details/domain/entities/cast.dart';
import 'package:disney/feature/details/domain/repositories/base_movie_details_repository.dart';

class GetMovieCastUseCase{
  final BaseMovieDetailsRepostory baseMovieDetailsRepostory;

  GetMovieCastUseCase(this.baseMovieDetailsRepostory);
  Future<Either< Failure,List<Cast>>>  excute(int movieId) async{
    return await baseMovieDetailsRepostory.getCastDetails(movieId);
  }
}