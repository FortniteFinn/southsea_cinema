import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';
import 'package:southsea_cinema/models/movie.dart';

class MovieListing extends StatefulWidget {
  final Movie movie;

  const MovieListing({
    super.key,
    required this.movie,
  });

  @override
  State<MovieListing> createState() => _MovieListingState();
}

class _MovieListingState extends State<MovieListing> {
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
                  children: [
                    Text(
                      '${widget.movie.title.toUpperCase()} (${widget.movie.age})',
                      style: const TextStyle(
                          fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    Image.asset(
                      widget.movie.imagePath,
                      width: 160,
                      height: 240,
                    ),
                    const Text(
                      'Southsea Cinema Room',
                    ),
                    Text(widget.movie.time),
                    const SizedBox(height: 15),
                    Text(widget.movie.description),
                    const Text(
                      'Select Quantities (Up to 5 in total)',
                    ),
                    Text('Tickets (${widget.movie.formattedPrice} each)'),
                    DropDownMenu(),
                  ])),
        ));
  }
}

class DropDownMenu extends StatefulWidget {
  const DropDownMenu({super.key});

  @override
  State<DropDownMenu> createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {
  int _quantity = 0;
  String _feedback = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          spacing: 15,
          children: [
            DropdownMenu<int>(
              initialSelection: 0,
              onSelected: (int? value) {
                if (value != null) {
                  setState(() {
                    _quantity = value;
                  });
                }
              },
              dropdownMenuEntries: [
                DropdownMenuEntry(value: 0, label: '0'),
                DropdownMenuEntry(value: 1, label: '1'),
                DropdownMenuEntry(value: 2, label: '2'),
                DropdownMenuEntry(value: 3, label: '3'),
                DropdownMenuEntry(value: 4, label: '4'),
                DropdownMenuEntry(value: 5, label: '5'),
              ],
            ),
            Text('Number of Tickets: $_quantity'),
          ],
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: cinemaBrand,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
          onPressed: () {
            setState(() {
              _feedback = 'Added $_quantity Tickets.';
            });
          },
          child: const Text(
            'Add to Order',
            style: TextStyle(color: cinemaFontWhite),
          ),
        ),
        Text(_feedback),
      ],
    );
  }
}
