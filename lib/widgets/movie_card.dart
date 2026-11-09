import 'package:flutter/material.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/views/movie_listing.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cinemaBackground,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  movie.title,
                  style: const TextStyle(
                    color: cinemaBrandDark,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  ' (${movie.age})',
                  style: const TextStyle(
                    color: cinemaFontMuted,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  movie.imagePath,
                  width: 80,
                  height: 120,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    movie.description,
                    style: const TextStyle(
                      color: cinemaFontWhite,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "BOOK TICKETS",
                  style: const TextStyle(
                    color: cinemaFontWhite,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  movie.time,
                  style: const TextStyle(
                    color: cinemaFontWhite,
                    fontSize: 16,
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: cinemaBrand,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MovieListing(movie: movie),
                      ),
                    );
                  },
                  child: const Text('Book Now',
                      style: TextStyle(color: cinemaFontWhite)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
