import 'package:flutter/material.dart';
import 'package:yanaway/theme/app_theme.dart';

class SeatSelectionScreen extends StatefulWidget {
  const SeatSelectionScreen({super.key});

  @override
  State<SeatSelectionScreen> createState() => _SeatSelectionScreenState();
}

class _SeatSelectionScreenState extends State<SeatSelectionScreen> {
  List<String> selectedSeats = [];
  
  // Seat status: 0 = available, 1 = booked, 2 = not provided, 3 = in progress
  List<List<int>> seatStatus = [
    [0, 0, 1, 0], // Row 1
    [0, 0, 1, 0], // Row 2
    [0, 0, 1, 0], // Row 3
    [0, 0, 1, 0], // Row 4
    [0, 0, 1, 0], // Row 5
    [0, 0, 1, 0], // Row 6
    [0, 0, 1, 0], // Row 7
    [0, 0, 1, 0], // Row 8
    [0, 0, 1, 0], // Row 9
    [0, 0, 1, 0], // Row 10
    [0, 0, 1, 0], // Row 11
    [0, 0, 1, 0], // Row 12
    [0, 2, 2, 0], // Row 13 - last row
  ];

  Color getSeatColor(int status) {
    switch (status) {
      case 0: // Available
        return Colors.green.shade400;
      case 1: // Booked
        return Colors.red.shade300;
      case 2: // Not provided
        return Colors.grey.shade400;
      case 3: // In progress
        return Colors.orange.shade300;
      default:
        return Colors.grey;
    }
  }

  void toggleSeat(int row, int col) {
    if (seatStatus[row][col] == 0) {
      final seatLabel = _getSeatLabel(row, col);
      setState(() {
        if (selectedSeats.contains(seatLabel)) {
          selectedSeats.remove(seatLabel);
          seatStatus[row][col] = 0;
        } else {
          selectedSeats.add(seatLabel);
          seatStatus[row][col] = 3; // Mark as in progress
        }
      });
    }
  }

  String _getSeatLabel(int row, int col) {
    final seatNum = row * 4 + col + 1;
    return seatNum.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Spacer(),
                  const Text(
                    'Select Seat',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(width: 48),
                ],
              ),
            ),
            
            // Bus info card
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppTheme.borderLight),
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.shadow,
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Text(
                    'NCG Express (semi luxury)',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Colombo-Jaffna',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Text(
                        'October 10,2025',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Text(
                        '07:45 PM',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 20),
            
            // "Front" label
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Text(
                  'Front',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            
            const SizedBox(height: 10),
            
            // Seat grid
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1,
                ),
                itemCount: seatStatus.length * 4,
                itemBuilder: (context, index) {
                  final row = index ~/ 4;
                  final col = index % 4;
                  final status = seatStatus[row][col];
                  final seatLabel = _getSeatLabel(row, col);
                  
                  return GestureDetector(
                    onTap: () => toggleSeat(row, col),
                    child: Container(
                      decoration: BoxDecoration(
                        color: getSeatColor(status),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: AppTheme.textPrimary,
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          seatLabel,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            
            // Legend
            Container(
              padding: const EdgeInsets.all(15),
              child: Wrap(
                spacing: 20,
                children: [
                  _buildLegendItem(Colors.green.shade400, 'Available'),
                  _buildLegendItem(Colors.red.shade300, 'Already Booked'),
                  _buildLegendItem(Colors.grey.shade400, 'Not Provided'),
                  _buildLegendItem(Colors.orange.shade300, 'Booking In Progress'),
                ],
              ),
            ),
            
            // Footer with selected seats and price
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.shadow,
                    blurRadius: 4,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        selectedSeats.isEmpty ? 'No seat selected' : 'Selected: ${selectedSeats.join(", ")}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'LKR 1700.00',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.textPrimary,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: selectedSeats.isEmpty ? null : () {
                      Navigator.pushNamed(context, '/details');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primaryColor,
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Next',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLegendItem(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 5),
        Text(
          label,
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}
