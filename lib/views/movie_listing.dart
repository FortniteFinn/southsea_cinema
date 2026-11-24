import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/widgets/primary_button.dart';
import 'package:southsea_cinema/models/ticket_item.dart';
import 'package:southsea_cinema/repositories/basket_repository.dart';

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
        ),
        drawer: const NavDrawer(),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(25),
          child: DefaultTextStyle(
              style: const TextStyle(color: cinemaFontWhite, fontSize: 21),
              child: Column(
                  spacing: 15,
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
                    Text(widget.movie.description),
                    const Text(
                      'Select Quantities (Up to 5 in total)',
                    ),
                    Text('Tickets (${widget.movie.formattedPrice} each)'),
                    DropDownMenu(movie: widget.movie),
                  ])),
        ));
  }
}

class DropDownMenu extends StatefulWidget {
  final Movie movie;

  const DropDownMenu({super.key, required this.movie});

  @override
  State<DropDownMenu> createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {
  int _quantity = 1;
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
              initialSelection: 1,
              onSelected: (int? value) {
                if (value != null) {
                  setState(() {
                    _quantity = value;
                  });
                }
              },
              dropdownMenuEntries: [
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
        PrimaryButton(
          label: 'Add to Order',
          onPressed: () {
            BasketRepository.instance.addItem(
              TicketItem(
                movie: widget.movie,
                quantity: _quantity,
              ),
            );

            setState(() {
              _feedback = 'Added $_quantity tickets to your basket.';
            });
          },
        ),
        Text(_feedback),
      ],
    );
  }
}
