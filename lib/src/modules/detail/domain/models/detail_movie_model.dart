import 'package:equatable/equatable.dart';
import 'package:technical_test_asd/src/modules/detail/domain/models/cast.dart';
import 'package:technical_test_asd/src/modules/detail/domain/models/genres.dart';
import 'package:technical_test_asd/src/modules/detail/domain/models/production_company.dart';

class DetailMovieModel extends Equatable {
  const DetailMovieModel({
    required this.genres,
    required this.countryOrigin,
    required this.originalLanguage,
    required this.productionCompanies,
    required this.releaseDate,
    required this.runtime,
    this.cast = const [],
  });

  factory DetailMovieModel.empty() => const DetailMovieModel(
        genres: [],
        countryOrigin: [],
        originalLanguage: '',
        productionCompanies: [],
        releaseDate: '',
        runtime: 0,
      );

  factory DetailMovieModel.fromJson(Map<String, dynamic> json) =>
      DetailMovieModel(
        genres: ((json['genres'] ?? <dynamic>[]) as List<dynamic>)
            .map((dynamic e) => Genres.fromJson(e))
            .toList(),
        countryOrigin:
            ((json['origin_country'] ?? <dynamic>[]) as List<dynamic>)
                .map((e) => e.toString())
                .toList(),
        originalLanguage: json['original_language'],
        productionCompanies:
            ((json['production_companies'] ?? <dynamic>[]) as List<dynamic>)
                .map((dynamic e) => ProductionCompany.fromJson(e))
                .toList(),
        releaseDate: json['release_date'],
        runtime: json['runtime'],
      );

  final List<Genres> genres;
  final List<String> countryOrigin;
  final String originalLanguage;
  final List<ProductionCompany> productionCompanies;
  final String releaseDate;
  final int runtime;
  final List<Cast> cast;

  DetailMovieModel copyWith({
    List<Genres>? genres,
    List<String>? countryOrigin,
    String? originalLanguage,
    List<ProductionCompany>? productionCompanies,
    String? releaseDate,
    int? runtime,
    List<Cast>? cast,
  }) =>
      DetailMovieModel(
        genres: genres ?? this.genres,
        countryOrigin: countryOrigin ?? this.countryOrigin,
        originalLanguage: originalLanguage ?? this.originalLanguage,
        productionCompanies: productionCompanies ?? this.productionCompanies,
        releaseDate: releaseDate ?? this.releaseDate,
        runtime: runtime ?? this.runtime,
        cast: cast ?? this.cast,
      );

  @override
  List<Object?> get props => [
        genres,
        countryOrigin,
        originalLanguage,
        productionCompanies,
        releaseDate,
        runtime,
      ];
}
