part of 'similer_movies_cubit.dart';


abstract class SimilerMoviesState extends Equatable {
  const SimilerMoviesState();
  @override
  List<Object> get props => [];
}

class SimilerMoviesInitial extends SimilerMoviesState {

}
class GetSimilerMoviesLoadingState extends SimilerMoviesState  {}

class GetSimilerMoviesSuccessState extends SimilerMoviesState  {
  final List<Movie> similerMovies ;

  const GetSimilerMoviesSuccessState(this.similerMovies);

  @override
  List<Object> get props => [similerMovies];
}

class GetSimilerMoviesErrorState extends SimilerMoviesState  {}
