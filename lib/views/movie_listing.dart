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
                  children: [
                    const Text(
                      'Spider-Man (2002) (12A)',
                      style: TextStyle(fontSize: 32),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Southsea Cinema Room',
                    ),
                    const Text(
                      'Friday 16th December 2026, 18:00 - ends at 20:01',
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Bookings Available from October 1st 2026',
                    ),
                    const Text(
                      'Select Quantities (Up to 5 in total)',
                    ),
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
        onPressed: () {
          setState(() {
            _feedback = 'Added $_quantity Tickets.';
            });
          }, child: const Text('Add to Order'),
    ),
    Text(_feedback),
    ],
    );
  }
}
