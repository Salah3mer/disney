part of 'now_playing_movie_cubit.dart';

abstract class NowPlayingMovieState extends Equatable {
  const NowPlayingMovieState();

  @override
  List<Object> get props => [];
}

class NowPlayingMovieInitial extends NowPlayingMovieState {
  @override
  List<Object> get props => [];
}

class GetNowPlayingMoviesLoadingState extends NowPlayingMovieState {
  @override
  List<Object> get props => [];
}

class GetNowPlayingMoviesSuccessState extends NowPlayingMovieState {
  final List<Movie> nowPlayingMovies;

  const GetNowPlayingMoviesSuccessState({required this.nowPlayingMovies});

  @override
  List<Object> get props => [nowPlayingMovies];
}

class GetNowPlayingMoviesErrorState extends NowPlayingMovieState {
  final String msg;

  const GetNowPlayingMoviesErrorState(this.msg);

  @override
  List<Object> get props => [msg];

}

class Changed extends NowPlayingMovieState {}