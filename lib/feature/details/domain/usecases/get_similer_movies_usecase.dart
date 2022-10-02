import 'package:dartz/dartz.dart';
import 'package:disney/core/error/failure.dart';
import 'package:disney/feature/details/domain/repositories/base_movie_details_repository.dart';
import 'package:disney/feature/movies/domain/entities/movie.dart';

class GetSimilerMoviesUsecase{
  final BaseMovieDetailsRepostory baseMovieDetailsRepostory;

  GetSimilerMoviesUsecase(this.baseMovieDetailsRepostory);
  Future<Either< Failure,List<Movie>>>  excute(int movieId) async{
    return await baseMovieDetailsRepostory.getSimilerMovies(movieId);
  }
}