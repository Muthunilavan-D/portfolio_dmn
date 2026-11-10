import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class GlassCard extends StatefulWidget {
  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final VoidCallback? onTap;
  final double? width;
  final double? height;
  final Color? borderColor;
  final Color? backgroundColor;
  final double borderRadius;
  final LinearGradient? borderGradient;
  final Color? glowColor;

  const GlassCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.onTap,
    this.width,
    this.height,
    this.borderColor,
    this.backgroundColor,
    this.borderRadius = 16.0,
    this.borderGradient,
    this.glowColor,
  });

  @override
  State<GlassCard> createState() => _GlassCardState();
}

class _GlassCardState extends State<GlassCard>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.015).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final effectiveGlowColor = widget.glowColor ?? AppTheme.primary;

    return MouseRegion(
      cursor: widget.onTap != null
          ? SystemMouseCursors.click
          : SystemMouseCursors.basic,
      onEnter: (_) {
        setState(() => _isHovered = true);
        _controller.forward();
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        _controller.reverse();
      },
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedBuilder(
          animation: _scaleAnimation,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: widget.width,
                height: widget.height,
                margin: widget.margin ?? const EdgeInsets.all(8),
                padding: widget.padding ?? const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      _isHovered
                          ? AppTheme.surfaceElevated.withValues(alpha: 0.92)
                          : AppTheme.surfaceDark.withValues(alpha: 0.80),
                      _isHovered
                          ? AppTheme.spaceGray.withValues(alpha: 0.88)
                          : const Color(0xFF0A0F1F).withValues(alpha: 0.75),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  border: Border.all(
                    color: widget.borderColor ??
                        (_isHovered
                            ? effectiveGlowColor.withValues(alpha: 0.65)
                            : AppTheme.borderSubtle),
                    width: _isHovered ? 1.5 : 1.0,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: _isHovered ? 0.45 : 0.25),
                      blurRadius: _isHovered ? 24 : 14,
                      offset: const Offset(0, 6),
                    ),
                    if (_isHovered)
                      BoxShadow(
                        color: effectiveGlowColor.withValues(alpha: 0.16),
                        blurRadius: 24,
                        spreadRadius: 1,
                      ),
                  ],
                ),
                child: widget.child,
              ),
            );
          },
        ),
      ),
    );
  }
}
