part of 'genres_cubit.dart';

abstract class GenresState extends Equatable {
  const GenresState();

  @override
  List<Object> get props => [];
}

class GenresInitial extends GenresState {
}

class GenresLoadingState extends GenresState {}

class GenresSuccessState extends GenresState {
  final List<Genres> genres;

  const GenresSuccessState({required this.genres});

  @override
  List<Object> get props => [genres];
}

class GenresErrorState extends GenresState {}

