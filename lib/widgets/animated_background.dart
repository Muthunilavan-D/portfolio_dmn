import 'dart:math';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AnimatedBackground extends StatefulWidget {
  const AnimatedBackground({super.key});

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _ambientController;
  Offset? _mousePosition;

  // Statically seeded particles for consistent beautiful drifting
  late final List<_DriftingStar> _stars;

  @override
  void initState() {
    super.initState();
    _ambientController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 16),
    )..repeat();

    final rand = Random(42);
    _stars = List.generate(50, (index) {
      return _DriftingStar(
        initialX: rand.nextDouble(),
        initialY: rand.nextDouble(),
        radius: rand.nextDouble() * 1.8 + 0.8,
        speed: rand.nextDouble() * 0.4 + 0.2,
        baseAlpha: rand.nextDouble() * 0.5 + 0.25,
        pulseSpeed: rand.nextDouble() * 3 + 1,
      );
    });
  }

  @override
  void dispose() {
    _ambientController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = Size(constraints.maxWidth, constraints.maxHeight);

        return MouseRegion(
          onHover: (event) {
            setState(() {
              _mousePosition = event.localPosition;
            });
          },
          onExit: (_) {
            setState(() {
              _mousePosition = null;
            });
          },
          child: Container(
            width: size.width,
            height: size.height,
            color: AppTheme.darkSpace,
            child: AnimatedBuilder(
              animation: _ambientController,
              builder: (context, child) {
                return CustomPaint(
                  size: size,
                  painter: _LivelyCosmicPainter(
                    progress: _ambientController.value,
                    stars: _stars,
                    mousePosition: _mousePosition,
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class _DriftingStar {
  final double initialX;
  final double initialY;
  final double radius;
  final double speed;
  final double baseAlpha;
  final double pulseSpeed;

  _DriftingStar({
    required this.initialX,
    required this.initialY,
    required this.radius,
    required this.speed,
    required this.baseAlpha,
    required this.pulseSpeed,
  });
}

class _LivelyCosmicPainter extends CustomPainter {
  final double progress;
  final List<_DriftingStar> stars;
  final Offset? mousePosition;

  _LivelyCosmicPainter({
    required this.progress,
    required this.stars,
    this.mousePosition,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double angle = progress * 2 * pi;

    // 1. Visible Architectural Micro-Grid (Subtle Electric Indigo Tint)
    final gridPaint = Paint()
      ..color = const Color(0x186366F1) // Visible indigo grid
      ..style = PaintingStyle.fill;

    const double step = 34.0;
    for (double x = 17.0; x < size.width; x += step) {
      for (double y = 17.0; y < size.height; y += step) {
        canvas.drawCircle(Offset(x, y), 0.9, gridPaint);
      }
    }

    // 2. Large Visible Luminous Ambient Glow Orbs
    // Orb 1: Electric Indigo (Top-Left / Center-Left)
    final double orb1X = size.width * 0.22 + cos(angle) * 80;
    final double orb1Y = size.height * 0.18 + sin(angle) * 55;
    final double orb1Radius = max(size.width, size.height) * 0.42;

    final Paint orb1Paint = Paint()
      ..shader = RadialGradient(
        colors: [
          const Color(0xFF6366F1).withValues(alpha: 0.28), // Clearly visible
          const Color(0xFF4F46E5).withValues(alpha: 0.12),
          Colors.transparent,
        ],
        stops: const [0.0, 0.45, 1.0],
      ).createShader(
        Rect.fromCircle(center: Offset(orb1X, orb1Y), radius: orb1Radius),
      );
    canvas.drawCircle(Offset(orb1X, orb1Y), orb1Radius, orb1Paint);

    // Orb 2: Royal Sapphire / Cyan (Mid-Right)
    final double orb2X = size.width * 0.80 - sin(angle) * 90;
    final double orb2Y = size.height * 0.45 + cos(angle) * 65;
    final double orb2Radius = max(size.width, size.height) * 0.38;

    final Paint orb2Paint = Paint()
      ..shader = RadialGradient(
        colors: [
          const Color(0xFF0EA5E9).withValues(alpha: 0.22), // Clearly visible
          const Color(0xFF38BDF8).withValues(alpha: 0.09),
          Colors.transparent,
        ],
        stops: const [0.0, 0.5, 1.0],
      ).createShader(
        Rect.fromCircle(center: Offset(orb2X, orb2Y), radius: orb2Radius),
      );
    canvas.drawCircle(Offset(orb2X, orb2Y), orb2Radius, orb2Paint);

    // Orb 3: Deep Amethyst / Violet (Bottom-Left / Center)
    final double orb3X = size.width * 0.35 + sin(angle * 0.8) * 95;
    final double orb3Y = size.height * 0.82 - cos(angle * 0.8) * 75;
    final double orb3Radius = max(size.width, size.height) * 0.40;

    final Paint orb3Paint = Paint()
      ..shader = RadialGradient(
        colors: [
          const Color(0xFF8B5CF6).withValues(alpha: 0.24), // Clearly visible
          const Color(0xFF6D28D9).withValues(alpha: 0.08),
          Colors.transparent,
        ],
        stops: const [0.0, 0.48, 1.0],
      ).createShader(
        Rect.fromCircle(center: Offset(orb3X, orb3Y), radius: orb3Radius),
      );
    canvas.drawCircle(Offset(orb3X, orb3Y), orb3Radius, orb3Paint);

    // Orb 4: Subtle Emerald Aurora Accent (Mid-Bottom-Right)
    final double orb4X = size.width * 0.70 + cos(angle * 1.2) * 60;
    final double orb4Y = size.height * 0.72 + sin(angle * 1.2) * 50;
    final double orb4Radius = max(size.width, size.height) * 0.30;

    final Paint orb4Paint = Paint()
      ..shader = RadialGradient(
        colors: [
          const Color(0xFF10B981).withValues(alpha: 0.16),
          Colors.transparent,
        ],
        stops: const [0.0, 1.0],
      ).createShader(
        Rect.fromCircle(center: Offset(orb4X, orb4Y), radius: orb4Radius),
      );
    canvas.drawCircle(Offset(orb4X, orb4Y), orb4Radius, orb4Paint);

    // 3. Drifting Twinkling Star / Sparkle Particles
    final starPaint = Paint()..style = PaintingStyle.fill;
    for (final star in stars) {
      final double currentY = (star.initialY - progress * star.speed) % 1.0;
      final double posX = star.initialX * size.width;
      final double posY = currentY * size.height;

      final double pulse = sin(progress * 2 * pi * star.pulseSpeed);
      final double alpha = (star.baseAlpha + pulse * 0.2).clamp(0.15, 0.85);

      starPaint.color = Colors.white.withValues(alpha: alpha);
      canvas.drawCircle(Offset(posX, posY), star.radius, starPaint);
    }

    // 4. Interactive Mouse-Following Spotlight (Lively & Responsive)
    if (mousePosition != null) {
      final double cursorGlowRadius = 320.0;
      final Paint cursorPaint = Paint()
        ..shader = RadialGradient(
          colors: [
            const Color(0xFF6366F1).withValues(alpha: 0.20),
            const Color(0xFF38BDF8).withValues(alpha: 0.08),
            Colors.transparent,
          ],
          stops: const [0.0, 0.45, 1.0],
        ).createShader(
          Rect.fromCircle(center: mousePosition!, radius: cursorGlowRadius),
        );
      canvas.drawCircle(mousePosition!, cursorGlowRadius, cursorPaint);
    }
  }

  @override
  bool shouldRepaint(_LivelyCosmicPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.mousePosition != mousePosition;
  }
}
