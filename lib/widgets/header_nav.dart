import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:ui';
import '../theme/app_theme.dart';

class HeaderNav extends StatefulWidget {
  final ScrollController scrollController;
  final Map<int, GlobalKey> sectionKeys;

  const HeaderNav({
    super.key,
    required this.scrollController,
    required this.sectionKeys,
  });

  @override
  State<HeaderNav> createState() => _HeaderNavState();
}

class _HeaderNavState extends State<HeaderNav> {
  int _activeSection = 0;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() {
    int newSection = 0;
    double minDistance = double.infinity;

    for (var entry in widget.sectionKeys.entries) {
      final key = entry.value;
      final context = key.currentContext;
      if (context != null) {
        final RenderBox? box = context.findRenderObject() as RenderBox?;
        if (box != null) {
          final position = box.localToGlobal(Offset.zero);
          final distance = (position.dy - 120).abs();
          if (distance < minDistance && position.dy <= 180) {
            minDistance = distance;
            newSection = entry.key;
          }
        }
      }
    }

    if (newSection != _activeSection) {
      setState(() {
        _activeSection = newSection;
      });
    }
  }

  void _scrollToSection(int index) {
    final key = widget.sectionKeys[index];
    if (key?.currentContext != null) {
      final RenderBox? box =
          key!.currentContext!.findRenderObject() as RenderBox?;
      if (box != null) {
        final position = box.localToGlobal(Offset.zero);
        // Generous offset so the section header is never covered by the navbar
        final offset = widget.scrollController.offset + position.dy - 100;
        widget.scrollController.animateTo(
          offset.clamp(0.0, widget.scrollController.position.maxScrollExtent),
          duration: const Duration(milliseconds: 700),
          curve: Curves.easeInOutCubic,
        );
      }
    }
  }

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 960;

    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1140),
        margin: EdgeInsets.symmetric(
          horizontal: isMobile ? 12 : 24,
          vertical: 12,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 16 : 20,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: AppTheme.surfaceDark.withValues(alpha: 0.85),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: AppTheme.borderSubtle,
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.4),
                    blurRadius: 20,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Logo with live status indicator
                  InkWell(
                    onTap: () => _scrollToSection(0),
                    borderRadius: BorderRadius.circular(8),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: AppTheme.emerald,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x8010B981),
                                  blurRadius: 6,
                                  spreadRadius: 1,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            'MUTHU',
                            style: TextStyle(
                              fontSize: isMobile ? 16 : 18,
                              fontWeight: FontWeight.w800,
                              color: AppTheme.textPrimary,
                              letterSpacing: 1.2,
                            ),
                          ),
                          Text(
                            '.DEV',
                            style: TextStyle(
                              fontSize: isMobile ? 16 : 18,
                              fontWeight: FontWeight.w800,
                              color: AppTheme.primaryLight,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (isMobile)
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.code, size: 20),
                          color: AppTheme.textSecondary,
                          onPressed: () =>
                              _launchURL('https://github.com/Muthunilavan-D'),
                          tooltip: 'GitHub',
                        ),
                        IconButton(
                          icon: const Icon(Icons.menu, color: AppTheme.textPrimary),
                          onPressed: () => _showMobileMenu(context),
                        ),
                      ],
                    )
                  else
                    Row(
                      children: [
                        _NavItem(
                          label: 'About',
                          index: 1,
                          activeSection: _activeSection,
                          onTap: () => _scrollToSection(1),
                        ),
                        const SizedBox(width: 4),
                        _NavItem(
                          label: 'Skills',
                          index: 2,
                          activeSection: _activeSection,
                          onTap: () => _scrollToSection(2),
                        ),
                        const SizedBox(width: 4),
                        _NavItem(
                          label: 'Projects',
                          index: 3,
                          activeSection: _activeSection,
                          onTap: () => _scrollToSection(3),
                        ),
                        const SizedBox(width: 4),
                        _NavItem(
                          label: 'Experience',
                          index: 4,
                          activeSection: _activeSection,
                          onTap: () => _scrollToSection(4),
                        ),
                        const SizedBox(width: 4),
                        _NavItem(
                          label: 'Contact',
                          index: 5,
                          activeSection: _activeSection,
                          onTap: () => _scrollToSection(5),
                        ),
                        const SizedBox(width: 14),
                        Container(
                          width: 1,
                          height: 18,
                          color: AppTheme.borderSubtle,
                        ),
                        const SizedBox(width: 10),
                        _SocialIconButton(
                          icon: Icons.code,
                          tooltip: 'GitHub',
                          onPressed: () =>
                              _launchURL('https://github.com/Muthunilavan-D'),
                        ),
                        const SizedBox(width: 4),
                        _SocialIconButton(
                          icon: Icons.work_outline,
                          tooltip: 'LinkedIn',
                          onPressed: () => _launchURL(
                            'https://www.linkedin.com/in/d-mn-92a1b7341',
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showMobileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(
              color: AppTheme.surfaceDark.withValues(alpha: 0.95),
              border: Border.all(color: AppTheme.borderSubtle),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 36,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 18),
                  decoration: BoxDecoration(
                    color: AppTheme.borderSubtle,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                _MobileNavItem(
                  label: 'About',
                  icon: Icons.person_outline,
                  onTap: () {
                    Navigator.pop(context);
                    _scrollToSection(1);
                  },
                ),
                _MobileNavItem(
                  label: 'Skills',
                  icon: Icons.layers_outlined,
                  onTap: () {
                    Navigator.pop(context);
                    _scrollToSection(2);
                  },
                ),
                _MobileNavItem(
                  label: 'Projects',
                  icon: Icons.folder_open_outlined,
                  onTap: () {
                    Navigator.pop(context);
                    _scrollToSection(3);
                  },
                ),
                _MobileNavItem(
                  label: 'Experience & Credentials',
                  icon: Icons.school_outlined,
                  onTap: () {
                    Navigator.pop(context);
                    _scrollToSection(4);
                  },
                ),
                _MobileNavItem(
                  label: 'Contact',
                  icon: Icons.mail_outline,
                  onTap: () {
                    Navigator.pop(context);
                    _scrollToSection(5);
                  },
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatefulWidget {
  final String label;
  final int index;
  final int activeSection;
  final VoidCallback onTap;

  const _NavItem({
    required this.label,
    required this.index,
    required this.activeSection,
    required this.onTap,
  });

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isActive = widget.activeSection == widget.index;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 160),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
          decoration: BoxDecoration(
            color: isActive
                ? AppTheme.primary.withValues(alpha: 0.18)
                : (_isHovered
                    ? Colors.white.withValues(alpha: 0.08)
                    : Colors.transparent),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: isActive
                  ? AppTheme.primaryLight.withValues(alpha: 0.45)
                  : Colors.transparent,
              width: 1,
            ),
          ),
          child: Text(
            widget.label,
            style: TextStyle(
              color: isActive
                  ? AppTheme.primaryLight
                  : (_isHovered
                      ? AppTheme.textPrimary
                      : AppTheme.textSecondary),
              fontSize: 13.5,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

class _SocialIconButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final String tooltip;

  const _SocialIconButton({
    required this.icon,
    required this.onPressed,
    required this.tooltip,
  });

  @override
  State<_SocialIconButton> createState() => _SocialIconButtonState();
}

class _SocialIconButtonState extends State<_SocialIconButton> {
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
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: _isHovered
                ? AppTheme.primary.withValues(alpha: 0.15)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: _isHovered
                  ? AppTheme.primaryLight.withValues(alpha: 0.35)
                  : Colors.transparent,
              width: 1,
            ),
          ),
          child: Icon(
            widget.icon,
            color: _isHovered ? AppTheme.primaryLight : AppTheme.textSecondary,
            size: 18,
          ),
        ),
      ),
    );
  }
}

class _MobileNavItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const _MobileNavItem({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppTheme.primary.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: AppTheme.primaryLight, size: 18),
      ),
      title: Text(
        label,
        style: const TextStyle(
          color: AppTheme.textPrimary,
          fontSize: 14.5,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: onTap,
      trailing: const Icon(
        Icons.chevron_right,
        color: AppTheme.textMuted,
        size: 18,
      ),
    );
  }
}
