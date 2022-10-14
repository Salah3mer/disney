import 'package:bloc/bloc.dart';
import 'package:disney/feature/movies/domain/entities/movie.dart';
import 'package:disney/feature/search/domain/usecases/search_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final GetSearchUsecase getSearchUsecase;

  SearchCubit({required this.getSearchUsecase}) : super(SearchInitial());
  List<Movie> allMovies = [];
  String? currentname;
  int page =1;
  Future<void> getSearch({required String name,}) async {
    emit(GetSearchLoadingState());
    await getSearchUsecase.excute(name, page).then(
        (resulte) {
          if(currentname==name) {
            page++;}
          emit(resulte.fold((l) => GetSearchErrorState(), (movies) {
              debugPrint(currentname);
                allMovies.addAll(movies);
              return GetSearchSuccessState(movies: movies);
            }));
        });
  }
}
