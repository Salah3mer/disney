import 'package:disney/movies/domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel({
    required super.id,
    required super.backDropPath,
    required super.title,
    required super.overview,
    required super.genreIds,
    required super.voteAverage,
    required super.releaseDate,
  });

  factory MovieModel.fromJson(Map<String, dynamic>json)=>
      MovieModel(
        id: json['id'],
        backDropPath: json['backdrop_path'],
        title: json['title'],
        overview: json['overview'],
        genreIds: List<int>.from(json['genre_ids'].map((e) => e)) ,
        voteAverage: json['vote_average'],
        releaseDate: json['release_date'],);
}
