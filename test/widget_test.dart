import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/main.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/views/home_view.dart';
import 'package:southsea_cinema/views/movie_listing.dart';

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
        imagePath: 'assets/images/spiderman.jpg',
      );

      expect(movie.id, 'spiderman');
      expect(movie.title, 'Spider-Man');
      expect(movie.synopsis, 'A teenager gains spider-like abilities.');
      expect(movie.description, 'Peter Parker becomes Spider-Man.');
      expect(movie.time, '18:00');
      expect(movie.age, '12A');
      expect(movie.price, 5.25);
      expect(movie.imagePath, 'assets/images/spiderman.jpg');
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

      group('App smoke tests', () {
    testWidgets('App displays HomeView as home', (WidgetTester tester) async {
      await tester.pumpWidget(const SouthseaCinemaApp());
      expect(find.byType(HomeView), findsOneWidget);
      expect(find.text('Southsea Cinema'), findsOneWidget);
    });

    testWidgets('Displays movie cards with titles and booking buttons',
        (WidgetTester tester) async {
      await tester.pumpWidget(const SouthseaCinemaApp());
      expect(find.text('Batman Begins'), findsOneWidget);
      expect(find.text('Book Now'), findsAtLeastNWidgets(1));
      expect(find.text('Angry Birds'), findsOneWidget);
      expect(find.text('Book Now'), findsAtLeastNWidgets(1));
      await tester.scrollUntilVisible(find.text('Alien Romulus'), 500);
      expect(find.text('Alien Romulus'), findsOneWidget);
      expect(find.text('Book Now'), findsAtLeastNWidgets(1));
    });

    testWidgets('Tapping Book Now navigates to Movie listing with selected movie',
        (WidgetTester tester) async {
      await tester.pumpWidget(const SouthseaCinemaApp());

      await tester.tap(find.text('Book Now').first);
      await tester.pumpAndSettle();

      expect(find.byType(MovieListing), findsOneWidget);
      expect(find.text('BATMAN BEGINS (12A)'), findsOneWidget);
      expect(find.text('Number of Tickets: 0'), findsOneWidget);
      await tester.scrollUntilVisible(find.text('Add to Order'), 500);
      await tester.tap(find.text('Add to Order'));
      await tester.pump();
      expect(find.text('Added 0 Tickets'), findsOneWidget);
    });
  });
  });
}