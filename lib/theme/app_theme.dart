import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Ultra-modern Dark Palette (Obsidian & Electric Indigo / Sky / Emerald)
  static const Color darkSpace = Color(0xFF090A10); // Rich obsidian background
  static const Color deepSpace = Color(0xFF0E111B); // Elevated surface
  static const Color surfaceDark = Color(0xFF141726); // Card background
  static const Color surfaceElevated = Color(0xFF1A1F33); // Hover / active card
  static const Color spaceGray = Color(0xFF161928); // Component background

  // Modern Refined Accents
  static const Color primary = Color(0xFF6366F1); // Electric Indigo
  static const Color primaryLight = Color(0xFF818CF8); // Soft Indigo
  static const Color primaryDark = Color(0xFF4F46E5); // Deep Indigo
  static const Color secondary = Color(0xFF38BDF8); // Sky Blue / Cyan
  static const Color emerald = Color(0xFF10B981); // Mint Emerald (Live / Status)
  static const Color amber = Color(0xFFF59E0B); // Warm Amber (Awards / Honors)
  static const Color rose = Color(0xFFF43F5E); // Subtle Rose

  // Backwards-compatible aliases with modern refined hues
  static const Color neonBlue = Color(0xFF6366F1); // Replaced harsh cyan with modern Indigo
  static const Color neonPurple = Color(0xFF38BDF8); // Replaced harsh magenta with Sky Blue
  static const Color neonPink = Color(0xFFEC4899); // Soft modern pink
  static const Color glassWhite = Color(0x0FFFFFFF); // Subtle white glass

  // Borders & Dividers
  static const Color borderSubtle = Color(0x1FFFFFFF); // 12% white hairline
  static const Color borderMedium = Color(0x336366F1); // Subtle indigo border
  static const Color borderHighlight = Color(0x66818CF8); // Glowing border

  // Text Colors (High contrast, zero eye-strain)
  static const Color textPrimary = Color(0xFFF8FAFC); // Slate 50
  static const Color textSecondary = Color(0xFF94A3B8); // Slate 400
  static const Color textMuted = Color(0xFF64748B); // Slate 500
  static const Color textTertiary = Color(0xFFCBD5E1); // Slate 300

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF6366F1),
      Color(0xFF4F46E5),
    ],
  );

  static const LinearGradient accentGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF6366F1),
      Color(0xFF38BDF8),
    ],
  );

  static const LinearGradient cardGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0x1FFFFFFF),
      Color(0x08FFFFFF),
    ],
  );

  // Backwards-compatible gradients
  static const LinearGradient spaceGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF090A10),
      Color(0xFF0E111B),
      Color(0xFF141726),
    ],
  );

  static const LinearGradient neonGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF6366F1),
      Color(0xFF38BDF8),
    ],
  );

  static BoxDecoration glassmorphism = BoxDecoration(
    color: surfaceDark.withValues(alpha: 0.7),
    borderRadius: BorderRadius.circular(16),
    border: Border.all(
      color: borderSubtle,
      width: 1,
    ),
    boxShadow: const [
      BoxShadow(
        color: Color(0x26000000),
        blurRadius: 20,
        offset: Offset(0, 8),
      ),
    ],
  );

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: darkSpace,
      colorScheme: const ColorScheme.dark(
        primary: primary,
        secondary: secondary,
        surface: surfaceDark,
      ),
      textTheme: GoogleFonts.plusJakartaSansTextTheme().apply(
        bodyColor: textPrimary,
        displayColor: textPrimary,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.plusJakartaSans(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: textPrimary,
        ),
      ),
    );
  }
}
