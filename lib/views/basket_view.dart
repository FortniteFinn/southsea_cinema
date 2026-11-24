import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/models/ticket_item.dart';
import 'package:southsea_cinema/repositories/basket_repository.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';
import 'package:southsea_cinema/widgets/primary_button.dart';

class BasketView extends StatefulWidget {
  const BasketView({super.key});

  @override
  State<BasketView> createState() {
    return _BasketViewState();
  }
}

class _BasketViewState extends State<BasketView> {
  String _confirmationMessage = '';

  Widget _buildEmptyState() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 32.0),
        child: Text(
          'Your basket is empty',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ),
    );
  }

  Widget _buildLineItem(BasketRepository basket, TicketItem item, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${item.quantity} Tickets',
            style: const TextStyle(
              color: cinemaBrand,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              '${item.quantity} Standard\n'
              '${item.movie.title}，'
              '${item.movie.time}，'
              'Southsea Cinema Room',
              style: const TextStyle(fontSize: 18),
            ),
          ),
          Text(
            '£${item.lineTotal.toStringAsFixed(2)}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline, color: cinemaBrand),
            onPressed: () {
              setState(() {
                basket.removeItem(index);
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTotalRow(String label, String value, {bool emphasise = false}) {
    final TextStyle style;

    if (emphasise) {
      style = const TextStyle(fontWeight: FontWeight.bold, fontSize: 16);
    } else {
      style = const TextStyle(color: cinemaFontMuted);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: style),
          Text(value, style: style),
        ],
      ),
    );
  }

  Widget _buildBasketList(BasketRepository basket, List<TicketItem> items) {
    final List<Widget> children = [];

    children.add(const Text('MY ORDER',
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)));
    children.add(const SizedBox(height: 16));

    children.add(
      const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Item', style: cinemaHeaderStyle),
          Text('Details', style: cinemaHeaderStyle),
          Text('Price', style: cinemaHeaderStyle),
        ],
      ),
    );

    children.add(const SizedBox(height: 12));

    for (int index = 0; index < items.length; index++) {
      final TicketItem item = items[index];
      children.add(_buildLineItem(basket, item, index));
    }

    children.add(const SizedBox(height: 24));
    children.add(_buildTotalRow('Service Charge','£4.00',));
    children.add(
      _buildTotalRow(
        'Total Due',
        '£${basket.getTotal().toStringAsFixed(2)}',
        emphasise: true,
      ),
    );
    children.add(
      PrimaryButton(
        label: 'Update Order',
        onPressed: () {
          setState(() {
            basket.clear();
            _confirmationMessage = 'Thanks, your tickets have been purchased';
          });
        },
      ),
    );

    if (_confirmationMessage.isNotEmpty) {
      children.add(const SizedBox(height: 12));
      children.add(
        Text(
          _confirmationMessage,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }

  @override
  Widget build(BuildContext context) {
    final BasketRepository basket = BasketRepository.instance;
    final List<TicketItem> items = basket.getItems();

    final Widget content;

    if (items.isEmpty) {
      if (_confirmationMessage.isNotEmpty) {
        content = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildEmptyState(),
            const SizedBox(height: 12),
            Text(
              _confirmationMessage,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        );
      } else {
        content = _buildEmptyState();
      }
    } else {
      content = _buildBasketList(basket, items);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle, style: cinemaHeaderStyle),
      ),
      drawer: const NavDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: content,
      ),
    );
  }
}
