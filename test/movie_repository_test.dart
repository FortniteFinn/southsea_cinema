import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/repositories/movie_repository.dart';
import 'package:southsea_cinema/models/movie.dart';

void main() {
  group('Movie repository tests', () {
    test('getMovieById returns movie with matching ID', () {
      final MovieRepository repository = MovieRepository();
      final Movie? movie = repository.getMovieById('batman');

      expect(movie, isNotNull);
      expect(movie?.id, 'batman');
      expect(movie?.title, 'Batman Begins');
    });

    test('getMovieById returns null for missing ID', () {
      final MovieRepository repository = MovieRepository();
      final Movie? movie = repository.getMovieById('superman');

      expect(movie, isNull);
    });
  });
}
