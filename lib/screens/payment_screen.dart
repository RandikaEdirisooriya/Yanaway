import 'package:flutter/material.dart';
import 'package:yanaway/theme/app_theme.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int selectedCardType = 0; // 0 = Visa, 1 = Mastercard
  final _cardNumberController = TextEditingController();
  final _monthController = TextEditingController(text: 'Month');
  final _yearController = TextEditingController(text: 'Year');
  final _cvvController = TextEditingController();

  @override
  void dispose() {
    _cardNumberController.dispose();
    _monthController.dispose();
    _yearController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const Spacer(),
                    const Text(
                      'Payment Details',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      'Cancel',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.textPrimary,
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 20),
                
                // Price section
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppTheme.cardBackground,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Your Price:',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            'LKR',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            '1800.00',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 20),
                
                const Divider(),
                
                const SizedBox(height: 20),
                
                // Card type selection
                const Text(
                  'Card Type*',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                
                const SizedBox(height: 15),
                
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => selectedCardType = 0),
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: selectedCardType == 0 ? Colors.blue.shade50 : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: selectedCardType == 0 ? Colors.blue : Colors.grey.shade300,
                              width: 2,
                            ),
                          ),
                          child: Column(
                            children: [
                              Container(
                                width: 60,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade900,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: const Icon(Icons.credit_card, color: Colors.white),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'Visa',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Radio(
                                value: 0,
                                groupValue: selectedCardType,
                                onChanged: (value) => setState(() => selectedCardType = value!),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => selectedCardType = 1),
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: selectedCardType == 1 ? Colors.red.shade50 : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: selectedCardType == 1 ? Colors.red : Colors.grey.shade300,
                              width: 2,
                            ),
                          ),
                          child: Column(
                            children: [
                              Container(
                                width: 60,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.red.shade800,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: const Icon(Icons.credit_card, color: Colors.white),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'Mastercard',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Radio(
                                value: 1,
                                groupValue: selectedCardType,
                                onChanged: (value) => setState(() => selectedCardType = value!),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 30),
                
                const Divider(),
                
                const SizedBox(height: 20),
                
                // Card details form
                _buildFormField(
                  'Card Number*',
                  _cardNumberController,
                  Icons.credit_card,
                ),
                
                const SizedBox(height: 20),
                
                Row(
                  children: [
                    Expanded(
                      child: _buildDropdownField(
                        'Expiration Month*',
                        _monthController,
                        ['Month', '01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12'],
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: _buildDropdownField(
                        'Expiration Year*',
                        _yearController,
                        ['Year', '2024', '2025', '2026', '2027', '2028'],
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 20),
                
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Text(
                          'CNV*',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 10),
                        Flexible(
                          child: Text(
                            '(This code is a three or four digit number printed on the back or front of credit cards)',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 50,
                      width: 100,
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
                      child: TextField(
                        controller: _cvvController,
                        obscureText: true,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.all(15),
                        ),
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 40),
                
                // Pay button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      _showSuccessDialog(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Pay',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFormField(String label, TextEditingController controller, IconData icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Container(
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
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              prefixIcon: Icon(icon, color: AppTheme.textSecondary),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.all(15),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField(String label, TextEditingController controller, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Container(
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
          child: TextField(
            controller: controller,
            readOnly: true,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.all(15),
              suffixIcon: DropdownButton<String>(
                value: controller.text,
                items: items.map((item) {
                  return DropdownMenuItem(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    controller.text = value ?? '';
                  });
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Payment Successful!'),
        content: const Text('Your booking has been confirmed. Thank you for using YanaWay!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Navigator.pushReplacementNamed(context, '/home'); // Return to home
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
