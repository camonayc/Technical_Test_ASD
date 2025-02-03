part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState({this.movies = const []});

  final List<MovieModel> movies;

  @override
  List<Object> get props => [movies];
}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeError extends HomeState {
  final String message;
  const HomeError(this.message);

  @override
  List<Object> get props => [
        message,
        movies,
      ];
}

final class HomeEmpty extends HomeState {}

final class HomeSuccess extends HomeState {
  const HomeSuccess({
    required super.movies,
    this.isLoadingMore = false,
  });

  final bool isLoadingMore;

  @override
  List<Object> get props => [
        movies,
        isLoadingMore,
      ];
}

final class HomeSearching extends HomeState {}
