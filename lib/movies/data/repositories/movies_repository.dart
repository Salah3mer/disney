import 'package:dartz/dartz.dart';
import 'package:disney/core/error/expceptin.dart';
import 'package:disney/core/error/failure.dart';
import 'package:disney/movies/data/datasources/movie_remote_data_sorce.dart';
import 'package:disney/movies/domain/entities/movie.dart';
import 'package:disney/movies/domain/repositories/base_movies_repository.dart';
class MoviesRepository extends BaseMoviesRepository{
  final BaseMovieRemoteDataSorce baseMovieRemoteDataSorce;

  MoviesRepository(this.baseMovieRemoteDataSorce);
  @override

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies()  async {
    final resulte = await  baseMovieRemoteDataSorce.getPopularMovies();
    try{
      return Right(resulte);
    } on ServerException catch(Failure){
        return  Left(ServerFailure(Failure.apiErrorModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async{
   final  resulte = await baseMovieRemoteDataSorce.getTopRatedMovies();
   try{
     return Right(resulte);
   }on ServerException catch(Failure){
     return Left(ServerFailure(Failure.apiErrorModel.statusMessage));
   }
  }

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async{
    final resulte = await baseMovieRemoteDataSorce.getNowPlayingMovies();
    try{
      return Right(resulte);
    }on ServerException catch(Failure){
      return Left(ServerFailure(Failure.apiErrorModel.statusMessage));
    }

  }


}