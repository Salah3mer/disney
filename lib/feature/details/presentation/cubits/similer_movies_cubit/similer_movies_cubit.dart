import 'package:bloc/bloc.dart';
import 'package:disney/feature/details/domain/usecases/get_similer_movies_usecase.dart';
import 'package:disney/feature/movies/domain/entities/movie.dart';
import 'package:equatable/equatable.dart';

part 'similer_movies_state.dart';

class SimilerMoviesCubit extends Cubit<SimilerMoviesState> {
  final GetSimilerMoviesUsecase getSimilerMoviesUsecase;

  SimilerMoviesCubit({required this.getSimilerMoviesUsecase})
      : super(SimilerMoviesInitial());

  Future<void> getSimilerMovies(int movieId) async {
    final resulte = await getSimilerMoviesUsecase.excute(movieId);

    emit(resulte.fold((l) => GetSimilerMoviesErrorState(),
        (cast) => GetSimilerMoviesSuccessState(cast)));
  }
}
