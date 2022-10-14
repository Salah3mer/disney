import 'package:disney/core/network/dio_helper.dart';
import 'package:disney/core/utils/api_constans.dart';
import 'package:disney/feature/movies/data/models/movie_model.dart';

abstract class BaseSearchRemoteDataSorce {
  Future<List<MovieModel>> search(String name, int page);
}

class SearchRemoteDataSorce implements BaseSearchRemoteDataSorce {
  final DioHelper dioHelper;

  SearchRemoteDataSorce({required this.dioHelper});

  @override
  Future<List<MovieModel>> search(String name, int page) async {
    final response =
        await dioHelper.getData(url: ApiConstans.movieSearch(name, page));
    return List.from(
        response.data['results'].map((e) => MovieModel.fromJson(e)));
  }
}
