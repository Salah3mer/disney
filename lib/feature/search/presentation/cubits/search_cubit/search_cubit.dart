import 'package:bloc/bloc.dart';
import 'package:disney/feature/movies/domain/entities/movie.dart';
import 'package:disney/feature/search/domain/usecases/search_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final GetSearchUsecase getSearchUsecase;

  SearchCubit({required this.getSearchUsecase}) : super(SearchInitial());

  Future<void> getSearch(String name) async {
    final resulte = await getSearchUsecase.excute(name);
    emit(resulte.fold((l) => GetSearchErrorState(), (movies) =>
        GetSearchSuccessState(movies: movies)));
  }
}
