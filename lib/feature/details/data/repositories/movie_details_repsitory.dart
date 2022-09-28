import 'package:dartz/dartz.dart';
import 'package:disney/core/error/expceptin.dart';
import 'package:disney/core/error/failure.dart';
import 'package:disney/feature/details/data/data_sources/movie_details_remote_datasorce.dart';
import 'package:disney/feature/details/domain/entities/movie_details.dart';
import 'package:disney/feature/details/domain/repositories/base_movie_details_repository.dart';

class MoveiDetailsRepsitory implements BaseMovieDetailsRepostory{
  final BaseMovieDetailsRemoteDatasorce baseMovieDetailsRemoteDatasorce;

  MoveiDetailsRepsitory(this.baseMovieDetailsRemoteDatasorce);
  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(int movieId) async{
    try{
      final resulte = await baseMovieDetailsRemoteDatasorce.getMovieDetails(movieId);
     return right(resulte);
   } on ServerException catch(Failure){
  return  Left(ServerFailure(Failure.apiErrorModel.statusMessage));
  }
  }
}