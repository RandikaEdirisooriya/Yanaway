import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yanaway/theme/app_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  DateTime? _selectedDate;
  DateTime _displayedMonth = DateTime.now();
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();

  @override
  void dispose() {
    _fromController.dispose();
    _toController.dispose();
    super.dispose();
  }

  void _handleSearch() {
    // Validate all fields are filled
    if (_fromController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter departure location')),
      );
      return;
    }

    if (_toController.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please enter destination')));
      return;
    }

    if (_selectedDate == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please select a date')));
      return;
    }

    // Navigate to booking screen with data
    Navigator.pushNamed(
      context,
      '/booking',
      arguments: {
        'from': _fromController.text,
        'to': _toController.text,
        'date': _selectedDate,
      },
    );
  }

  void _previousMonth() {
    setState(() {
      _displayedMonth = DateTime(
        _displayedMonth.year,
        _displayedMonth.month - 1,
      );
    });
  }

  void _nextMonth() {
    setState(() {
      _displayedMonth = DateTime(
        _displayedMonth.year,
        _displayedMonth.month + 1,
      );
    });
  }

  List<DateTime?> _getDaysInMonth(DateTime month) {
    final firstDay = DateTime(month.year, month.month, 1);
    final lastDay = DateTime(month.year, month.month + 1, 0);
    final daysInMonth = lastDay.day;
    final firstWeekday = firstDay.weekday % 7; // 0 = Sunday

    List<DateTime?> days = [];

    // Add empty cells for days before the first day of month
    for (int i = 0; i < firstWeekday; i++) {
      days.add(null);
    }

    // Add all days in the month
    for (int day = 1; day <= daysInMonth; day++) {
      days.add(DateTime(month.year, month.month, day));
    }

    return days;
  }

  bool _isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }

  bool _isSelected(DateTime date) {
    if (_selectedDate == null) return false;
    return date.year == _selectedDate!.year &&
        date.month == _selectedDate!.month &&
        date.day == _selectedDate!.day;
  }

  bool _isPastDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final checkDate = DateTime(date.year, date.month, date.day);
    return checkDate.isBefore(today);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Fixed Header - Does not scroll
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
              child: Row(
                children: [
                  Container(
                    width: 45,
                    height: 45,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppTheme.primaryColor,
                    ),
                    child: const Icon(
                      Icons.directions_bus,
                      color: Colors.white,
                      size: 26,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'YanaWay',
                        style: AppTheme.yanawayLogo.copyWith(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Find Your Seat. Begin Your Journey',
                        style: AppTheme.tagline.copyWith(fontSize: 11),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    width: 45,
                    height: 45,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppTheme.tealAccent,
                    ),
                    child: const Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 26,
                    ),
                  ),
                ],
              ),
            ),

            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Search card
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: AppTheme.borderLight),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.08),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Trip type
                            Text(
                              'One-way',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppTheme.textPrimary.withValues(
                                  alpha: 0.9,
                                ),
                              ),
                            ),

                            const SizedBox(height: 16),

                            // From field
                            Container(
                              height: 48,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Colors.grey.shade300,
                                  width: 1,
                                ),
                              ),
                              child: TextField(
                                controller: _fromController,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                                decoration: InputDecoration(
                                  hintText: 'From',
                                  hintStyle: TextStyle(
                                    color: Colors.grey.shade400,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  prefixIcon: Icon(
                                    Icons.near_me,
                                    color: Colors.grey.shade600,
                                    size: 20,
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 14,
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 12),

                            // To field with swap button
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 48,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: Colors.grey.shade300,
                                        width: 1,
                                      ),
                                    ),
                                    child: TextField(
                                      controller: _toController,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      decoration: InputDecoration(
                                        hintText: 'To',
                                        hintStyle: TextStyle(
                                          color: Colors.grey.shade400,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        prefixIcon: Icon(
                                          Icons.location_on,
                                          color: Colors.grey.shade600,
                                          size: 20,
                                        ),
                                        border: InputBorder.none,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                              horizontal: 16,
                                              vertical: 14,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Container(
                                  width: 48,
                                  height: 48,
                                  decoration: BoxDecoration(
                                    color: AppTheme.tealAccent,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.swap_vert,
                                      size: 24,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      final temp = _fromController.text;
                                      _fromController.text = _toController.text;
                                      _toController.text = temp;
                                    },
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 16),

                            // Date display
                            Text(
                              _selectedDate == null
                                  ? 'Pick a Date'
                                  : DateFormat(
                                      'EEEE, MMMM d, yyyy',
                                    ).format(_selectedDate!),
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: _selectedDate == null
                                    ? AppTheme.textOrange
                                    : AppTheme.textPrimary,
                              ),
                            ),

                            const SizedBox(height: 16),

                            // Inline Calendar
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.grey.shade200),
                              ),
                              child: Column(
                                children: [
                                  // Month navigation
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.chevron_left),
                                        onPressed: _previousMonth,
                                        iconSize: 28,
                                      ),
                                      Text(
                                        DateFormat(
                                          'MMMM yyyy',
                                        ).format(_displayedMonth),
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.chevron_right),
                                        onPressed: _nextMonth,
                                        iconSize: 28,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  // Weekday headers
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children:
                                        [
                                              'Su',
                                              'Mo',
                                              'Tu',
                                              'We',
                                              'Th',
                                              'Fr',
                                              'Sa',
                                            ]
                                            .map(
                                              (day) => SizedBox(
                                                width: 36,
                                                child: Center(
                                                  child: Text(
                                                    day,
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color:
                                                          Colors.grey.shade600,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                            .toList(),
                                  ),
                                  const SizedBox(height: 8),
                                  // Calendar grid
                                  GridView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 7,
                                          childAspectRatio: 1,
                                        ),
                                    itemCount: _getDaysInMonth(
                                      _displayedMonth,
                                    ).length,
                                    itemBuilder: (context, index) {
                                      final date = _getDaysInMonth(
                                        _displayedMonth,
                                      )[index];

                                      if (date == null) {
                                        return const SizedBox();
                                      }

                                      final isToday = _isToday(date);
                                      final isSelected = _isSelected(date);
                                      final isPast = _isPastDate(date);

                                      return GestureDetector(
                                        onTap: isPast
                                            ? null
                                            : () {
                                                setState(() {
                                                  _selectedDate = date;
                                                });
                                              },
                                        child: Container(
                                          margin: const EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                            color: isSelected
                                                ? Colors.black
                                                : isToday
                                                ? AppTheme.primaryColor
                                                      .withValues(alpha: 0.2)
                                                : Colors.transparent,
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                            border: isToday && !isSelected
                                                ? Border.all(
                                                    color:
                                                        AppTheme.primaryColor,
                                                    width: 2,
                                                  )
                                                : null,
                                          ),
                                          child: Center(
                                            child: Text(
                                              '${date.day}',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight:
                                                    isSelected || isToday
                                                    ? FontWeight.w600
                                                    : FontWeight.w400,
                                                color: isPast
                                                    ? Colors.grey.shade300
                                                    : isSelected
                                                    ? Colors.white
                                                    : Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  const SizedBox(height: 12),
                                  // Apply/Cancel buttons
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          setState(() {
                                            _selectedDate = null;
                                          });
                                        },
                                        child: const Text(
                                          'Cancel',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      ElevatedButton(
                                        onPressed: _selectedDate == null
                                            ? null
                                            : () {
                                                // Date already selected, just close if needed
                                              },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.black,
                                          foregroundColor: Colors.white,
                                          disabledBackgroundColor:
                                              Colors.grey.shade300,
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 24,
                                            vertical: 10,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                          ),
                                        ),
                                        child: const Text(
                                          'Apply',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 20),

                            // Search button
                            SizedBox(
                              width: double.infinity,
                              height: 48,
                              child: ElevatedButton(
                                onPressed: _handleSearch,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  elevation: 0,
                                ),
                                child: const Text(
                                  'Search',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      // Bottom navigation
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 8,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavItem(Icons.home, 'Home', 0),
            _buildNavItem(Icons.confirmation_number_outlined, 'Tickets', 1),
            _buildNavItem(Icons.person_outline, 'Profile', 2),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: isSelected
            ? BoxDecoration(
                color: AppTheme.primaryColor,
                borderRadius: BorderRadius.circular(24),
              )
            : null,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : Colors.grey.shade600,
              size: 22,
            ),
            if (isSelected) ...[
              const SizedBox(width: 6),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
