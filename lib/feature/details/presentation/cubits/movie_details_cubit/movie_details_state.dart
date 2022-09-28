part of 'movie_details_cubit.dart';

abstract class MovieDetailsState extends Equatable {
  const MovieDetailsState();

  @override
  List<Object> get props => [];
}

class MovieDetailsInitial extends MovieDetailsState {
}

class GetMovieDetailsLoadingState extends MovieDetailsState {}

class GetMovieDetailsSuccessState extends MovieDetailsState {
  final MovieDetails movieDetails;

  const GetMovieDetailsSuccessState(this.movieDetails);

  @override
  List<Object> get props => [movieDetails];
}

class GetMovieDetailsErrorState extends MovieDetailsState {}
