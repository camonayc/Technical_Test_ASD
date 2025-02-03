import 'package:equatable/equatable.dart';

class ProductionCompany extends Equatable {
  const ProductionCompany({
    required this.name,
    required this.logoPath,
    required this.id,
  });

  factory ProductionCompany.fromJson(Map<String, dynamic> json) =>
      ProductionCompany(
        name: json['name'] ?? '',
        logoPath: json['logo_path'] ?? '',
        id: json['id'] ?? 0,
      );

  final String name;
  final String logoPath;
  final int id;

  @override
  List<Object?> get props => [
        name,
        logoPath,
        id,
      ];
}
