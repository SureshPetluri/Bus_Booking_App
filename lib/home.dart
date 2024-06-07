import 'package:flutter/material.dart';


import 'booking_model.dart';
import 'details.dart';

class HomeScreen extends StatelessWidget {
  final BusService _busService = BusService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bus Booking App'),
      ),
      body: FutureBuilder<List<Bus>>(
        future: _busService.fetchBuses(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No buses available'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final bus = snapshot.data![index];
                return ListTile(
                  title: Text(bus.name),
                  subtitle: Text('${bus.from} to ${bus.to}'),
                  trailing: Text('\$${bus.price}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BusDetailScreen(bus: bus),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
