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

    // 55 dynamic particles with astrological / cosmic hues
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

    // 1. Vibrant Multi-Color Layered Aurora Nebulae (Living fluid galaxy background)
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

    // 4. Anime Comets / Shooting Stars Moving Diagonally Across the Sky
    _drawAnimeComets(canvas, size);

    // 5. Interactive Mouse-Following Aurora Glow
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

  /// Realistic anime celestial comets with organic asymmetric tails,
  /// aerodynamic plasma heads, gravitational curvature, and full-span travel.
  void _drawAnimeComets(Canvas canvas, Size size) {
    // Comet 1: The Great Celestial Meteor (sweeps top-right across full screen to bottom-left)
    _renderRealisticComet(
      canvas: canvas,
      size: size,
      startProgress: 0.05,
      durationProgress: 0.18,
      start: Offset(size.width * 1.06, -size.height * 0.05),
      end: Offset(-size.width * 0.10, size.height * 1.06),
      arcOffset: Offset(-size.width * 0.05, size.height * 0.04),
      headColor: Colors.white,
      ionColor: const Color(0xFF67E8F9), // Electric Cyan
      trailColor: const Color(0xFF38BDF8), // Sky Blue
      dustColor: const Color(0xFFA855F7), // Cosmic Violet
      tailLength: max(size.width, size.height) * 0.32,
      headRadius: 3.6,
      leewardBias: 1.0, // Curves and spreads organically toward leeward side
    );

    // Comet 2: Swift Amethyst Shooting Star (sweeps top-left across full screen to bottom-right)
    _renderRealisticComet(
      canvas: canvas,
      size: size,
      startProgress: 0.42,
      durationProgress: 0.16,
      start: Offset(-size.width * 0.08, size.height * 0.04),
      end: Offset(size.width * 1.10, size.height * 1.02),
      arcOffset: Offset(size.width * 0.04, size.height * 0.05),
      headColor: Colors.white,
      ionColor: const Color(0xFFE0E7FF), // Bright Indigo
      trailColor: const Color(0xFF818CF8), // Indigo
      dustColor: const Color(0xFFEC4899), // Rose
      tailLength: max(size.width, size.height) * 0.26,
      headRadius: 3.0,
      leewardBias: -1.0,
    );

    // Comet 3: Midnight Emerald Bolide (sweeps upper right across full screen to bottom-left)
    _renderRealisticComet(
      canvas: canvas,
      size: size,
      startProgress: 0.74,
      durationProgress: 0.17,
      start: Offset(size.width * 0.88, -size.height * 0.06),
      end: Offset(-size.width * 0.08, size.height * 1.08),
      arcOffset: Offset(-size.width * 0.06, size.height * 0.03),
      headColor: Colors.white,
      ionColor: const Color(0xFF6EE7B7), // Mint
      trailColor: const Color(0xFF06B6D4), // Cyan
      dustColor: const Color(0xFF10B981), // Emerald
      tailLength: max(size.width, size.height) * 0.28,
      headRadius: 3.2,
      leewardBias: 1.0,
    );
  }

  void _renderRealisticComet({
    required Canvas canvas,
    required Size size,
    required double startProgress,
    required double durationProgress,
    required Offset start,
    required Offset end,
    required Offset arcOffset,
    required Color headColor,
    required Color ionColor,
    required Color trailColor,
    required Color dustColor,
    required double tailLength,
    required double headRadius,
    required double leewardBias,
  }) {
    // Check active window
    double t = (progress - startProgress) / durationProgress;
    if (t < 0.0 || t > 1.0) return;

    // 1. Natural Gravitational Arc (Quadratic Bézier Trajectory)
    final Offset midControl = Offset(
      (start.dx + end.dx) * 0.5 + arcOffset.dx,
      (start.dy + end.dy) * 0.5 + arcOffset.dy,
    );

    final double omt = 1.0 - t;
    final double headX =
        omt * omt * start.dx + 2 * omt * t * midControl.dx + t * t * end.dx;
    final double headY =
        omt * omt * start.dy + 2 * omt * t * midControl.dy + t * t * end.dy;

    // Tangent velocity vector at current t: B'(t) = 2(1-t)(P1-P0) + 2t(P2-P1)
    final double vx =
        2 * omt * (midControl.dx - start.dx) + 2 * t * (end.dx - midControl.dx);
    final double vy =
        2 * omt * (midControl.dy - start.dy) + 2 * t * (end.dy - midControl.dy);
    final double speed = sqrt(vx * vx + vy * vy);
    if (speed <= 0.001) return;

    final double dirX = vx / speed;
    final double dirY = vy / speed;
    final double perpX = -dirY;
    final double perpY = dirX;

    // 2. Realistic Incandescent Alpha Envelope:
    // Stays brilliantly bright across 88% of the path, and only dissolves near the very end!
    double cometAlpha;
    if (t < 0.08) {
      // Rapid atmospheric entry ignition
      cometAlpha = (t / 0.08);
    } else if (t < 0.88) {
      // Sustained bright incandescent burn with natural ablation shimmer
      final double microFlicker = 0.94 + 0.06 * sin(t * 45.0);
      cometAlpha = microFlicker;
    } else {
      // Terminal burnout only in the final 12% near the very bottom/end
      final double fade = (1.0 - t) / 0.12;
      cometAlpha = (fade * fade).clamp(0.0, 1.0);
    }

    if (cometAlpha <= 0.005) return;

    final double currentTailLength =
        tailLength * (0.85 + 0.30 * sin(t * pi * 0.9));

    // 3. Asymmetric Organic Vapor Plume (Multi-Segment Mesh)
    // Leeward side has higher turbulent expansion and wave drift than windward side
    const int segments = 6;
    final List<Offset> leftPoints = [];
    final List<Offset> rightPoints = [];

    for (int i = 0; i <= segments; i++) {
      final double s = i / segments.toDouble();
      final double d = currentTailLength * s;

      // Organic expansion and taper curves
      final double taper = (1.0 - s * s);
      final double leftWidth =
          (headRadius * (0.8 + 2.2 * s) * taper).clamp(0.0, 40.0);
      final double rightWidth =
          (headRadius * (1.6 + 5.2 * s) * taper).clamp(0.0, 60.0);

      // Atmospheric shear wave flutter
      final double flutter = sin(s * 7.0 + t * 18.0) * (3.0 * s);

      final double pX = headX - dirX * d;
      final double pY = headY - dirY * d;

      if (leewardBias >= 0) {
        // Right side is leeward (wider + flutter)
        leftPoints.add(Offset(
          pX - perpX * leftWidth,
          pY - perpY * leftWidth,
        ));
        rightPoints.add(Offset(
          pX + perpX * (rightWidth + flutter),
          pY + perpY * (rightWidth + flutter),
        ));
      } else {
        // Left side is leeward (wider + flutter)
        leftPoints.add(Offset(
          pX - perpX * (rightWidth + flutter),
          pY - perpY * (rightWidth + flutter),
        ));
        rightPoints.add(Offset(
          pX + perpX * leftWidth,
          pY + perpY * leftWidth,
        ));
      }
    }

    // Assemble asymmetric closed path
    final Path tailPath = Path();
    tailPath.moveTo(headX, headY);
    for (final pt in rightPoints) {
      tailPath.lineTo(pt.dx, pt.dy);
    }
    for (int i = leftPoints.length - 1; i >= 0; i--) {
      tailPath.lineTo(leftPoints[i].dx, leftPoints[i].dy);
    }
    tailPath.close();

    final Offset tailEnd = Offset(
      headX - dirX * currentTailLength,
      headY - dirY * currentTailLength,
    );

    final Paint tailPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          headColor.withValues(alpha: 0.95 * cometAlpha),
          trailColor.withValues(alpha: 0.70 * cometAlpha),
          dustColor.withValues(alpha: 0.30 * cometAlpha),
          Colors.transparent,
        ],
        stops: const [0.0, 0.25, 0.65, 1.0],
      ).createShader(Rect.fromPoints(Offset(headX, headY), tailEnd))
      ..style = PaintingStyle.fill;

    canvas.drawPath(tailPath, tailPaint);

    // 4. Razor-Sharp Ultra-Bright Ion Needle (Central Plasma Stream)
    final Paint ionPaint = Paint()
      ..shader = LinearGradient(
        colors: [
          Colors.white.withValues(alpha: 1.0 * cometAlpha),
          ionColor.withValues(alpha: 0.85 * cometAlpha),
          trailColor.withValues(alpha: 0.40 * cometAlpha),
          Colors.transparent,
        ],
        stops: const [0.0, 0.20, 0.60, 1.0],
      ).createShader(Rect.fromPoints(
        Offset(headX, headY),
        Offset(headX - dirX * (currentTailLength * 0.75),
            headY - dirY * (currentTailLength * 0.75)),
      ))
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    canvas.drawLine(
      Offset(headX, headY),
      Offset(headX - dirX * (currentTailLength * 0.75),
          headY - dirY * (currentTailLength * 0.75)),
      ionPaint,
    );

    // 5. Asymmetric Organic Stardust & Ablation Embers (18 distinct sparks)
    final Paint sparkPaint = Paint()..style = PaintingStyle.fill;
    for (int i = 0; i < 18; i++) {
      // Deterministic pseudo-random seed per spark index
      final double seed1 = ((i * 37.17) % 1.0);
      final double seed2 = ((i * 91.53) % 1.0);
      final double sFrac = (i + 1) / 19.0;

      // Asymmetric lateral drift: biased toward leeward side
      final double lateralOffset =
          (seed1 - (leewardBias > 0 ? 0.30 : 0.70)) * (10.0 + 32.0 * sFrac);
      final double lag =
          currentTailLength * sFrac + (seed2 - 0.5) * 14.0;

      final double spX = headX - dirX * lag + perpX * lateralOffset;
      final double spY = headY - dirY * lag + perpY * lateralOffset;

      // Micro-shimmer for individual burning embers
      final double emberPulse = 0.6 + 0.4 * sin(t * 35.0 + i * 2.5);
      final double sparkAlpha =
          ((1.0 - sFrac) * cometAlpha * emberPulse).clamp(0.0, 1.0);
      final double sparkRadius =
          (0.8 + seed1 * 1.6) * (1.0 - sFrac * 0.55);

      // Color shifts from incandescent white to ion to cooling ember
      Color spColor;
      if (sFrac < 0.25) {
        spColor = Colors.white;
      } else if (sFrac < 0.60) {
        spColor = (i % 2 == 0) ? ionColor : trailColor;
      } else {
        spColor = dustColor;
      }

      sparkPaint.color = spColor.withValues(alpha: sparkAlpha);
      canvas.drawCircle(Offset(spX, spY), sparkRadius, sparkPaint);
    }

    // 6. Aerodynamic Oblong Plasma Head (Teardrop / Rotated Ellipse)
    canvas.save();
    canvas.translate(headX, headY);
    final double headingAngle = atan2(dirY, dirX);
    canvas.rotate(headingAngle);

    // Forward shockwave glow (offset slightly in front)
    final Paint shockPaint = Paint()
      ..shader = RadialGradient(
        colors: [
          headColor.withValues(alpha: 0.90 * cometAlpha),
          ionColor.withValues(alpha: 0.60 * cometAlpha),
          Colors.transparent,
        ],
        stops: const [0.0, 0.40, 1.0],
      ).createShader(Rect.fromCircle(
          center: const Offset(1.5, 0), radius: headRadius * 3.5));

    canvas.drawCircle(const Offset(1.5, 0), headRadius * 3.5, shockPaint);

    // Oblong teardrop incandescent core (compressed horizontally, stretched along heading)
    final Paint coreGlow = Paint()
      ..shader = RadialGradient(
        colors: [
          Colors.white.withValues(alpha: 1.0 * cometAlpha),
          ionColor.withValues(alpha: 0.75 * cometAlpha),
          Colors.transparent,
        ],
        stops: const [0.0, 0.50, 1.0],
      ).createShader(Rect.fromCenter(
        center: Offset.zero,
        width: headRadius * 4.5,
        height: headRadius * 2.8,
      ));

    canvas.drawOval(
      Rect.fromCenter(
        center: Offset.zero,
        width: headRadius * 4.5,
        height: headRadius * 2.8,
      ),
      coreGlow,
    );

    // Pure incandescent white nucleus
    final Paint nucleusPaint = Paint()
      ..color = Colors.white.withValues(alpha: cometAlpha)
      ..style = PaintingStyle.fill;

    canvas.drawOval(
      Rect.fromCenter(
        center: const Offset(0.5, 0),
        width: headRadius * 2.2,
        height: headRadius * 1.5,
      ),
      nucleusPaint,
    );

    canvas.restore();
  }

  @override
  bool shouldRepaint(_LiveAuroraParticlePainter oldDelegate) => true;
}
