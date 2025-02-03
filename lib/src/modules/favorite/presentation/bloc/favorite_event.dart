part of 'favorite_bloc.dart';

sealed class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

class StartFavorite extends FavoriteEvent {}

class LoadMoreMovies extends FavoriteEvent {}

class DeleteFavorite extends FavoriteEvent {
  const DeleteFavorite(this.id);

  final int id;

  @override
  List<Object> get props => [id];
}
