import 'package:dio/dio.dart';
import 'package:disney/core/error/expceptin.dart';
import 'package:disney/core/network/api_error_model.dart';
import 'package:disney/core/utils/api_constans.dart';
import 'package:disney/feature/details/data/models/movie_cast_model.dart';
import 'package:disney/feature/details/data/models/movie_details_model.dart';
import 'package:disney/feature/movies/data/models/movie_model.dart';
import 'package:disney/feature/movies/domain/entities/movie.dart';

abstract class BaseMovieDetailsRemoteDatasorce {
  Future<MovieDetailsModel> getMovieDetails(int movieId);

  Future<List<MovieCastModel>> getMovieCast(int movieId);

  Future<List<Movie>> getSimilerMovies(int movieId);
}

class MovieDetailsRemoteDatasorce implements BaseMovieDetailsRemoteDatasorce {
  @override
  Future<MovieDetailsModel> getMovieDetails(int movieId) async {
    final response = await Dio().get(ApiConstans.movieDetails(movieId));
    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
          apiErrorModel: ApiErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieCastModel>> getMovieCast(int movieId) async {
    final response = await Dio().get(ApiConstans.movieCast(movieId));
    if (response.statusCode == 200) {
      return List<MovieCastModel>.from(
          response.data['cast'].map((e) => MovieCastModel.fromJson(e)));
    } else {
      throw ServerException(
          apiErrorModel: ApiErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<List<Movie>> getSimilerMovies(int movieId) async {
    final response = await Dio().get(ApiConstans.similerMovies(movieId));
    if (response.statusCode == 200) {
      return List<Movie>.from(
          response.data['results'].map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          apiErrorModel: ApiErrorModel.fromJson(response.data));
    }
  }
}
