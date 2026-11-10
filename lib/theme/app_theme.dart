import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Rich Space Dark Palette (Obsidian & Electric Indigo / Sky / Emerald)
  static const Color darkSpace = Color(0xFF080A14); // Deep space background
  static const Color deepSpace = Color(0xFF0D1224); // Elevated canvas surface
  static const Color surfaceDark = Color(0xFF12182E); // Card background
  static const Color surfaceElevated = Color(0xFF192340); // Hover / active card
  static const Color spaceGray = Color(0xFF151D36); // Component background

  // Modern Refined Accents
  static const Color primary = Color(0xFF6366F1); // Electric Indigo
  static const Color primaryLight = Color(0xFF818CF8); // Soft Indigo
  static const Color primaryDark = Color(0xFF4F46E5); // Deep Indigo
  static const Color secondary = Color(0xFF38BDF8); // Sky Blue / Cyan
  static const Color secondaryLight = Color(0xFF7DD3FC); // Light Sky
  static const Color emerald = Color(0xFF10B981); // Mint Emerald (Live / Status)
  static const Color amber = Color(0xFFF59E0B); // Warm Amber (Awards / Honors)
  static const Color rose = Color(0xFFF43F5E); // Subtle Rose
  static const Color purple = Color(0xFFA855F7); // Accent Violet

  // Backwards-compatible aliases
  static const Color neonBlue = Color(0xFF6366F1);
  static const Color neonPurple = Color(0xFF38BDF8);
  static const Color neonPink = Color(0xFFEC4899);
  static const Color glassWhite = Color(0x14FFFFFF);

  // Borders & Dividers
  static const Color borderSubtle = Color(0x2E6366F1); // Subtle indigo hairline
  static const Color borderMedium = Color(0x4D6366F1); // Medium indigo border
  static const Color borderHighlight = Color(0x80818CF8); // Glowing border

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

  static const LinearGradient heroGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF818CF8),
      Color(0xFF38BDF8),
    ],
  );

  static const LinearGradient cardGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0x26192340),
      Color(0x1412182E),
    ],
  );

  static const LinearGradient spaceGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF080A14),
      Color(0xFF0D1224),
      Color(0xFF12182E),
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
    color: surfaceDark.withValues(alpha: 0.75),
    borderRadius: BorderRadius.circular(16),
    border: Border.all(
      color: borderSubtle,
      width: 1,
    ),
    boxShadow: const [
      BoxShadow(
        color: Color(0x4D000000),
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
