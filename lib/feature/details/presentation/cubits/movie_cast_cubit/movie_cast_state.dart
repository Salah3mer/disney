part of 'movie_cast_cubit.dart';

abstract class MovieCastState extends Equatable {
  const MovieCastState();
  @override
  List<Object> get props => [];
}

class MovieCastInitial extends MovieCastState {

}
class GetMovieCastLoadingState extends MovieCastState {}

class GetMovieCastSuccessState extends MovieCastState {
  final List<Cast> cast ;

  const GetMovieCastSuccessState(this.cast);

  @override
  List<Object> get props => [cast];
}

class GetMovieCastErrorState extends MovieCastState {}