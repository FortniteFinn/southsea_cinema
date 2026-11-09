import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';

void main() {
  group('Movie model tests', () {
    test('creates Movie instance with given properties', () {
      const movie = Movie(
        id: 'spiderman',
        title: 'Spider-Man',
        synopsis: 'A teenager gains spider-like abilities.',
        description: 'Peter Parker becomes Spider-Man.',
        time: '18:00',
        age: '12A',
        price: 5.25,
        imagePath: 'assets/images/spiderman.jpeg',
      );

      expect(movie.id, 'spiderman');
      expect(movie.title, 'Spider-Man');
      expect(movie.synopsis, 'A teenager gains spider-like abilities.');
      expect(movie.description, 'Peter Parker becomes Spider-Man.');
      expect(movie.time, '18:00');
      expect(movie.age, '12A');
      expect(movie.price, 5.25);
      expect(movie.imagePath, 'assets/images/spiderman.jpeg');
    });

    test(
      'formattedPrice returns price prefixed with pound sign and two decimals',
      () {
        const movie = Movie(
          id: 'alien',
          title: 'Alien',
          synopsis: 'A crew encounters a dangerous alien.',
          description: 'A science fiction horror film.',
          time: '20:00',
          age: '15',
          price: 7,
          imagePath: 'assets/images/alien.jpg',
        );

        expect(movie.formattedPrice, '£7.00');
      },
    );
  });
}