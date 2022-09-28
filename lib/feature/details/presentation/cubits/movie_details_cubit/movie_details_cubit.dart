import 'package:bloc/bloc.dart';
import 'package:disney/feature/details/domain/entities/movie_details.dart';
import 'package:disney/feature/details/domain/usecases/get_movie_details_usecase.dart';
import 'package:equatable/equatable.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  final GetMovieDetailsUsecase getMovieDetailsUsecase;
  MovieDetailsCubit({required this.getMovieDetailsUsecase}) : super(MovieDetailsInitial());
  Future<void> getMovieDetails(int movieId)async{
    final resulte = await getMovieDetailsUsecase.excute(movieId);

    emit(resulte.fold((l) => GetMovieDetailsErrorState(), (movie) => GetMovieDetailsSuccessState(movie)));
  }
}
