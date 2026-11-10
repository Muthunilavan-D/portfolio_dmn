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
  late AnimationController _controller;
  Offset? _mousePosition;
  late final List<_Particle> _particles;
  final Random _random = Random(1337);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();

    // Generate 55 dynamic particles with colorful hues
    final colors = [
      const Color(0xFF818CF8), // Indigo
      const Color(0xFF38BDF8), // Cyan
      const Color(0xFFA855F7), // Violet
      const Color(0xFF34D399), // Emerald
      const Color(0xFFF472B6), // Rose
    ];

    _particles = List.generate(55, (index) {
      return _Particle(
        x: _random.nextDouble(),
        y: _random.nextDouble(),
        vx: (_random.nextDouble() - 0.5) * 0.0006,
        vy: (_random.nextDouble() - 0.5) * 0.0006,
        radius: _random.nextDouble() * 2.2 + 1.2,
        color: colors[index % colors.length],
        alpha: _random.nextDouble() * 0.5 + 0.35,
        pulseSpeed: _random.nextDouble() * 2.5 + 1.0,
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
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
              animation: _controller,
              builder: (context, child) {
                return CustomPaint(
                  size: size,
                  painter: _LiveAuroraParticlePainter(
                    progress: _controller.value,
                    particles: _particles,
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

class _Particle {
  double x;
  double y;
  double vx;
  double vy;
  double radius;
  Color color;
  double alpha;
  double pulseSpeed;

  _Particle({
    required this.x,
    required this.y,
    required this.vx,
    required this.vy,
    required this.radius,
    required this.color,
    required this.alpha,
    required this.pulseSpeed,
  });

  void update() {
    x += vx;
    y += vy;
    if (x < 0) x = 1.0;
    if (x > 1.0) x = 0.0;
    if (y < 0) y = 1.0;
    if (y > 1.0) y = 0.0;
  }
}

class _LiveAuroraParticlePainter extends CustomPainter {
  final double progress;
  final List<_Particle> particles;
  final Offset? mousePosition;

  _LiveAuroraParticlePainter({
    required this.progress,
    required this.particles,
    this.mousePosition,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double angle = progress * 2 * pi;

    // 1. Vibrant Multi-Color Layered Aurora Nebulae (Living fluid background)
    // Layer A: Royal Indigo Glow (Top Left)
    final double aX = size.width * 0.20 + cos(angle) * 110;
    final double aY = size.height * 0.20 + sin(angle) * 70;
    final double aR = max(size.width, size.height) * 0.44;
    final Paint aPaint = Paint()
      ..shader = RadialGradient(
        colors: [
          const Color(0xFF4F46E5).withValues(alpha: 0.32),
          const Color(0xFF6366F1).withValues(alpha: 0.16),
          Colors.transparent,
        ],
        stops: const [0.0, 0.5, 1.0],
      ).createShader(Rect.fromCircle(center: Offset(aX, aY), radius: aR));
    canvas.drawCircle(Offset(aX, aY), aR, aPaint);

    // Layer B: Luminous Cyan / Turquoise Aurora (Center Right)
    final double bX = size.width * 0.82 - sin(angle * 1.1) * 120;
    final double bY = size.height * 0.45 + cos(angle * 1.1) * 80;
    final double bR = max(size.width, size.height) * 0.40;
    final Paint bPaint = Paint()
      ..shader = RadialGradient(
        colors: [
          const Color(0xFF06B6D4).withValues(alpha: 0.28),
          const Color(0xFF0EA5E9).withValues(alpha: 0.14),
          Colors.transparent,
        ],
        stops: const [0.0, 0.48, 1.0],
      ).createShader(Rect.fromCircle(center: Offset(bX, bY), radius: bR));
    canvas.drawCircle(Offset(bX, bY), bR, bPaint);

    // Layer C: Radiant Amethyst Violet (Bottom Left / Mid)
    final double cX = size.width * 0.38 + sin(angle * 0.8) * 130;
    final double cY = size.height * 0.82 - cos(angle * 0.8) * 90;
    final double cR = max(size.width, size.height) * 0.42;
    final Paint cPaint = Paint()
      ..shader = RadialGradient(
        colors: [
          const Color(0xFF8B5CF6).withValues(alpha: 0.26),
          const Color(0xFFA855F7).withValues(alpha: 0.12),
          Colors.transparent,
        ],
        stops: const [0.0, 0.52, 1.0],
      ).createShader(Rect.fromCircle(center: Offset(cX, cY), radius: cR));
    canvas.drawCircle(Offset(cX, cY), cR, cPaint);

    // Layer D: Fuchsia / Rose Accent (Top Right)
    final double dX = size.width * 0.70 + cos(angle * 0.9) * 90;
    final double dY = size.height * 0.15 - sin(angle * 0.9) * 60;
    final double dR = max(size.width, size.height) * 0.32;
    final Paint dPaint = Paint()
      ..shader = RadialGradient(
        colors: [
          const Color(0xFFEC4899).withValues(alpha: 0.20),
          const Color(0xFFD946EF).withValues(alpha: 0.08),
          Colors.transparent,
        ],
        stops: const [0.0, 0.5, 1.0],
      ).createShader(Rect.fromCircle(center: Offset(dX, dY), radius: dR));
    canvas.drawCircle(Offset(dX, dY), dR, dPaint);

    // Layer E: Mint Emerald Aurora (Bottom Right)
    final double eX = size.width * 0.78 + sin(angle * 1.3) * 70;
    final double eY = size.height * 0.78 + cos(angle * 1.3) * 60;
    final double eR = max(size.width, size.height) * 0.30;
    final Paint ePaint = Paint()
      ..shader = RadialGradient(
        colors: [
          const Color(0xFF10B981).withValues(alpha: 0.20),
          const Color(0xFF059669).withValues(alpha: 0.06),
          Colors.transparent,
        ],
        stops: const [0.0, 0.5, 1.0],
      ).createShader(Rect.fromCircle(center: Offset(eX, eY), radius: eR));
    canvas.drawCircle(Offset(eX, eY), eR, ePaint);

    // 2. Flowing Animated Harmonic Wave Ribbons
    _drawFlowingWaves(canvas, size, angle);

    // 3. Interactive Living Constellation Network
    _drawConstellationNetwork(canvas, size);

    // 4. Interactive Mouse-Following Aurora Glow
    if (mousePosition != null) {
      final double cursorRadius = 340.0;
      final Paint mousePaint = Paint()
        ..shader = RadialGradient(
          colors: [
            const Color(0xFF6366F1).withValues(alpha: 0.28),
            const Color(0xFF06B6D4).withValues(alpha: 0.12),
            Colors.transparent,
          ],
          stops: const [0.0, 0.45, 1.0],
        ).createShader(
          Rect.fromCircle(center: mousePosition!, radius: cursorRadius),
        );
      canvas.drawCircle(mousePosition!, cursorRadius, mousePaint);
    }
  }

  void _drawFlowingWaves(Canvas canvas, Size size, double angle) {
    final wavePaint1 = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.4
      ..shader = const LinearGradient(
        colors: [
          Color(0x336366F1),
          Color(0x4D06B6D4),
          Color(0x33A855F7),
          Colors.transparent,
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final wavePaint2 = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0
      ..shader = const LinearGradient(
        colors: [
          Colors.transparent,
          Color(0x33EC4899),
          Color(0x446366F1),
          Color(0x2210B981),
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final path1 = Path();
    final path2 = Path();

    final double midY1 = size.height * 0.35;
    final double midY2 = size.height * 0.65;

    path1.moveTo(0, midY1 + sin(angle) * 40);
    path2.moveTo(0, midY2 + cos(angle * 0.8) * 45);

    const int steps = 24;
    final double dx = size.width / steps;

    for (int i = 1; i <= steps; i++) {
      final double x = i * dx;
      final double y1 = midY1 + sin(angle + i * 0.35) * 50 + cos(i * 0.2) * 20;
      final double y2 = midY2 + cos(angle * 0.7 + i * 0.4) * 45 + sin(i * 0.3) * 25;
      path1.lineTo(x, y1);
      path2.lineTo(x, y2);
    }

    canvas.drawPath(path1, wavePaint1);
    canvas.drawPath(path2, wavePaint2);
  }

  void _drawConstellationNetwork(Canvas canvas, Size size) {
    final List<Offset> positions = [];

    // Update and draw particles
    for (final p in particles) {
      p.update();

      double posX = p.x * size.width;
      double posY = p.y * size.height;

      // Mouse interactive deflection
      if (mousePosition != null) {
        final double distToMouse =
            sqrt(pow(posX - mousePosition!.dx, 2) + pow(posY - mousePosition!.dy, 2));
        if (distToMouse < 140 && distToMouse > 0) {
          final double force = (140 - distToMouse) / 140;
          final double angle =
              atan2(posY - mousePosition!.dy, posX - mousePosition!.dx);
          posX += cos(angle) * force * 18;
          posY += sin(angle) * force * 18;
        }
      }

      positions.add(Offset(posX, posY));

      final pulse = sin(progress * 2 * pi * p.pulseSpeed);
      final double currentAlpha = (p.alpha + pulse * 0.25).clamp(0.2, 0.95);

      final pPaint = Paint()
        ..color = p.color.withValues(alpha: currentAlpha)
        ..style = PaintingStyle.fill;

      canvas.drawCircle(Offset(posX, posY), p.radius, pPaint);
    }

    // Draw constellation lines between nearby particles
    final linePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.8;

    const double maxConnectionDist = 110.0;
    final int count = positions.length;

    for (int i = 0; i < count; i++) {
      for (int j = i + 1; j < count; j++) {
        final p1 = positions[i];
        final p2 = positions[j];
        final double dist = sqrt(pow(p1.dx - p2.dx, 2) + pow(p1.dy - p2.dy, 2));

        if (dist < maxConnectionDist) {
          final double lineAlpha =
              ((1.0 - (dist / maxConnectionDist)) * 0.28).clamp(0.0, 0.35);
          linePaint.color = const Color(0xFF818CF8).withValues(alpha: lineAlpha);
          canvas.drawLine(p1, p2, linePaint);
        }
      }

      // Draw connection to mouse if nearby
      if (mousePosition != null) {
        final p = positions[i];
        final double distMouse =
            sqrt(pow(p.dx - mousePosition!.dx, 2) + pow(p.dy - mousePosition!.dy, 2));
        if (distMouse < 150) {
          final double alpha = ((1.0 - (distMouse / 150)) * 0.45).clamp(0.0, 0.55);
          linePaint.color = const Color(0xFF38BDF8).withValues(alpha: alpha);
          canvas.drawLine(p, mousePosition!, linePaint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(_LiveAuroraParticlePainter oldDelegate) => true;
}
