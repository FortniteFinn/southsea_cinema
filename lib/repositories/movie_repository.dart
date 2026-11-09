import 'package:southsea_cinema/models/movie.dart';

class MovieRepository {
  List<Movie> getMovies() {
    return const [
      Movie(
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
      ),
      Movie(
        id: 'angry_birds',
        title: 'Angry Birds',
        synopsis:
            "On an island inhabited entirely by flightless birds, the short-tempered Red struggles to fit in with the rest of society. When a mysterious group of green pigs arrives, Red and his unlikely friends must uncover their true intentions and protect their home.",
        description:
            "Join Red, Chuck and Bomb in a hilarious animated adventure filled with comedy, friendship and explosive action. When the pigs threaten their peaceful island, three unlikely heroes must work together to save their fellow birds.",
        time: '13:00 December 6th 2026',
        age: 'PG',
        price: 4.00,
        imagePath: 'assets/images/angry_birds.png',
      ),
      Movie(
        id: 'alien',
        title: 'Alien Romulus',
        synopsis:
            "Set between the events of Alien and Aliens, a group of young space colonists searching for a better future explore an abandoned space station. However, they soon discover that the station is home to a deadly alien lifeform, forcing them to fight for survival in the darkness of space.",
        description:
            "Experience a terrifying return to the world of Alien in this sci-fi horror adventure. As a group of young explorers encounter a deadly extraterrestrial threat, they must rely on their courage and teamwork to survive. Featuring intense suspense, horrifying creatures and claustrophobic environments, Alien: Romulus delivers a thrilling addition to the iconic franchise.",
        time: '20:00 December 9th 2026',
        age: '15',
        price: 8.00,
        imagePath: 'assets/images/alien.jpg',
      ),
    ];
  }

  Movie? getMovieById(String id) {
    for (Movie movie in getMovies()) {
      if (movie.id == id) {
        return movie;
      }
    }

    return null;
  }
}
