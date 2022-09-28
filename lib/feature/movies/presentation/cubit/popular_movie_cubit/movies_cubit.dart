import 'package:disney/feature/movies/domain/usecases/get_popular_movies.dart';
import 'package:disney/feature/movies/presentation/cubit/popular_movie_cubit/movies_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class PopularMoviesCubit extends Cubit<PopularMoviesState> {
  final GetPopularMoviesUsecase getPopularMoviesUsecase;

  PopularMoviesCubit(
    this.getPopularMoviesUsecase,
  ) : super(MoviesInitialState());

  Future<void> getPopularMovies() async {
    emit(GetPopularMoviesLoadingState());
    final resulte = await getPopularMoviesUsecase.excute();
    emit(resulte.fold(
        (failure) => GetPopularMoviesErrorState(failure.errorMassage),
        (movie) => GetPopularMoviesSuccessState(popularMovies: movie)));
  }
}
