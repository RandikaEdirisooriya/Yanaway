class Bus {
  final String id;
  final String name;
  final String route;
  final String departure;
  final String arrival;
  final double price;
  final String availableSeats;
  final String busType;
  final String closingTime;
  final DateTime date;

  Bus({
    required this.id,
    required this.name,
    required this.route,
    required this.departure,
    required this.arrival,
    required this.price,
    required this.availableSeats,
    required this.busType,
    required this.closingTime,
    required this.date,
  });

  static List<Bus> sampleBuses = [
    Bus(
      id: '1',
      name: 'NCG Express',
      route: 'Colombo-Jaffna',
      departure: '07:45 PM',
      arrival: '04:00 AM',
      price: 1700.00,
      availableSeats: '54/54',
      busType: 'SEMI LUXURY',
      closingTime: '07:15 PM',
      date: DateTime(2025, 10, 10),
    ),
    Bus(
      id: '2',
      name: 'NCG Express',
      route: 'Colombo-Jaffna',
      departure: '07:45 PM',
      arrival: '04:00 AM',
      price: 1700.00,
      availableSeats: '54/54',
      busType: 'SEMI LUXURY',
      closingTime: '07:15 PM',
      date: DateTime(2025, 10, 10),
    ),
    Bus(
      id: '3',
      name: 'NCG Express',
      route: 'Colombo-Jaffna',
      departure: '07:45 PM',
      arrival: '04:00 AM',
      price: 1700.00,
      availableSeats: '54/54',
      busType: 'SEMI LUXURY',
      closingTime: '07:15 PM',
      date: DateTime(2025, 10, 10),
    ),
  ];
}
