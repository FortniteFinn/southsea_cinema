import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';

void main() {
  group('Movie model tests', () {
    test('creates Movie instance with given properties', () {
      const movie = Movie(
        id: 'chickenlittle',
        title: 'Chicken Little',
        synopsis: 'chicken',
        description: 'chicken',
        time: '13:00 December 19th 2026',
        age: 'PG',
        price: 5.00,
        imagePath: 'assets/images/angry_birds.png',
      );

      expect(movie.id, 'chickenlittle');
      expect(movie.title, 'Chicken Little');
      expect(movie.synopsis, 'chicken');
      expect(movie.description, 'chicken');
      expect(movie.time, '13:00 December 19th 2026');
      expect(movie.age, 'PG');
      expect(movie.price, 5.00);
      expect(movie.imagePath, 'assets/images/angry_birds.png');
    });

    test(
        'formattedPrice returns price prefixed with pound sign and two decimal places.',
        () {
      const movie = Movie(
        id: 'batman',
        title: 'Batman Begins',
        synopsis:
            "After witnessing his parents' murder as a child, Bruce Wayne returns to Gotham City after years of training to fight crime. Taking on the identity of Batman, he sets out to protect the city from corruption and a dangerous new threat that could destroy Gotham.",
        description:
            "Bruce Wayne must overcome his fears and become the Dark Knight to protect Gotham City. Featuring intense action, a gripping origin story and a darker take on the Batman legend, Batman Begins explores the making of one of DC's most iconic superheroes.",
        time: '19:00 December 1st 2026',
        age: '12A',
        price: 5.00,
        imagePath: 'assets/images/batman.jpg',
      );

      expect(movie.formattedPrice, '£5.00');
    });
  });
}
