import 'package:equatable/equatable.dart';

class Cast extends Equatable {
  const Cast({
    required this.name,
    required this.profilePath,
    required this.character,
  });

  factory Cast.fromJson(Map<String, dynamic> json) => Cast(
        name: json['name'] ?? '',
        profilePath: json['profile_path'] ?? '',
        character: json['character'] ?? '',
      );

  final String name;
  final String profilePath;
  final String character;

  @override
  List<Object?> get props => [
        name,
        profilePath,
        character,
      ];
}
