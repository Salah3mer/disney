part of 'movies_cubit.dart';

 abstract class MoviesState extends Equatable {
  const MoviesState();
  List<Object?> get props =>[];


   }
class MoviesInitialState extends MoviesState {}

class GetNowPlayingMoviesLoadingState extends MoviesState {
  @override
  List<Object?> get props => [];
}

class GetNowPlayingMoviesSuccessState extends MoviesState {
  const GetNowPlayingMoviesSuccessState() ;
  @override
  List<Object?> get props => [];
}

class GetNowPlayingMoviesErrorState extends MoviesState {
  final String msg;

  const GetNowPlayingMoviesErrorState(this.msg);

  @override
  List<Object?> get props => [msg];
}

class GetTopRatedMoviesLoadingState extends MoviesState {
  @override
  List<Object?> get props => [];
}

class GetTopRatedMoviesSuccessState extends MoviesState {


  const GetTopRatedMoviesSuccessState( );
  @override
  List<Object?> get props => [];
}

class GetTopRatedMoviesErrorState extends MoviesState {
  final String msg;

  const GetTopRatedMoviesErrorState(this.msg);

  @override
  List<Object?> get props => [msg];
}

class GetPopularMoviesLoadingState extends MoviesState {
  @override
  List<Object?> get props => [];
}

class GetPopularMoviesSuccessState extends MoviesState {
  final List<Movie> movies;
  const GetPopularMoviesSuccessState(this.movies);

  @override
  List<Object?> get props => [movies];
}

class GetPopularMoviesErrorState extends MoviesState {
  final String msg;

  const GetPopularMoviesErrorState(this.msg);

  @override
  List<Object?> get props => [msg];
}



