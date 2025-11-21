import 'package:flutter/material.dart';
import 'package:yanaway/theme/app_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isButtonPressed = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF03AFA6),
      body: SafeArea(
        child: Column(
          children: [
            // Spacer for top section
            const Spacer(flex: 2),
            
            // Logo
            Container(
              width: 143,
              height: 135,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/yanaway_logo.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            
            const SizedBox(height: 15),
            
            // YanaWay title
            Text(
              'YanaWay',
              style: GoogleFonts.turretRoad(
                fontSize: 40,
                fontWeight: FontWeight.w800,
                color: Colors.black,
                letterSpacing: 0,
              ),
            ),
            
            const SizedBox(height: 8),
            
            // Tagline
            Text(
              'Reserve in seconds, ride in comfort.',
              style: GoogleFonts.roboto(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            
            // Spacer to push form to bottom
            const Spacer(flex: 3),
            
            // Login form container
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(46),
                  topRight: Radius.circular(46),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Username field
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8F8F8),
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        hintText: 'Username',
                        hintStyle: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Colors.grey.shade400,
                        ),
                        prefixIcon: Icon(
                          Icons.person_outline,
                          size: 20,
                          color: Colors.grey.shade500,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: const Color(0xFFF8F8F8),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 15,
                        ),
                      ),
                      style: const TextStyle(
                        fontSize: 14,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 15),
                  
                  // Password field
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8F8F8),
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Colors.grey.shade400,
                        ),
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          size: 20,
                          color: Colors.grey.shade500,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: const Color(0xFFF8F8F8),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 15,
                        ),
                      ),
                      style: const TextStyle(
                        fontSize: 14,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 25),
                  
                  // Login button with hover effect
                  GestureDetector(
                    onTapDown: (_) => setState(() => _isButtonPressed = true),
                    onTapUp: (_) {
                      setState(() => _isButtonPressed = false);
                      Navigator.pushReplacementNamed(context, '/home');
                    },
                    onTapCancel: () => setState(() => _isButtonPressed = false),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 150),
                      curve: Curves.easeOut,
                      transform: Matrix4.translationValues(
                        0,
                        _isButtonPressed ? -4 : 0,
                        0,
                      ),
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xFF03AFA6),
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(
                              alpha: _isButtonPressed ? 0.15 : 0.1,
                            ),
                            blurRadius: _isButtonPressed ? 8 : 4,
                            offset: Offset(0, _isButtonPressed ? 4 : 2),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 30),
                  
                  // Divider with "or"
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 1,
                          color: Colors.grey.shade300,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'or',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 14,
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 1,
                          color: Colors.grey.shade300,
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 25),
                  
                  // Social login buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSocialButton(Icons.apple, () {}),
                      const SizedBox(width: 60),
                      _buildSocialButton(
                        Icons.g_mobiledata,
                        () {},
                        isGoogle: true,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButton(
    IconData icon,
    VoidCallback onPressed, {
    bool isGoogle = false,
  }) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: const Color(0xFFF0F0F0),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: IconButton(
        icon: Icon(
          icon,
          size: isGoogle ? 40 : 28,
          color: Colors.black,
        ),
        onPressed: onPressed,
        padding: EdgeInsets.zero,
      ),
    );
  }
}