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

    // Find the closest section based on actual positions
    for (var entry in widget.sectionKeys.entries) {
      final key = entry.value;
      final context = key.currentContext;
      if (context != null) {
        final RenderBox? box = context.findRenderObject() as RenderBox?;
        if (box != null) {
          final position = box.localToGlobal(Offset.zero);
          final distance = (position.dy - 100)
              .abs(); // Account for nav bar height
          if (distance < minDistance && position.dy <= 150) {
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
        final offset =
            widget.scrollController.offset +
            position.dy -
            100; // Account for nav bar
        widget.scrollController.animateTo(
          offset,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
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
    final isMobile = MediaQuery.of(context).size.width < 768;

    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 20 : 40,
            vertical: 20,
          ),
          decoration: BoxDecoration(
            color: AppTheme.deepSpace.withOpacity(0.7),
            border: Border(
              bottom: BorderSide(
                color: AppTheme.neonBlue.withOpacity(0.3),
                width: 1,
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: AppTheme.neonBlue.withOpacity(0.1),
                blurRadius: 20,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Logo with glow effect
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 246, 74, 185).withOpacity(0.3),
                      blurRadius: 10,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Text(
                  'DMN',
                  style: TextStyle(
                    fontSize: isMobile ? 20 : 24,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.neonBlue,
                    letterSpacing: 2,
                  ),
                ),
              ),
              if (isMobile)
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.code, color: AppTheme.neonBlue),
                      onPressed: () =>
                          _launchURL('https://github.com/Muthunilavan-D'),
                      tooltip: 'GitHub',
                    ),
                    IconButton(
                      icon: const Icon(Icons.work, color: AppTheme.neonPurple),
                      onPressed: () => _launchURL(
                        'https://www.linkedin.com/in/d-mn-92a1b7341',
                      ),
                      tooltip: 'LinkedIn',
                    ),
                    IconButton(
                      icon: const Icon(Icons.menu, color: Colors.white),
                      onPressed: () => _showMobileMenu(context),
                    ),
                  ],
                )
              else
                Row(
                  children: [
                    _NavItem(
                      label: 'About',
                      icon: Icons.person_outline,
                      index: 1,
                      activeSection: _activeSection,
                      onTap: () => _scrollToSection(1),
                    ),
                    const SizedBox(width: 20),
                    _NavItem(
                      label: 'Skills',
                      icon: Icons.build,
                      index: 2,
                      activeSection: _activeSection,
                      onTap: () => _scrollToSection(2),
                    ),
                    const SizedBox(width: 20),
                    _NavItem(
                      label: 'Projects',
                      icon: Icons.folder,
                      index: 3,
                      activeSection: _activeSection,
                      onTap: () => _scrollToSection(3),
                    ),
                    const SizedBox(width: 20),
                    _NavItem(
                      label: 'Experience',
                      icon: Icons.work_outline,
                      index: 4,
                      activeSection: _activeSection,
                      onTap: () => _scrollToSection(4),
                    ),
                    const SizedBox(width: 20),
                    _NavItem(
                      label: 'Contact',
                      icon: Icons.mail,
                      index: 5,
                      activeSection: _activeSection,
                      onTap: () => _scrollToSection(5),
                    ),
                    const SizedBox(width: 30),
                    Container(
                      width: 1,
                      height: 24,
                      color: AppTheme.neonBlue.withOpacity(0.3),
                    ),
                    const SizedBox(width: 20),
                    _SocialButton(
                      icon: Icons.code,
                      color: AppTheme.neonBlue,
                      onPressed: () =>
                          _launchURL('https://github.com/Muthunilavan-D'),
                      tooltip: 'GitHub',
                    ),
                    const SizedBox(width: 10),
                    _SocialButton(
                      icon: Icons.work,
                      color: AppTheme.neonPurple,
                      onPressed: () => _launchURL(
                        'https://www.linkedin.com/in/d-mn-92a1b7341',
                      ),
                      tooltip: 'LinkedIn',
                    ),
                  ],
                ),
            ],
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
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppTheme.deepSpace.withOpacity(0.9),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: AppTheme.neonBlue.withOpacity(0.5),
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
                  icon: Icons.build,
                  onTap: () {
                    Navigator.pop(context);
                    _scrollToSection(2);
                  },
                ),
                _MobileNavItem(
                  label: 'Projects',
                  icon: Icons.folder,
                  onTap: () {
                    Navigator.pop(context);
                    _scrollToSection(3);
                  },
                ),
                _MobileNavItem(
                  label: 'Experience',
                  icon: Icons.work_outline,
                  onTap: () {
                    Navigator.pop(context);
                    _scrollToSection(4);
                  },
                ),
                _MobileNavItem(
                  label: 'Contact',
                  icon: Icons.mail,
                  onTap: () {
                    Navigator.pop(context);
                    _scrollToSection(5);
                  },
                ),
                const SizedBox(height: 20),
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
  final IconData icon;
  final int index;
  final int activeSection;
  final VoidCallback onTap;

  const _NavItem({
    required this.label,
    required this.icon,
    required this.index,
    required this.activeSection,
    required this.onTap,
  });

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem>
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
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isActive = widget.activeSection == widget.index;

    return MouseRegion(
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
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: (isActive || _isHovered)
                      ? AppTheme.neonBlue.withOpacity(0.15)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: isActive
                        ? AppTheme.neonBlue
                        : (_isHovered
                              ? AppTheme.neonBlue.withOpacity(0.5)
                              : Colors.transparent),
                    width: 1,
                  ),
                  boxShadow: (isActive || _isHovered)
                      ? [
                          BoxShadow(
                            color: AppTheme.neonBlue.withOpacity(0.3),
                            blurRadius: 10,
                            spreadRadius: 0,
                          ),
                        ]
                      : null,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      widget.icon,
                      size: 18,
                      color: isActive
                          ? AppTheme.neonBlue
                          : (_isHovered ? AppTheme.neonBlue : Colors.white70),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      widget.label,
                      style: TextStyle(
                        color: isActive
                            ? AppTheme.neonBlue
                            : (_isHovered ? AppTheme.neonBlue : Colors.white70),
                        fontSize: 15,
                        fontWeight: isActive
                            ? FontWeight.w600
                            : FontWeight.normal,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _SocialButton extends StatefulWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;
  final String tooltip;

  const _SocialButton({
    required this.icon,
    required this.color,
    required this.onPressed,
    required this.tooltip,
  });

  @override
  State<_SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<_SocialButton>
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
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.2,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovered = true);
        _controller.forward();
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        _controller.reverse();
      },
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: IconButton(
              icon: Icon(widget.icon, color: widget.color),
              onPressed: widget.onPressed,
              tooltip: widget.tooltip,
              style: IconButton.styleFrom(
                backgroundColor: _isHovered
                    ? widget.color.withOpacity(0.2)
                    : Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          );
        },
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
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppTheme.neonBlue.withOpacity(0.2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: AppTheme.neonBlue, size: 20),
      ),
      title: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: onTap,
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: AppTheme.neonBlue,
        size: 16,
      ),
    );
  }
}
