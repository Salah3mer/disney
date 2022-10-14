import 'package:dio/dio.dart';
import 'package:disney/core/error/expceptin.dart';
import 'package:disney/core/network/api_error_model.dart';
import 'package:disney/core/network/dio_helper.dart';
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
  final DioHelper dioHelper;

  MovieDetailsRemoteDatasorce({required this.dioHelper});
  @override
  Future<MovieDetailsModel> getMovieDetails(int movieId) async {
    final response =
        await dioHelper.getData(url: ApiConstans.movieDetails(movieId));

    return MovieDetailsModel.fromJson(response.data);
  }

  @override
  Future<List<MovieCastModel>> getMovieCast(int movieId) async {
    final response =
        await dioHelper.getData(url: ApiConstans.movieCast(movieId));

    return List<MovieCastModel>.from(
        response.data['cast'].map((e) => MovieCastModel.fromJson(e)));
  }

  @override
  Future<List<Movie>> getSimilerMovies(int movieId) async {
    final response =
        await dioHelper.getData(url: ApiConstans.similerMovies(movieId));
    return List<Movie>.from(
        response.data['results'].map((e) => MovieModel.fromJson(e)));
  }
}
