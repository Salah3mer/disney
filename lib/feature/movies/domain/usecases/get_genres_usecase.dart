import 'package:dartz/dartz.dart';
import 'package:disney/core/error/failure.dart';
import 'package:disney/feature/movies/domain/entities/genres.dart';
import 'package:disney/feature/movies/domain/repositories/base_movies_repository.dart';




class GetGenresUsecase {
  final BaseMoviesRepository baseMoviesRepository;
  GetGenresUsecase(this.baseMoviesRepository);
  Future<Either<Failure, List<Genres>>> excute() async {
    return await baseMoviesRepository.getGenres();
  }
}
