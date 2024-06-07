class Bus {
  final String id;
  final String name;
  final String from;
  final String to;
  final DateTime departureTime;
  final DateTime arrivalTime;
  final double price;

  Bus({
    required this.id,
    required this.name,
    required this.from,
    required this.to,
    required this.departureTime,
    required this.arrivalTime,
    required this.price,
  });
}

class BusService {
  Future<List<Bus>> fetchBuses() async {
    // Simulate network delay
    await Future.delayed(Duration(seconds: 2));

    // Sample data
    return [
      Bus(
        id: '1',
        name: 'Bus A',
        from: 'City A',
        to: 'City B',
        departureTime: DateTime.now().add(Duration(hours: 1)),
        arrivalTime: DateTime.now().add(Duration(hours: 4)),
        price: 25.0,
      ),
      Bus(
        id: '2',
        name: 'Bus B',
        from: 'City C',
        to: 'City D',
        departureTime: DateTime.now().add(Duration(hours: 2)),
        arrivalTime: DateTime.now().add(Duration(hours: 5)),
        price: 30.0,
      ),
    ];
  }
}
