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
    // Primary Style: Stark White button with Jet-Black text (Vercel / Linear executive aesthetic)
    // Secondary / Outlined Style: Dark Zinc surface with crisp hairline border
    final isPrimary = !widget.isOutlined;

    final Color bgColor = isPrimary
        ? (_isHovered ? const Color(0xFFE4E4E7) : Colors.white)
        : (_isHovered ? AppTheme.surfaceElevated : AppTheme.surfaceDark);

    final Color textColor = isPrimary
        ? const Color(0xFF09090B)
        : (_isHovered ? Colors.white : AppTheme.textPrimary);

    final Color borderColor = isPrimary
        ? (_isHovered ? const Color(0xFFD4D4D8) : Colors.white)
        : (_isHovered ? AppTheme.borderHighlight : AppTheme.borderSubtle);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 140),
          padding: widget.padding ??
              const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: borderColor, width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: isPrimary ? 0.3 : 0.15),
                blurRadius: _isHovered ? 12 : 6,
                offset: const Offset(0, 2),
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
                  color: textColor,
                  size: 16,
                ),
                const SizedBox(width: 8),
              ],
              Text(
                widget.text,
                style: TextStyle(
                  color: textColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
