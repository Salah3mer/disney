import 'package:dartz/dartz.dart';
import 'package:disney/core/error/failure.dart';
import 'package:disney/feature/movies/domain/entities/movie.dart';
import 'package:disney/feature/search/domain/repositories/base_search_repository.dart';

class GetSearchUsecase {
  final BaseSearchRepository baseSearchRepository;
  GetSearchUsecase(this.baseSearchRepository);
  Future<Either<Failure, List<Movie>>> excute(String name,int page) async {
    return await baseSearchRepository.search(name,page);
  }
}