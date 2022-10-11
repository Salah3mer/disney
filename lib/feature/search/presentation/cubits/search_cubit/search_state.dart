part of 'search_cubit.dart';

@immutable
abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class GetSearchLoadingState extends SearchState {}

class GetSearchSuccessState extends SearchState {
  final List<Movie> movies;

  const GetSearchSuccessState({required this.movies});

  @override
  List<Object> get props => [movies];
}

class GetSearchErrorState extends SearchState {}
