part of 'top_rated_movies_cubit.dart';

abstract class TopRatedMoviesState extends Equatable {
  const TopRatedMoviesState();
}

class TopRatedMoviesInitial extends TopRatedMoviesState {
  @override
  List<Object> get props => [];
}

class GetTopRatedMoviesLoadingState extends TopRatedMoviesState {
  @override
  List<Object?> get props => [];
}

class GetTopRatedMoviesSuccessState extends TopRatedMoviesState {

  final List<Movie> topRatedMovies;

  const GetTopRatedMoviesSuccessState({required this.topRatedMovies});

  @override
  List<Object?> get props => [topRatedMovies];
}

class GetTopRatedMoviesErrorState extends TopRatedMoviesState {
  @override
  List<Object> get props => [];
}

class GetPopularMoviesLoadingState extends TopRatedMoviesState {
  @override
  List<Object?> get props => [];
}
