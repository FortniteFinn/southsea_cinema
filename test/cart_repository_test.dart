
import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/models/ticket_item.dart';
import 'package:southsea_cinema/repositories/basket_repository.dart';

const Movie batman = Movie(
  id: 'batman',
  title: 'Batman Begins',
  synopsis: "After witnessing his parents' murder as a child, Bruce Wayne returns to Gotham City.",
  description: 'Bruce Wayne must overcome his fears and become the Dark Knight.',
  time: '19:00 December 1st 2026',
  age: '12A',
  price: 5.00,
  imagePath: 'assets/images/batman.jpg',
);

const Movie angryBirds = Movie(
  id: 'angry_birds',
  title: 'Angry Birds',
  synopsis: 'On an island inhabited entirely by flightless birds, the short-tempered Red struggles to fit in.',
  description: 'Join Red, Chuck and Bomb in a hilarious animated adventure.',
  time: '13:00 December 6th 2026',
  age: 'PG',
  price: 4.00,
  imagePath: 'assets/images/angry_birds.png',
);

const Movie alien = Movie(
  id: 'alien',
  title: 'Alien Romulus',
  synopsis: 'A group of young space colonists encounter a terrifying threat.',
  description: 'A science fiction horror film.',
  time: '20:00 December 9th 2026',
  age: '15',
  price: 8.00,
  imagePath: 'assets/images/alien.jpg',
);

void main() {
  setUp(() {
    BasketRepository.instance.clear();
  });

  group('BasketRepository tests', () {
    test('starts with an empty basket and zero total', () {
      final BasketRepository basket = BasketRepository.instance;

      expect(basket.getItems().length, 0);
      expect(basket.getTotal(), 0.0);
    });

    test('adds tickets and calculates total correctly', () {
      final BasketRepository basket = BasketRepository.instance;

      const TicketItem item1 = TicketItem(
        movie: batman,
        quantity: 2,
      );

      const TicketItem item2 = TicketItem(
        movie: angryBirds,
        quantity: 1,
      );

      basket.addItem(item1);
      basket.addItem(item2);

      expect(basket.getItems().length, 2);
      expect(basket.getTotal(), 14.0);
    });

    test('removes tickets correctly', () {
      final BasketRepository basket = BasketRepository.instance;

      const TicketItem item = TicketItem(
        movie: alien,
        quantity: 1,
      );

      basket.addItem(item);
      expect(basket.getItems().length, 1);

      basket.removeItem(0);

      expect(basket.getItems().length, 0);
      expect(basket.getTotal(), 0.0);
    });

    test('clears the basket correctly', () {
      final BasketRepository basket = BasketRepository.instance;

      const TicketItem item = TicketItem(
        movie: batman,
        quantity: 2,
      );

      basket.addItem(item);
      basket.clear();

      expect(basket.getItems().length, 0);
      expect(basket.getTotal(), 0.0);
    });
  });
}
