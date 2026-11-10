import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 48),
      decoration: BoxDecoration(
        color: AppTheme.darkSpace,
        border: Border(
          top: BorderSide(
            color: AppTheme.borderSubtle,
            width: 1,
          ),
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1140),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _FooterSocialButton(
                    icon: Icons.code,
                    tooltip: 'GitHub',
                    onPressed: () =>
                        _launchURL('https://github.com/Muthunilavan-D'),
                  ),
                  const SizedBox(width: 16),
                  _FooterSocialButton(
                    icon: Icons.work_outline,
                    tooltip: 'LinkedIn',
                    onPressed: () => _launchURL(
                      'https://www.linkedin.com/in/d-mn-92a1b7341',
                    ),
                  ),
                  const SizedBox(width: 16),
                  _FooterSocialButton(
                    icon: Icons.mail_outline,
                    tooltip: 'Email',
                    onPressed: () =>
                        _launchURL('mailto:muthunilavand@gmail.com'),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                '© 2026 Muthunilavan D. All rights reserved.',
                style: TextStyle(
                  fontSize: 14,
                  color: AppTheme.textSecondary,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 6,
                    height: 6,
                    decoration: const BoxDecoration(
                      color: AppTheme.emerald,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Built with Flutter Web & Clean Architecture',
                    style: TextStyle(
                      fontSize: 13,
                      color: AppTheme.textMuted,
                      letterSpacing: 0.2,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FooterSocialButton extends StatefulWidget {
  final IconData icon;
  final String tooltip;
  final VoidCallback onPressed;

  const _FooterSocialButton({
    required this.icon,
    required this.tooltip,
    required this.onPressed,
  });

  @override
  State<_FooterSocialButton> createState() => _FooterSocialButtonState();
}

class _FooterSocialButtonState extends State<_FooterSocialButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 160),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: _isHovered
                ? AppTheme.primary.withValues(alpha: 0.15)
                : AppTheme.surfaceDark,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: _isHovered
                  ? AppTheme.primaryLight.withValues(alpha: 0.4)
                  : AppTheme.borderSubtle,
              width: 1,
            ),
          ),
          child: Icon(
            widget.icon,
            size: 20,
            color: _isHovered ? AppTheme.primaryLight : AppTheme.textSecondary,
          ),
        ),
      ),
    );
  }
}
