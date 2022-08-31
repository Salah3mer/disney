import 'package:dartz/dartz.dart';
import 'package:disney/core/error/failure.dart';
import 'package:disney/movies/domain/entities/movie.dart';
import 'package:disney/movies/domain/repositories/base_movies_repository.dart';

class GetNowPlayingMoviesUsecase {
  final BaseMoviesRepository baseMoviesRepository;
  GetNowPlayingMoviesUsecase(this.baseMoviesRepository);
  Future<Either<Failure, List<Movie>>> excute() async {
    return await baseMoviesRepository.getNowPlayingMovies();
  }
}
