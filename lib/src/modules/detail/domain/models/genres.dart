import 'package:equatable/equatable.dart';

class Genres extends Equatable {
  const Genres({
    this.id,
    this.name,
  });

  factory Genres.fromJson(Map<String, dynamic> json) => Genres(
        id: json['id'],
        name: json['name'],
      );

  final int? id;
  final String? name;

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
