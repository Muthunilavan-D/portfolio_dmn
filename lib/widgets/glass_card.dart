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
    this.borderRadius = 12.0,
  });

  @override
  State<GlassCard> createState() => _GlassCardState();
}

class _GlassCardState extends State<GlassCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final effectiveBorderColor = widget.borderColor ??
        (_isHovered ? AppTheme.borderMedium : AppTheme.borderSubtle);
    final effectiveBgColor = widget.backgroundColor ??
        (_isHovered ? AppTheme.surfaceElevated : AppTheme.surfaceDark);

    return MouseRegion(
      cursor: widget.onTap != null ? SystemMouseCursors.click : SystemMouseCursors.basic,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 140),
          width: widget.width,
          height: widget.height,
          margin: widget.margin ?? const EdgeInsets.all(8),
          padding: widget.padding ?? const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: effectiveBgColor,
            borderRadius: BorderRadius.circular(widget.borderRadius),
            border: Border.all(
              color: effectiveBorderColor,
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: _isHovered ? 0.45 : 0.25),
                blurRadius: _isHovered ? 20 : 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
