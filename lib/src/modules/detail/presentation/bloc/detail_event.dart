part of 'detail_bloc.dart';

sealed class DetailEvent extends Equatable {
  const DetailEvent();

  @override
  List<Object> get props => [];
}

class StartDetail extends DetailEvent {
  final int id;
  const StartDetail(this.id);

  @override
  List<Object> get props => [id];
}

class SaveMovie extends DetailEvent {
  final MovieModel movie;
  const SaveMovie(this.movie);

  @override
  List<Object> get props => [movie];
}

class DeleteFavorite extends DetailEvent {
  final MovieModel movie;
  const DeleteFavorite(this.movie);

  @override
  List<Object> get props => [movie];
}
