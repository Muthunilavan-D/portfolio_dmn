import 'dart:math';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AnimatedBackground extends StatefulWidget {
  const AnimatedBackground({super.key});

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with TickerProviderStateMixin {
  late AnimationController _particleController;
  final Random _random = Random();
  final List<_Particle> _particles = [];
  static const int _particleCount = 60;
  static const double _connectionDistance = 150;

  @override
  void initState() {
    super.initState();

    _particleController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();

    _initializeParticles();
  }

  void _initializeParticles() {
    for (int i = 0; i < _particleCount; i++) {
      _particles.add(
        _Particle(
          x: _random.nextDouble(),
          y: _random.nextDouble(),
          vx: (_random.nextDouble() - 0.5) * 0.2,
          vy: (_random.nextDouble() - 0.5) * 0.2,
          size: _random.nextDouble() * 2 + 1.5,
        ),
      );
    }
  }

  @override
  void dispose() {
    _particleController.dispose();
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
          color: Colors.black,
          child: AnimatedBuilder(
            animation: _particleController,
            builder: (context, child) {
              return CustomPaint(
                size: size,
                painter: _ParticleNetworkPainter(
                  particles: _particles,
                  animationValue: _particleController.value,
                  size: size,
                  connectionDistance: _connectionDistance,
                ),
              );
            },
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
  double size;

  _Particle({
    required this.x,
    required this.y,
    required this.vx,
    required this.vy,
    required this.size,
  });
}

class _ParticleNetworkPainter extends CustomPainter {
  final List<_Particle> particles;
  final double animationValue;
  final Size size;
  final double connectionDistance;

  _ParticleNetworkPainter({
    required this.particles,
    required this.animationValue,
    required this.size,
    required this.connectionDistance,
  });

  @override
  void paint(Canvas canvas, Size canvasSize) {
    // Update particle positions
    for (var particle in particles) {
      particle.x += particle.vx * 0.01;
      particle.y += particle.vy * 0.01;

      // Wrap around edges
      if (particle.x < 0) particle.x = 1;
      if (particle.x > 1) particle.x = 0;
      if (particle.y < 0) particle.y = 1;
      if (particle.y > 1) particle.y = 0;
    }

    // Draw connections (web lines)
    final connectionPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.5;

    for (int i = 0; i < particles.length; i++) {
      for (int j = i + 1; j < particles.length; j++) {
        final p1 = particles[i];
        final p2 = particles[j];

        final x1 = p1.x * size.width;
        final y1 = p1.y * size.height;
        final x2 = p2.x * size.width;
        final y2 = p2.y * size.height;

        final dx = x2 - x1;
        final dy = y2 - y1;
        final distance = sqrt(dx * dx + dy * dy);

        if (distance < connectionDistance) {
          final opacity = (1 - distance / connectionDistance) * 0.15;
          connectionPaint.color = AppTheme.neonBlue.withOpacity(opacity);

          canvas.drawLine(Offset(x1, y1), Offset(x2, y2), connectionPaint);
        }
      }
    }

    // Draw particles as small circles
    final particlePaint = Paint()..style = PaintingStyle.fill;

    for (var particle in particles) {
      final x = particle.x * size.width;
      final y = particle.y * size.height;

      final pulse = (sin(animationValue * 2 * pi + particle.x * 10) + 1) / 2;
      particlePaint.color = AppTheme.neonBlue.withOpacity(0.3 + pulse * 0.2);

      canvas.drawCircle(Offset(x, y), particle.size, particlePaint);
    }
  }

  @override
  bool shouldRepaint(_ParticleNetworkPainter oldDelegate) {
    return true;
  }
}
