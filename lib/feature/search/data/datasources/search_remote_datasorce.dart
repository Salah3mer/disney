import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:disney/core/error/expceptin.dart';
import 'package:disney/core/error/failure.dart';
import 'package:disney/core/network/api_error_model.dart';
import 'package:disney/core/utils/api_constans.dart';
import 'package:disney/feature/movies/data/models/movie_model.dart';

abstract class BaseSearchRemoteDataSorce {
  Future<List<MovieModel>> search(String name);
}

class SearchRemoteDataSorce implements BaseSearchRemoteDataSorce {
  @override
  Future<List<MovieModel>> search(String name) async {
    final response = await Dio().get(ApiConstans.movieSearch(name));
    if (response.statusCode == 200) {
      return List.from(
          response.data['results'].map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          apiErrorModel: ApiErrorModel.fromJson(response.data));
    }
  }
}
