import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Ultra-refined Executive Monochrome / Carbon Dark Theme
  // (Zero neon, zero garish glows - Linear / Vercel / Apple Developer inspired)
  static const Color darkSpace = Color(0xFF09090B); // Pure deep zinc background
  static const Color deepSpace = Color(0xFF0E0E11); // Sub-canvas surface
  static const Color surfaceDark = Color(0xFF141417); // Card base surface
  static const Color surfaceElevated = Color(0xFF1A1A1E); // Elevated / hover surface
  static const Color spaceGray = Color(0xFF121215); // Secondary component surface

  // Refined Monochromatic Accents
  static const Color primary = Color(0xFFFFFFFF); // Stark white primary
  static const Color primaryLight = Color(0xFFE4E4E7); // Zinc 200
  static const Color primaryDark = Color(0xFFA1A1AA); // Zinc 400
  static const Color secondary = Color(0xFF71717A); // Zinc 500
  
  // Subtle status tones (restrained, desaturated, non-neon)
  static const Color emerald = Color(0xFF22C55E); // Subtle desaturated indicator
  static const Color amber = Color(0xFFD4D4D8); // Titanium silver for honors
  static const Color rose = Color(0xFFEF4444); // Restrained error state

  // Backwards-compatible aliases - all remapped to sophisticated zinc / silver
  static const Color neonBlue = Color(0xFFFAFAFA); // Remapped: Stark white
  static const Color neonPurple = Color(0xFFD4D4D8); // Remapped: Titanium zinc
  static const Color neonPink = Color(0xFFA1A1AA); // Remapped: Slate zinc
  static const Color glassWhite = Color(0x0AFFFFFF);

  // Borders & Dividers (Crisp 1px architectural lines)
  static const Color borderSubtle = Color(0xFF27272A); // Zinc 800 hairline
  static const Color borderMedium = Color(0xFF3F3F46); // Zinc 700 hover border
  static const Color borderHighlight = Color(0xFF52525B); // Zinc 600

  // High-Readability Monochrome Typography
  static const Color textPrimary = Color(0xFFFAFAFA); // Zinc 50
  static const Color textSecondary = Color(0xFFA1A1AA); // Zinc 400
  static const Color textMuted = Color(0xFF71717A); // Zinc 500
  static const Color textTertiary = Color(0xFFD4D4D8); // Zinc 300

  // Subtle natural dark gradients (Zero neon color bleed)
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFFFFFFF),
      Color(0xFFE4E4E7),
    ],
  );

  static const LinearGradient accentGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF27272A),
      Color(0xFF18181B),
    ],
  );

  static const LinearGradient cardGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF141417),
      Color(0xFF0F0F12),
    ],
  );

  static const LinearGradient spaceGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF09090B),
      Color(0xFF09090B),
    ],
  );

  static const LinearGradient neonGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF27272A),
      Color(0xFF18181B),
    ],
  );

  static BoxDecoration glassmorphism = BoxDecoration(
    color: surfaceDark,
    borderRadius: BorderRadius.circular(12),
    border: Border.all(
      color: borderSubtle,
      width: 1,
    ),
    boxShadow: const [
      BoxShadow(
        color: Color(0x40000000),
        blurRadius: 16,
        offset: Offset(0, 4),
      ),
    ],
  );

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: darkSpace,
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFFFAFAFA),
        secondary: Color(0xFFA1A1AA),
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
