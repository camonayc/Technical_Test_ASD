part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class StartHome extends HomeEvent {}

class LoadMoreMovies extends HomeEvent {}

class SearchMovies extends HomeEvent {
  final String query;
  const SearchMovies(this.query);

  @override
  List<Object> get props => [query];
}
