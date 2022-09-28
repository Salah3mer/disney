import 'package:bloc/bloc.dart';
import 'package:disney/feature/movies/domain/entities/genres.dart';
import 'package:disney/feature/movies/domain/usecases/get_genres_usecase.dart';

import 'package:equatable/equatable.dart';

part 'genres_state.dart';

class GenresCubit extends Cubit<GenresState> {
  final GetGenresUsecase genresUsecase;

  GenresCubit({required this.genresUsecase}) : super(GenresInitial());

  Future<void> getGenres() async {
    final resualt = await genresUsecase.excute();
    emit(resualt.fold((l) => GenresErrorState(),
        (genres) => GenresSuccessState(genres: genres)));
  }
}
