
import 'package:disney/feature/details/domain/entities/movie_details.dart';
import 'package:disney/feature/movies/data/models/genres_model.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel(
      {required super.id,
      required super.backDropPath,
      required super.title,
      required super.overview,
      required super.genreIds,
      required super.voteAverage,
      required super.releaseDate,
      required super.status,
      required super.poster});

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
          id: json['id'],
          backDropPath: json['backdrop_path'],
          title: json['title'],
          overview: json['overview'],
          genreIds:
              List.from(json['genres']).map((e) => GenresModel.fromJson(e)),
          voteAverage: json['vote_average'],
          releaseDate: json['release_date'],
          status: json['status'],
          poster: json['poster_path']);
}
