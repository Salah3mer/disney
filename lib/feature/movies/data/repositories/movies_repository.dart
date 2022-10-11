import 'package:dartz/dartz.dart';
import 'package:disney/core/error/expceptin.dart';
import 'package:disney/core/error/failure.dart';
import 'package:disney/feature/movies/data/datasources/movie_remote_data_sorce.dart';
import 'package:disney/feature/movies/domain/entities/genres.dart';
import 'package:disney/feature/movies/domain/entities/movie.dart';
import 'package:disney/feature/movies/domain/repositories/base_movies_repository.dart';
class MoviesRepository extends BaseMoviesRepository{
  final BaseMovieRemoteDataSorce baseMovieRemoteDataSorce;

  MoviesRepository(this.baseMovieRemoteDataSorce);
  @override

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies({required int page})  async {
    final resulte = await  baseMovieRemoteDataSorce.getPopularMovies(page: page);
    try{
      return Right(resulte);
    } on ServerException catch(Failure){
        return  Left(ServerFailure(Failure.apiErrorModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies({required int page}) async{
   final  resulte = await baseMovieRemoteDataSorce.getTopRatedMovies(page: page);
   try{
     return Right(resulte);
   }on ServerException catch(Failure){
     return Left(ServerFailure(Failure.apiErrorModel.statusMessage));
   }
  }

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies({required int page}) async{
    final resulte = await baseMovieRemoteDataSorce.getNowPlayingMovies(page: page);
    try{
      return Right(resulte);
    }on ServerException catch(Failure){
      return Left(ServerFailure(Failure.apiErrorModel.statusMessage));
    }

  }

  @override
  Future<Either<Failure, List<Genres>>> getGenres() async{
  final resulte =await baseMovieRemoteDataSorce.getGenres();
  try{
   return Right(resulte);
  }on ServerException catch(Failure){
    return Left(ServerFailure(Failure.apiErrorModel.statusMessage));
  }
  }


}