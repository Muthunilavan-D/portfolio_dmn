import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Space-themed dark neon colors
  static const Color darkSpace = Color(0xFF000000); // Pure black
  static const Color deepSpace = Color(0xFF0A0A0A); // Near-black
  static const Color neonBlue = Color(0xFF00D9FF);
  static const Color neonPurple = Color(0xFFB026FF);
  static const Color neonPink = Color(0xFFFF00E5);
  static const Color spaceGray = Color(0xFF1A1A1A); // Dark gray for black background
  static const Color glassWhite = Color(0x2AFFFFFF); // Increased opacity for better visibility
  
  // Text colors for better contrast
  static const Color textPrimary = Color(0xFFFFFFFF); // Pure white
  static const Color textSecondary = Color(0xFFE0E0E0); // Light gray
  static const Color textTertiary = Color(0xFFCCCCCC); // Medium gray
  
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: darkSpace,
      colorScheme: const ColorScheme.dark(
        primary: neonBlue,
        secondary: neonPurple,
        surface: spaceGray,
        background: darkSpace,
      ),
      textTheme: GoogleFonts.interTextTheme().apply(
        bodyColor: Colors.white,
        displayColor: Colors.white,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.inter(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
  
  // Gradient backgrounds
  static const LinearGradient spaceGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF0A0E27),
      Color(0xFF1A1F3A),
      Color(0xFF0F1624),
    ],
  );
  
  static const LinearGradient neonGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      neonBlue,
      neonPurple,
      neonPink,
    ],
  );
  
  static BoxDecoration glassmorphism = BoxDecoration(
    color: glassWhite,
    borderRadius: BorderRadius.circular(20),
    border: Border.all(
      color: neonBlue.withOpacity(0.4),
      width: 1,
    ),
    boxShadow: [
      BoxShadow(
        color: neonBlue.withOpacity(0.15),
        blurRadius: 20,
        spreadRadius: 0,
      ),
    ],
  );
}
