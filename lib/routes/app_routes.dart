import 'package:flutter/material.dart';
import 'package:yanaway/screens/login_screen.dart';
import 'package:yanaway/screens/home_screen.dart';
import 'package:yanaway/screens/booking_screen.dart';
import 'package:yanaway/screens/seat_selection_screen.dart';
import 'package:yanaway/screens/passenger_details_screen.dart';
import 'package:yanaway/screens/payment_screen.dart';

class AppRoutes {
  static const String login = '/';
  static const String home = '/home';
  static const String booking = '/booking';
  static const String seatSelection = '/seat-selection';
  static const String details = '/details';
  static const String payment = '/payment';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      login: (context) => const LoginScreen(),
      home: (context) => const HomeScreen(),
      booking: (context) => const BookingScreen(),
      seatSelection: (context) => const SeatSelectionScreen(),
      details: (context) => const PassengerDetailsScreen(),
      payment: (context) => const PaymentScreen(),
    };
  }
}
