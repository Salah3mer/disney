import 'package:disney/core/network/dio_helper.dart';

import 'package:disney/core/utils/api_constans.dart';
import 'package:disney/feature/movies/data/models/movie_model.dart';
import 'package:disney/feature/movies/data/models/genres_model.dart';

abstract class BaseMovieRemoteDataSorce {
  Future<List<MovieModel>> getNowPlayingMovies({required int page});

  Future<List<MovieModel>> getTopRatedMovies({required int page});

  Future<List<MovieModel>> getPopularMovies({required int page});

  Future<List<GenresModel>> getGenres();
}

class MovieRemoteDataSorce extends BaseMovieRemoteDataSorce {
  final DioHelper dioHelper;

  MovieRemoteDataSorce({required this.dioHelper});

  @override
  Future<List<MovieModel>> getNowPlayingMovies({required int page}) async {
    final response =
        await dioHelper.getData(url: ApiConstans.nowPlayingMovieUrl(page));

    return List<MovieModel>.from(
        (response.data['results'] as List).map((e) => MovieModel.fromJson(e)));
  }

  @override
  Future<List<MovieModel>> getPopularMovies({required int page}) async {
    final response =
        await dioHelper.getData(url: ApiConstans.popularMovieUrl(page));

    return List<MovieModel>.from(
        (response.data['results'] as List).map((e) => MovieModel.fromJson(e)));
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies({required int page}) async {
    final response =
        await dioHelper.getData(url: ApiConstans.topRatedMovieUrl(page));

    return List<MovieModel>.from(
        (response.data['results'] as List).map((e) => MovieModel.fromJson(e)));
  }

  @override
  Future<List<GenresModel>> getGenres() async {
    final response = await dioHelper.getData(url: ApiConstans.genresMovie);

    return List<GenresModel>.from(
        (response.data['genres'] as List).map((e) => GenresModel.fromJson(e)));
  }
}
