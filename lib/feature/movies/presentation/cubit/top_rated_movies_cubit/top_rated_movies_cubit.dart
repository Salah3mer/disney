import 'package:bloc/bloc.dart';
import 'package:disney/feature/movies/domain/entities/movie.dart';
import 'package:disney/feature/movies/domain/usecases/get_top_rated_movies.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'top_rated_movies_state.dart';

class TopRatedMoviesCubit extends Cubit<TopRatedMoviesState> {
  final GetNowTopRatedMoviesUsecase getNowTopRatedMoviesUsecase;
  TopRatedMoviesCubit({required this.getNowTopRatedMoviesUsecase}) : super(TopRatedMoviesInitial());
  int page = 1;
  List<Movie> allMovies =[];
  int lastIndex = 0;
  Future< void> getTopRated() async {
    emit(GetTopRatedMoviesLoadingState());
    await getNowTopRatedMoviesUsecase.excute(page: page).then((resulte)  {
      page++;
      print('PPPPPPPPPPPPPPPPPPPPPPPPP $page');
      emit(resulte.fold(
              (failure) => GetTopRatedMoviesErrorState(),
              (movie) {
                print(movie.length);
                allMovies.addAll(movie);
                print(allMovies.length);
                return GetTopRatedMoviesSuccessState(topRatedMovies: allMovies);
              } ));
    });


  }
}
