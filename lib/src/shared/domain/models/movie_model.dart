import 'package:equatable/equatable.dart';

class MovieModel extends Equatable {
  const MovieModel({
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.voteAverage,
    required this.voteCount,
  });

  factory MovieModel.empty() => const MovieModel(
        id: 0,
        title: '',
        originalTitle: '',
        overview: '',
        posterPath: '',
        backdropPath: '',
        voteAverage: 0,
        voteCount: 0,
      );

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        id: json['id'] ?? 0,
        title: json['title'] ?? '',
        originalTitle: json['original_title'] ?? '',
        overview: json['overview'] ?? '',
        posterPath: json['poster_path'] ?? '',
        backdropPath: json['backdrop_path'] ?? '',
        voteAverage: json['vote_average'] ?? 0.0,
        voteCount: json['vote_count'] ?? 0,
      );

  final int id;
  final String title;
  final String originalTitle;
  final String overview;
  final String posterPath;
  final String backdropPath;
  final double voteAverage;
  final int voteCount;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'original_title': originalTitle,
        'overview': overview,
        'poster_path': posterPath,
        'backdrop_path': backdropPath,
        'vote_average': voteAverage,
        'vote_count': voteCount,
      };

  @override
  List<Object?> get props => [
        id,
        title,
        originalTitle,
        overview,
        posterPath,
        backdropPath,
        voteAverage,
        voteCount,
      ];
}
