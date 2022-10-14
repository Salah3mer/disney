import 'package:disney/feature/movies/domain/entities/movie.dart';
import 'package:equatable/equatable.dart';

abstract class PopularMoviesState extends Equatable {
  const PopularMoviesState();

  List<Object?> get props => [];
}

class MoviesInitialState extends PopularMoviesState {}

class GetPopularMoviesLoadingState extends PopularMoviesState {
  /* final List<Movie> oldList;

  const GetPopularMoviesLoadingState(this.oldList);*/

}

class GetPopularMoviesSuccessState extends PopularMoviesState {
  final List<Movie> popularMovies;

  const GetPopularMoviesSuccessState({required this.popularMovies});

  @override
  List<Object?> get props => [popularMovies];
}

class GetPopularMoviesErrorState extends PopularMoviesState {
  @override
  List<Object?> get props => [];
}
