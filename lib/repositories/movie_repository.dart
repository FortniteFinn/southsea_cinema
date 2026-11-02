import 'package:southsea_cinema/models/movie.dart';

class MovieRepository {
  List<Movie> getMovies() {
    return const [
      Movie(
        id: 'batman',
        title: 'Batman Begins',
        synopsis: "After witnessing his parents' murder as a child, Bruce Wayne returns to Gotham City after years of training to fight crime. Taking on the identity of Batman, he sets out to protect the city from corruption and a dangerous new threat that could destroy Gotham.",
        description: "Bruce Wayne must overcome his fears and become the Dark Knight to protect Gotham City. Featuring intense action, a gripping origin story and a darker take on the Batman legend, Batman Begins explores the making of one of DC's most iconic superheroes.",
        time: '19:00 December 1st 2026',
        age: '12A',
        price: 5.00,
        imagePath: 'assets/images/batman.jpg',
      )
    ];
  }
}