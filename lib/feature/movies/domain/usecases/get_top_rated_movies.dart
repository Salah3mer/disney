import 'package:dartz/dartz.dart';
import 'package:disney/core/error/failure.dart';
import 'package:disney/feature/movies/domain/entities/movie.dart';
import 'package:disney/feature/movies/domain/repositories/base_movies_repository.dart';


class GetNowTopRatedMoviesUsecase {
  final BaseMoviesRepository baseMoviesRepository;

  GetNowTopRatedMoviesUsecase(this.baseMoviesRepository);

  Future<Either<Failure, List<Movie>>>excute() async {
    return await baseMoviesRepository.getTopRatedMovies();
  }
}
