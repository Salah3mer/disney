import 'package:dartz/dartz.dart';
import 'package:disney/core/error/expceptin.dart';
import 'package:disney/core/error/failure.dart';
import 'package:disney/feature/movies/domain/entities/movie.dart';
import 'package:disney/feature/search/data/datasources/search_remote_datasorce.dart';
import 'package:disney/feature/search/domain/repositories/base_search_repository.dart';

class SearchRepositor implements BaseSearchRepository {
  final BaseSearchRemoteDataSorce baseSearchRemoteDataSorce;

  SearchRepositor({required this.baseSearchRemoteDataSorce});

  @override
  Future<Either<Failure, List<Movie>>> search(String name,int page) async {
    final resulte = await baseSearchRemoteDataSorce.search(name,page);
    try {
      return Right(resulte);
    } on ServerException catch (Failure) {
      return Left(ServerFailure());
    }
  }
}
