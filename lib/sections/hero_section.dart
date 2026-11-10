import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import '../widgets/glow_button.dart';
// Conditional import for web resume download
import '../resume_helper_stub.dart'
    if (dart.library.html) '../resume_helper_web.dart'
    as resume_helper;

class HeroSection extends StatefulWidget {
  final ScrollController? scrollController;

  const HeroSection({super.key, this.scrollController});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;
  bool _copiedEmail = false;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
    _pulseAnimation = Tween<double>(begin: 0.8, end: 1.6).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> _downloadResume() async {
    if (kIsWeb) {
      final assetPaths = [
        'assets/assets/Resume_dmn.pdf',
        '/assets/assets/Resume_dmn.pdf',
        'assets/Resume_dmn.pdf',
        '/assets/Resume_dmn.pdf',
      ];

      bool downloaded = false;
      for (final path in assetPaths) {
        try {
          downloaded = await resume_helper.downloadResumeWeb(path);
          if (downloaded) break;
        } catch (e) {
          continue;
        }
      }

      if (!downloaded && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Could not download resume. Please try again later.'),
            backgroundColor: AppTheme.rose,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } else {
      await _launchURL(
        'https://github.com/Muthunilavan-D/portfolio_dmn/raw/main/assets/Resume_dmn.pdf',
      );
    }
  }

  void _copyEmail() {
    Clipboard.setData(const ClipboardData(text: 'muthunilavand@gmail.com'));
    setState(() => _copiedEmail = true);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Row(
          children: [
            Icon(Icons.check_circle, color: AppTheme.emerald, size: 18),
            SizedBox(width: 10),
            Text('Copied muthunilavand@gmail.com to clipboard!'),
          ],
        ),
        backgroundColor: AppTheme.surfaceElevated,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: AppTheme.borderHighlight),
        ),
        duration: const Duration(seconds: 2),
      ),
    );
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) setState(() => _copiedEmail = false);
    });
  }

  void _scrollTo(double offset) {
    if (widget.scrollController != null) {
      widget.scrollController!.animateTo(
        offset.clamp(0.0, widget.scrollController!.position.maxScrollExtent),
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 960;

    return Container(
      constraints: const BoxConstraints(minHeight: 740),
      padding: EdgeInsets.only(
        top: isMobile ? 110 : 140,
        bottom: 60,
        left: isMobile ? 20 : 40,
        right: isMobile ? 20 : 40,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1140),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isMobile)
                _buildMobileLayout(context)
              else
                _buildDesktopLayout(context),
              const SizedBox(height: 50),
              _buildMetricBar(isMobile),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Left Column: Editorial Information
        Expanded(
          flex: 6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAvailabilityPill(),
              const SizedBox(height: 24),
              _buildHeadline(isMobile: false),
              const SizedBox(height: 18),
              _buildTagline(isMobile: false),
              const SizedBox(height: 32),
              _buildActionButtons(isMobile: false),
            ],
          ),
        ),
        const SizedBox(width: 48),
        // Right Column: Avatar with dual-ring glow
        Expanded(
          flex: 4,
          child: Center(
            child: _buildAvatar(size: 270),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildAvatar(size: 200),
        const SizedBox(height: 28),
        _buildAvailabilityPill(),
        const SizedBox(height: 20),
        _buildHeadline(isMobile: true),
        const SizedBox(height: 16),
        _buildTagline(isMobile: true),
        const SizedBox(height: 28),
        _buildActionButtons(isMobile: true),
      ],
    );
  }

  Widget _buildAvailabilityPill() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppTheme.emerald.withValues(alpha: 0.16),
            const Color(0xFF06B6D4).withValues(alpha: 0.12),
          ],
        ),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: AppTheme.emerald.withValues(alpha: 0.5),
          width: 1.2,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x3310B981),
            blurRadius: 14,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Live animated radar pulse
          Stack(
            alignment: Alignment.center,
            children: [
              AnimatedBuilder(
                animation: _pulseAnimation,
                builder: (context, child) {
                  return Container(
                    width: 14 * _pulseAnimation.value,
                    height: 14 * _pulseAnimation.value,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppTheme.emerald.withValues(
                        alpha: (1.8 - _pulseAnimation.value).clamp(0.0, 0.5),
                      ),
                    ),
                  );
                },
              ),
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: AppTheme.emerald,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
          const SizedBox(width: 10),
          const Text(
            'Available for Roles & Collaborations',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppTheme.emerald,
              letterSpacing: 0.3,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeadline({required bool isMobile}) {
    return Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          "Hi, I'm Muthunilavan D",
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: TextStyle(
            fontSize: isMobile ? 32 : 50,
            fontWeight: FontWeight.w800,
            color: AppTheme.textPrimary,
            letterSpacing: -0.6,
            height: 1.15,
          ),
        ),
        const SizedBox(height: 8),
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [
              Color(0xFF818CF8), // Soft Indigo
              Color(0xFF38BDF8), // Electric Cyan
              Color(0xFFC084FC), // Luminous Violet
            ],
          ).createShader(bounds),
          child: Text(
            'Flutter & Full-Stack AI Engineer',
            textAlign: isMobile ? TextAlign.center : TextAlign.start,
            style: TextStyle(
              fontSize: isMobile ? 22 : 33,
              fontWeight: FontWeight.w800,
              color: Colors.white,
              letterSpacing: -0.3,
              height: 1.25,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTagline({required bool isMobile}) {
    return Text(
      'Computer Science Engineering student at Velammal College of Engineering & Technology. Focused on engineering high-performance mobile systems with Flutter, scalable backends, and explainable AI solutions.',
      textAlign: isMobile ? TextAlign.center : TextAlign.start,
      style: TextStyle(
        fontSize: isMobile ? 15 : 16.5,
        color: AppTheme.textSecondary,
        height: 1.6,
        letterSpacing: 0.1,
      ),
    );
  }

  Widget _buildActionButtons({required bool isMobile}) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        GlowButton(
          text: 'Explore Projects',
          icon: Icons.rocket_launch_outlined,
          onPressed: () => _scrollTo(1400),
        ),
        GlowButton(
          text: 'Download Resume',
          icon: Icons.download_outlined,
          isOutlined: true,
          onPressed: _downloadResume,
        ),
        GlowButton(
          text: 'Contact Me',
          icon: Icons.mail_outline,
          isOutlined: true,
          onPressed: () => _scrollTo(3400),
        ),
        // Interactive Quick Copy Email Chip
        InkWell(
          onTap: _copyEmail,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppTheme.surfaceElevated.withValues(alpha: 0.9),
                  AppTheme.surfaceDark.withValues(alpha: 0.8),
                ],
              ),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: _copiedEmail
                    ? AppTheme.emerald
                    : AppTheme.primaryLight.withValues(alpha: 0.35),
                width: 1.2,
              ),
              boxShadow: [
                BoxShadow(
                  color: (_copiedEmail ? AppTheme.emerald : AppTheme.primary)
                      .withValues(alpha: 0.15),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  _copiedEmail ? Icons.check : Icons.copy,
                  size: 14,
                  color: _copiedEmail
                      ? AppTheme.emerald
                      : AppTheme.secondary,
                ),
                const SizedBox(width: 8),
                Text(
                  _copiedEmail ? 'Copied Email!' : 'Copy Email',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: _copiedEmail
                        ? AppTheme.emerald
                        : AppTheme.textPrimary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAvatar({required double size}) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Outer glowing halo
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF6366F1), // Electric Indigo
                Color(0xFF06B6D4), // Cyan
                Color(0xFFA855F7), // Violet
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: AppTheme.primary.withValues(alpha: 0.45),
                blurRadius: 40,
                spreadRadius: 4,
                offset: const Offset(0, 8),
              ),
              BoxShadow(
                color: AppTheme.secondary.withValues(alpha: 0.25),
                blurRadius: 25,
                spreadRadius: 2,
              ),
            ],
          ),
          padding: const EdgeInsets.all(4),
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppTheme.darkSpace,
            ),
            padding: const EdgeInsets.all(3.5),
            child: ClipOval(
              child: Image.asset(
                'assets/my_avatar.png',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: AppTheme.surfaceDark,
                    child: const Icon(
                      Icons.person,
                      size: 80,
                      color: AppTheme.textMuted,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        // Interactive Floating pill badge
        Positioned(
          bottom: 8,
          right: 8,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF1E293B),
                  Color(0xFF0F172A),
                ],
              ),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: AppTheme.secondary.withValues(alpha: 0.6),
                width: 1.2,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.secondary.withValues(alpha: 0.3),
                  blurRadius: 14,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.verified,
                  size: 15,
                  color: AppTheme.secondaryLight,
                ),
                SizedBox(width: 6),
                Text(
                  'B.E. CSE • 2027',
                  style: TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textPrimary,
                    letterSpacing: 0.3,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMetricBar(bool isMobile) {
    final metrics = [
      {
        'val': '5+',
        'label': 'Projects Shipped',
        'sub': 'Flutter, Node & AI',
        'icon': Icons.folder_outlined,
        'color': const Color(0xFF6366F1), // Indigo
      },
      {
        'val': 'Full-Stack',
        'label': 'Cross-Platform',
        'sub': 'Mobile, Web & APIs',
        'icon': Icons.layers_outlined,
        'color': const Color(0xFF06B6D4), // Cyan
      },
      {
        'val': 'AI & XAI',
        'label': 'Applied Intelligence',
        'sub': 'SHAP & LLM Workflows',
        'icon': Icons.psychology_outlined,
        'color': const Color(0xFFA855F7), // Violet
      },
      {
        'val': 'AstroWeb',
        'label': 'Flutter Intern',
        'sub': 'Commercial Experience',
        'icon': Icons.business_center_outlined,
        'color': const Color(0xFF10B981), // Emerald
      },
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppTheme.surfaceElevated.withValues(alpha: 0.8),
            AppTheme.surfaceDark.withValues(alpha: 0.8),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppTheme.borderHighlight.withValues(alpha: 0.4),
          width: 1.2,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x33000000),
            blurRadius: 18,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Wrap(
        alignment: WrapAlignment.spaceAround,
        runAlignment: WrapAlignment.center,
        spacing: 24,
        runSpacing: 16,
        children: metrics.map((m) {
          final accent = m['color'] as Color;
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(9),
                decoration: BoxDecoration(
                  color: accent.withValues(alpha: 0.16),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: accent.withValues(alpha: 0.4),
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: accent.withValues(alpha: 0.25),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Icon(
                  m['icon'] as IconData,
                  size: 20,
                  color: accent,
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    m['val'] as String,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                  Text(
                    m['label'] as String,
                    style: const TextStyle(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.textSecondary,
                    ),
                  ),
                  Text(
                    m['sub'] as String,
                    style: TextStyle(
                      fontSize: 11,
                      color: accent.withValues(alpha: 0.85),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
