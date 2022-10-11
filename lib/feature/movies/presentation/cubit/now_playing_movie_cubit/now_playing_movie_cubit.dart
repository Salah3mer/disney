import 'package:bloc/bloc.dart';
import 'package:disney/feature/movies/domain/entities/movie.dart';
import 'package:disney/feature/movies/domain/usecases/get_now_playing_movies.dart';

import 'package:equatable/equatable.dart';

part 'now_playing_movie_state.dart';

class NowPlayingMovieCubit extends Cubit<NowPlayingMovieState> {
  final GetNowPlayingMoviesUsecase getNowPlayingMoviesUsecase;

  NowPlayingMovieCubit({required this.getNowPlayingMoviesUsecase})
      : super(NowPlayingMovieInitial());
  int page = 1;

  Future<void> getNowPlayingMovies() async {
    emit(GetNowPlayingMoviesLoadingState());
        await getNowPlayingMoviesUsecase.excute(page: page).then((resulte) {
      page++;
      emit(resulte.fold(
              (failure) => GetNowPlayingMoviesErrorState(failure.errorMassage),
              (movie) => GetNowPlayingMoviesSuccessState(nowPlayingMovies: movie)));
    });

  }

}
