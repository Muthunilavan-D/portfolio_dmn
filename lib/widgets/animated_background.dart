import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AnimatedBackground extends StatelessWidget {
  const AnimatedBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.darkSpace,
      child: CustomPaint(
        painter: _ArchitecturalGridPainter(),
      ),
    );
  }
}

class _ArchitecturalGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // 1. Ultra-subtle micro dot grid (pure monochrome zinc)
    final dotPaint = Paint()
      ..color = const Color(0x14FFFFFF) // 8% white, very discreet
      ..style = PaintingStyle.fill;

    const double step = 32.0;
    for (double x = 16.0; x < size.width; x += step) {
      for (double y = 16.0; y < size.height; y += step) {
        canvas.drawCircle(Offset(x, y), 0.75, dotPaint);
      }
    }

    // 2. Subtle radial gradient mask from top center (soft natural falloff)
    final vignettePaint = Paint()
      ..shader = RadialGradient(
        center: const Alignment(0.0, -0.6),
        radius: 1.2,
        colors: [
          const Color(0x0AFFFFFF),
          Colors.transparent,
        ],
        stops: const [0.0, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), vignettePaint);
  }

  @override
  bool shouldRepaint(_ArchitecturalGridPainter oldDelegate) => false;
}
