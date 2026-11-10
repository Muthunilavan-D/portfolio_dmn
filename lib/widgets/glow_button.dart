import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class GlowButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool isOutlined;
  final Color? customColor;
  final EdgeInsets? padding;

  const GlowButton({
    super.key,
    required this.text,
    this.onPressed,
    this.icon,
    this.isOutlined = false,
    this.customColor,
    this.padding,
  });

  @override
  State<GlowButton> createState() => _GlowButtonState();
}

class _GlowButtonState extends State<GlowButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final Color accent = widget.customColor ?? AppTheme.primary;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOut,
          padding: widget.padding ??
              const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          decoration: BoxDecoration(
            gradient: widget.isOutlined
                ? null
                : LinearGradient(
                    colors: [
                      accent,
                      accent == AppTheme.primary
                          ? AppTheme.primaryDark
                          : accent.withValues(alpha: 0.8),
                    ],
                  ),
            color: widget.isOutlined
                ? (_isHovered
                    ? accent.withValues(alpha: 0.15)
                    : AppTheme.surfaceDark.withValues(alpha: 0.7))
                : null,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: widget.isOutlined
                  ? (_isHovered ? accent : AppTheme.borderSubtle)
                  : (_isHovered
                      ? Colors.white.withValues(alpha: 0.4)
                      : Colors.white.withValues(alpha: 0.15)),
              width: 1,
            ),
            boxShadow: [
              if (!widget.isOutlined)
                BoxShadow(
                  color: accent.withValues(alpha: _isHovered ? 0.35 : 0.15),
                  blurRadius: _isHovered ? 20 : 12,
                  offset: const Offset(0, 4),
                ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.icon != null) ...[
                Icon(
                  widget.icon,
                  color: widget.isOutlined
                      ? (_isHovered ? accent : AppTheme.textPrimary)
                      : Colors.white,
                  size: 18,
                ),
                const SizedBox(width: 8),
              ],
              Text(
                widget.text,
                style: TextStyle(
                  color: widget.isOutlined
                      ? (_isHovered ? accent : AppTheme.textPrimary)
                      : Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
