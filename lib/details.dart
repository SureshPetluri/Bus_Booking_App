import 'package:flutter/material.dart';

import 'booking_model.dart';

class BusDetailScreen extends StatelessWidget {
  final Bus bus;

  const BusDetailScreen({Key? key, required this.bus}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(bus.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('From: ${bus.from}'),
            Text('To: ${bus.to}'),
            Text('Departure: ${bus.departureTime}'),
            Text('Arrival: ${bus.arrivalTime}'),
            Text('Price: \$${bus.price}'),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Handle booking logic here
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Ticket booked for ${bus.name}')),
                );
              },
              child: Text('Book Ticket'),
            ),
          ],
        ),
      ),
    );
  }
}
