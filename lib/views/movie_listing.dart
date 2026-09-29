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
          child: DefaultTextStyle(
            style: const TextStyle(color: cinemaFontWhite, fontSize: 21),
          child: Column(
            spacing: 21,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Spider-Man (2002) (12A)',
                  style: TextStyle(fontSize: 32),
                ),
                SizedBox(height: 15),
                Text(
                  'Southsea Cinema Room',
                ),
                Text(
                  'Friday 16th December 2026, 18:00 - ends at 20:01',
                ),
                SizedBox(height: 15),
                Text(
                  'Bookings Available from October 1st 2026',
                ),
                Text(
                  'Select Quantities (Up to 5 in total)',
                ),
              ])),
      )
    );
  }
}
