import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatelessWidget {
  const MovieListing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle, style: cinemaHeaderStyle),
        backgroundColor: cinemaSurface,
        iconTheme: const IconThemeData(color: cinemaBrand),
        elevation: 0,
      ),
      drawer: const NavDrawer(),
      body: Container(
          padding: EdgeInsets.all(25),
          // color: cinemaBackground,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Spider-Man (2002) (12A)',
                  style: TextStyle(
                      height: 2.4, color: cinemaFontWhite, fontSize: 32),
                ),
                SizedBox(height: 17),
                Text(
                  'Southsea Cinema Room',
                  style: TextStyle(
                      height: 2.4, color: cinemaFontWhite, fontSize: 20),
                ),
                Text(
                  'Friday 16th December 2026, 18:00 - ends at 20:01',
                  style: TextStyle(
                      height: 2.4, color: cinemaFontWhite, fontSize: 20),
                ),
                SizedBox(height: 17),
                Text(
                  'Friday 16th December 2026, 18:00 - ends at 20:01',
                  style: TextStyle(
                      height: 2.4, color: cinemaFontWhite, fontSize: 20),
                ),
                Text(
                  'Friday 16th December 2026, 18:00 - ends at 20:01',
                  style: TextStyle(
                      height: 2.4, color: cinemaFontWhite, fontSize: 20),
                ),
              ])),
    );
  }
}
