import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Primary Colors from Figma
  static const Color primaryColor = Color(0xFF0B95A4);
  static const Color loginBackground = Color(0xA103CA8B); // rgba(3,202,181,0.63)
  static const Color bookingBackground = Color(0xF7037265); // rgba(3,114,101,0.97)
  static const Color tealAccent = Color(0xFF0BCE97);
  static const Color darkTeal = Color(0xFF036140);
  
  // Text Colors
  static const Color textPrimary = Color(0xFF000000);
  static const Color textSecondary = Color(0xA8000000); // rgba(0,0,0,0.65)
  static const Color textTertiary = Color(0x88000000); // rgba(0,0,0,0.53)
  static const Color textOrange = Color(0xFFF37821);
  static const Color textRed = Color(0xD9FF2525); // rgba(255,37,37,0.85)
  
  // Card/Background Colors
  static const Color cardBackground = Color(0xFFF4FFFE);
  static const Color whiteSemi = Color(0xE1FDFDFD); // rgba(253,253,253,0.88)
  static const Color bottomNavBackground = Color(0xFFEFF3F4);
  
  // Border Colors
  static const Color borderLight = Color(0x07000000); // rgba(0,0,0,0.07)
  static const Color borderTeal = Color(0x8F03B482); // rgba(3,180,130,0.56)
  static const Color borderBlue = Color(0x8F0341B4); // rgba(3,65,180,0.56)
  
  // Shadow Colors
  static const Color shadow = Color(0x40000000); // rgba(0,0,0,0.25)
  
  // YanaWay Brand Color
  static const Color brandText = Color(0xFF08555D);
  
  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.light(
        primary: primaryColor,
        secondary: tealAccent,
        surface: Colors.white,
        error: Colors.red,
      ),
      textTheme: GoogleFonts.robotoTextTheme(),
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: textPrimary,
        centerTitle: true,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 4,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
  
  // Custom text styles matching Figma
  static TextStyle get yanawayLogo => GoogleFonts.turretRoad(
    fontSize: 24,
    fontWeight: FontWeight.w800,
    color: textPrimary,
    shadows: [
      Shadow(
        offset: const Offset(0, 5),
        blurRadius: 4,
        color: shadow,
      ),
    ],
  );
  
  static TextStyle get tagline => GoogleFonts.roboto(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: Color(0xAB08555D), // rgba(8,85,93,0.67)
    shadows: [
      Shadow(
        offset: const Offset(0, 4),
        blurRadius: 4,
        color: shadow,
      ),
    ],
  );
  
  static TextStyle get loginButtonText => GoogleFonts.roboto(
    fontSize: 17,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
}
