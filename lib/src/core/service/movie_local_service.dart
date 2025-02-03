import 'package:sqflite/sqflite.dart';
import 'package:technical_test_asd/src/core/config/database/movie_database.dart';
import 'package:technical_test_asd/src/shared/domain/models/movie_model.dart';

class MovieLocalService {
  MovieLocalService(this._database);

  final MovieDatabase _database;

  Future<bool> movieExists(int id) async {
    final db = await _database.database;
    final result = await db.query(
      'movies',
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );
    return result.isNotEmpty;
  }

  Future<void> saveMovie(MovieModel movie) async {
    final db = await _database.database;
    await db.insert(
      'movies',
      movie.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> saveListMovies(List<MovieModel> movies) async {
    final db = await _database.database;
    final batch = db.batch();
    for (final MovieModel movie in movies) {
      batch.insert(
        'movies',
        movie.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    await batch.commit();
  }

  Future<List<MovieModel>> getMovies(int page, {int pageSize = 10}) async {
    final db = await _database.database;
    final offset = (page - 1) * pageSize;
    final result = await db.query(
      'movies',
      orderBy: 'datetime(created_at) DESC',
      limit: pageSize,
      offset: offset,
    );
    return result.map((map) => MovieModel.fromJson(map)).toList();
  }

  Future<void> deleteMovie(int id) async {
    final db = await _database.database;
    await db.delete(
      'movies',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> clearMovies() async {
    final db = await _database.database;
    await db.delete('movies');
  }
}
