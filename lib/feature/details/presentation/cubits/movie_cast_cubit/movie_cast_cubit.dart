import 'package:bloc/bloc.dart';
import 'package:disney/feature/details/domain/entities/cast.dart';
import 'package:disney/feature/details/domain/usecases/get_movie_cast_usecase.dart';
import 'package:equatable/equatable.dart';

part 'movie_cast_state.dart';

class MovieCastCubit extends Cubit<MovieCastState> {
  final GetMovieCastUseCase getMovieCastUseCase;

  MovieCastCubit({required this.getMovieCastUseCase})
      : super(MovieCastInitial());

  Future<void> getMovieCast(int movieId) async {
    final resulte = await getMovieCastUseCase.excute(movieId);

    emit(resulte.fold((l) => GetMovieCastErrorState(),
        (cast) => GetMovieCastSuccessState(cast)));
  }
}
