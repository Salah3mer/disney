import 'package:bloc/bloc.dart';
import 'package:disney/movies/domain/entities/movie.dart';
import 'package:disney/movies/domain/usecases/get_now_playing_movies.dart';
import 'package:disney/movies/domain/usecases/get_popular_movies.dart';
import 'package:disney/movies/domain/usecases/get_top_rated_movies.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  final GetNowPlayingMoviesUsecase getNowPlayingMoviesUsecase;
  final GetPopularMoviesUsecase getPopularMoviesUsecase;
  final GetNowTopRatedMoviesUsecase getNowTopRatedMoviesUsecase;

  MoviesCubit(this.getNowPlayingMoviesUsecase, this.getPopularMoviesUsecase,
      this.getNowTopRatedMoviesUsecase)
      : super(MoviesInitialState());
    static MoviesCubit get(context)=> BlocProvider.of(context);

  List<Movie> nowPlaying =[];

  Future<List<Movie>> getNowPlayingMovies() async {
    emit(GetNowPlayingMoviesLoadingState());
    final resulte = await getNowPlayingMoviesUsecase.excute();
    emit(resulte.fold(
        (failure) => GetNowPlayingMoviesErrorState(failure.errorMassage),
        (movie) {
          movie.forEach((element) {
            nowPlaying.add(element);
          });
          return GetNowPlayingMoviesSuccessState();
        }));
    return nowPlaying;
  }
List<Movie> popular=[];
  Future<void > getPopularMovies() async {
    emit(GetPopularMoviesLoadingState());
    final resulte = await getPopularMoviesUsecase.excute();
   emit( resulte.fold(
        (failure) => GetPopularMoviesErrorState(failure.errorMassage),
        (movie) {
          movie.forEach((element) {
            popular.add(element);
          });
          return  GetPopularMoviesSuccessState(movie);}));

  }
  List<Movie> topRated =[];
  Future< List<Movie>> getTopRated() async {
    emit(GetTopRatedMoviesLoadingState());
    final resulte = await getNowTopRatedMoviesUsecase.excute();
    emit(resulte.fold(
        (failure) => GetTopRatedMoviesErrorState(failure.errorMassage),
        (movie) {
          movie.forEach((element) {
            topRated.add(element);
          });
         return   GetTopRatedMoviesSuccessState(); }));
    return topRated;
  }
}
