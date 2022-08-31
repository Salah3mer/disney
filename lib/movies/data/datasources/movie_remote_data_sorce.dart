import 'package:dio/dio.dart';
import 'package:disney/core/error/expceptin.dart';
import 'package:disney/core/network/api_error_model.dart';
import 'package:disney/core/utils/api_constans.dart';
import 'package:disney/movies/data/models/movie_model.dart';

abstract class BaseMovieRemoteDataSorce {
  Future<List<MovieModel>> getNowPlayingMovies();

  Future<List<MovieModel>> getTopRatedMovies();

  Future<List<MovieModel>> getPopularMovies();
}

class MovieRemoteDataSorce extends BaseMovieRemoteDataSorce {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(ApiConstans.nowPlayingMovieUrl);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));

    } else {
      throw ServerException(
          apiErrorModel: ApiErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(ApiConstans.popularMovieUrl);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));

    } else {
      throw ServerException(
          apiErrorModel: ApiErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(ApiConstans.topRatedMovieUrl);

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          apiErrorModel: ApiErrorModel.fromJson(response.data));
    }
  }
}
