import 'package:disney/feature/details/domain/entities/cast.dart';

class MovieCastModel extends Cast {
  const MovieCastModel(
      {required super.id, required super.name, required super.image});

  factory MovieCastModel.fromJson(Map<String, dynamic> json) =>
      MovieCastModel(
        id: json['id'],
        name: json['name'],
        image: json["profile_path"] ?? '',
      );

}
