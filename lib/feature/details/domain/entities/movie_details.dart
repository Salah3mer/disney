import 'package:disney/feature/movies/data/models/genres_model.dart';
import 'package:disney/feature/movies/domain/entities/genres.dart';
import 'package:equatable/equatable.dart';

class MovieDetails extends Equatable {
  final int id;
  final String backDropPath;
  final String title;
  final String overview;
  final List<Genres> genres;
  final dynamic voteAverage;
  final String releaseDate;
  final String status;
  final String poster;
  final int runtime;
  final int revenue;

  const MovieDetails({
    required this.id,
    required this.backDropPath,
    required this.title,
    required this.overview,
    required this.genres,
    required this.voteAverage,
    required this.releaseDate,
    required this.status,
    required this.poster,
    required this.runtime,
    required this.revenue,
  });

  @override
  List<Object> get props => [
        id,
        backDropPath,
        title,
        overview,
        genres,
        voteAverage,
        releaseDate,
        status,
        poster,
        runtime,
        revenue,
      ];
}
