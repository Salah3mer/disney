import 'package:bloc/bloc.dart';
import 'package:disney/feature/movies/domain/entities/movie.dart';
import 'package:disney/feature/movies/domain/usecases/get_top_rated_movies.dart';
import 'package:equatable/equatable.dart';

part 'top_rated_movies_state.dart';

class TopRatedMoviesCubit extends Cubit<TopRatedMoviesState> {
  final GetNowTopRatedMoviesUsecase getNowTopRatedMoviesUsecase;
  TopRatedMoviesCubit({required this.getNowTopRatedMoviesUsecase}) : super(TopRatedMoviesInitial());

  Future< void> getTopRated() async {
    emit(GetTopRatedMoviesLoadingState());
    final resulte = await getNowTopRatedMoviesUsecase.excute();
    emit(resulte.fold(
            (failure) => GetTopRatedMoviesErrorState(failure.errorMassage),
            (movie)=>GetTopRatedMoviesSuccessState(topRatedMovies: movie) ));
  }
}
