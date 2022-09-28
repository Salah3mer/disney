import 'package:equatable/equatable.dart';

class MovieDetails extends Equatable {
  final int id;
  final String backDropPath;
  final String title;
  final String overview;
  final dynamic genreIds;
  final dynamic voteAverage;
  final String releaseDate;
  final String status;
  final String poster;

  const MovieDetails({
    required this.id,
    required this.backDropPath,
    required this.title,
    required this.overview,
    required this.genreIds,
    required this.voteAverage,
    required this.releaseDate,
    required this.status,
    required this.poster,
  });

  @override
  List<Object> get props => [
        id,
        backDropPath,
        title,
        overview,
        genreIds,
        voteAverage,
        releaseDate,
        status,
        poster,
      ];
}
