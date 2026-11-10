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

  @override
  void initState() {
    super.initState();
    _ambientController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 14),
    )..repeat();
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

        return Container(
          width: size.width,
          height: size.height,
          color: AppTheme.darkSpace,
          child: AnimatedBuilder(
            animation: _ambientController,
            builder: (context, child) {
              return CustomPaint(
                size: size,
                painter: _AmbientMeshPainter(
                  progress: _ambientController.value,
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class _AmbientMeshPainter extends CustomPainter {
  final double progress;

  _AmbientMeshPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final double angle = progress * 2 * pi;

    // 1. Subtle Architectural Dot Grid
    final dotPaint = Paint()
      ..color = const Color(0x0EFFFFFF)
      ..style = PaintingStyle.fill;

    const double step = 36.0;
    for (double x = 18.0; x < size.width; x += step) {
      for (double y = 18.0; y < size.height; y += step) {
        canvas.drawCircle(Offset(x, y), 0.9, dotPaint);
      }
    }

    // 2. Large Soft Ambient Light Orbs (Gently breathing/moving)
    // Orb 1: Primary Indigo (Top Left / Center)
    final double orb1X = size.width * 0.25 + cos(angle) * 60;
    final double orb1Y = size.height * 0.20 + sin(angle) * 40;
    final double orb1Radius = max(size.width, size.height) * 0.40;

    final Paint orb1Paint = Paint()
      ..shader = RadialGradient(
        colors: [
          AppTheme.primary.withValues(alpha: 0.12),
          AppTheme.primary.withValues(alpha: 0.04),
          Colors.transparent,
        ],
        stops: const [0.0, 0.45, 1.0],
      ).createShader(
        Rect.fromCircle(center: Offset(orb1X, orb1Y), radius: orb1Radius),
      );
    canvas.drawCircle(Offset(orb1X, orb1Y), orb1Radius, orb1Paint);

    // Orb 2: Secondary Sky Blue (Mid-Right)
    final double orb2X = size.width * 0.75 - sin(angle) * 70;
    final double orb2Y = size.height * 0.45 + cos(angle) * 50;
    final double orb2Radius = max(size.width, size.height) * 0.35;

    final Paint orb2Paint = Paint()
      ..shader = RadialGradient(
        colors: [
          AppTheme.secondary.withValues(alpha: 0.09),
          AppTheme.secondary.withValues(alpha: 0.03),
          Colors.transparent,
        ],
        stops: const [0.0, 0.5, 1.0],
      ).createShader(
        Rect.fromCircle(center: Offset(orb2X, orb2Y), radius: orb2Radius),
      );
    canvas.drawCircle(Offset(orb2X, orb2Y), orb2Radius, orb2Paint);

    // Orb 3: Violet Deep Ambient (Bottom-Center / Left)
    final double orb3X = size.width * 0.40 + sin(angle * 0.8) * 80;
    final double orb3Y = size.height * 0.80 - cos(angle * 0.8) * 60;
    final double orb3Radius = max(size.width, size.height) * 0.38;

    final Paint orb3Paint = Paint()
      ..shader = RadialGradient(
        colors: [
          const Color(0xFF8B5CF6).withValues(alpha: 0.08),
          const Color(0xFF8B5CF6).withValues(alpha: 0.02),
          Colors.transparent,
        ],
        stops: const [0.0, 0.5, 1.0],
      ).createShader(
        Rect.fromCircle(center: Offset(orb3X, orb3Y), radius: orb3Radius),
      );
    canvas.drawCircle(Offset(orb3X, orb3Y), orb3Radius, orb3Paint);
  }

  @override
  bool shouldRepaint(_AmbientMeshPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
