part of 'detail_bloc.dart';

sealed class DetailState extends Equatable {
  const DetailState();

  @override
  List<Object> get props => [];
}

final class DetailInitial extends DetailState {}

final class DetailLoading extends DetailState {}

final class DetailError extends DetailState {
  final String message;
  const DetailError(this.message);

  @override
  List<Object> get props => [message];
}

class DetailSuccess extends DetailState {
  const DetailSuccess(this.detailMovie, this.isFavorite);

  final DetailMovieModel detailMovie;
  final bool isFavorite;

  @override
  List<Object> get props => [detailMovie, isFavorite];
}

final class MovieSaved extends DetailState {
  final bool isSaved;
  const MovieSaved(this.isSaved);

  @override
  List<Object> get props => [isSaved];
}
