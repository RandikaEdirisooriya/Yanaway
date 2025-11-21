import 'package:flutter/material.dart';
import 'package:yanaway/models/bus.dart';
import 'package:yanaway/theme/app_theme.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              height: 219,
              decoration: const BoxDecoration(
                color: AppTheme.bookingBackground,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(44),
                  topRight: Radius.circular(44),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () => Navigator.pop(context),
                        ),
                        const Spacer(),
                        const Text(
                          'Busses (19)',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const Spacer(),
                        const SizedBox(width: 48),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        color: const Color(0xFF92A9F5).withValues(alpha: 0.6),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: AppTheme.shadow,
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Colombo',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFB74C00),
                            ),
                          ),
                          SizedBox(width: 15),
                          Icon(Icons.arrow_forward, color: Colors.white, size: 36),
                          SizedBox(width: 15),
                          Text(
                            'Jaffna',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF700606),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      '2025-10-10',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            // Bus list
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: Bus.sampleBuses.length,
                itemBuilder: (context, index) {
                  final bus = Bus.sampleBuses[index];
                  return _buildBusCard(bus);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBusCard(Bus bus) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppTheme.cardBackground,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppTheme.borderTeal),
        boxShadow: [
          BoxShadow(
            color: AppTheme.shadow,
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Bus info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      bus.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF002583),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      bus.route,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppTheme.textPrimary.withValues(alpha: 0.48),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(Icons.location_on, size: 12, color: AppTheme.textSecondary),
                        const SizedBox(width: 5),
                        Text(
                          'Colombo',
                          style: TextStyle(
                            fontSize: 8,
                            color: AppTheme.textSecondary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const Icon(Icons.location_on, size: 12, color: AppTheme.textSecondary),
                        const SizedBox(width: 5),
                        Text(
                          'Jaffna',
                          style: TextStyle(
                            fontSize: 8,
                            color: AppTheme.textSecondary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Closing at:',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.textTertiary,
                              ),
                            ),
                            Text(
                              bus.closingTime,
                              style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.textRed,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 30),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Closing at:',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.textTertiary,
                              ),
                            ),
                            Text(
                              bus.departure,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.textSecondary,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 30),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Closing at:',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.textTertiary,
                              ),
                            ),
                            Text(
                              bus.arrival,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Divider(color: Colors.black26),
                    Row(
                      children: [
                        Text(
                          'Available seat :',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF041A4B).withValues(alpha: 0.65),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          bus.availableSeats,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              
              // Price and booking
              Column(
                children: [
                  Text(
                    'LKR',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: AppTheme.textSecondary,
                    ),
                  ),
                    Text(
                      bus.price.toStringAsFixed(2),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppTheme.tealAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      bus.busType,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w900,
                        color: AppTheme.textSecondary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: 79,
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFF092DA2).withValues(alpha: 0.4)),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white.withValues(alpha: 0.3),
                    ),
                    child: const Icon(Icons.directions_bus, size: 40, color: AppTheme.primaryColor),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    decoration: BoxDecoration(
                      color: AppTheme.darkTeal,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: AppTheme.shadow,
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: const Text(
                      'BOOK',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
