part of 'favorite_bloc.dart';

sealed class FavoriteState extends Equatable {
  const FavoriteState({this.movies = const []});

  final List<MovieModel> movies;

  @override
  List<Object> get props => [movies];
}

final class FavoriteInitial extends FavoriteState {}

final class FavoriteLoading extends FavoriteState {}

final class FavoriteEmpty extends FavoriteState {}

final class FavoriteError extends FavoriteState {
  final String message;
  const FavoriteError(this.message);

  @override
  List<Object> get props => [
        message,
        movies,
      ];
}

final class FavoriteSuccess extends FavoriteState {
  const FavoriteSuccess({
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
