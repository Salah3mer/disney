import 'package:disney/feature/movies/domain/entities/movie.dart';
import 'package:disney/feature/movies/domain/usecases/get_popular_movies.dart';
import 'package:disney/feature/movies/presentation/cubit/popular_movie_cubit/movies_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class PopularMoviesCubit extends Cubit<PopularMoviesState> {
  final GetPopularMoviesUsecase getPopularMoviesUsecase;

  PopularMoviesCubit(
    this.getPopularMoviesUsecase,
  ) : super(MoviesInitialState());
  int page=1 ;
  List<Movie> allMovies =[];
  Future<void> getPopularMovies() async {
      emit(GetPopularMoviesLoadingState());

     await getPopularMoviesUsecase.excute(page:page).then((resulte) {
      page++;
      emit(resulte.fold(
              (failure) => GetPopularMoviesErrorState(),
              (movie) {
              allMovies.addAll(movie);
                return GetPopularMoviesSuccessState(popularMovies:movie);
              }));
    });

  }
}
