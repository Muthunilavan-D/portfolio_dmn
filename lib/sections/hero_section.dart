import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
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

class _HeroSectionState extends State<HeroSection> {
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

  void _scrollTo(double offset) {
    if (widget.scrollController != null) {
      widget.scrollController!.animateTo(
        offset,
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
        top: isMobile ? 100 : 130,
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
        // Left Column: Content
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
              const SizedBox(height: 36),
              _buildActionButtons(isMobile: false),
            ],
          ),
        ),
        const SizedBox(width: 48),
        // Right Column: Avatar
        Expanded(
          flex: 4,
          child: Center(
            child: _buildAvatar(size: 260),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildAvatar(size: 190),
        const SizedBox(height: 28),
        _buildAvailabilityPill(),
        const SizedBox(height: 20),
        _buildHeadline(isMobile: true),
        const SizedBox(height: 16),
        _buildTagline(isMobile: true),
        const SizedBox(height: 30),
        _buildActionButtons(isMobile: true),
      ],
    );
  }

  Widget _buildAvailabilityPill() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
      decoration: BoxDecoration(
        color: AppTheme.emerald.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: AppTheme.emerald.withValues(alpha: 0.35),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 7,
            height: 7,
            decoration: const BoxDecoration(
              color: AppTheme.emerald,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Color(0x6610B981),
                  blurRadius: 6,
                  spreadRadius: 1,
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
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
            fontSize: isMobile ? 32 : 48,
            fontWeight: FontWeight.w800,
            color: AppTheme.textPrimary,
            letterSpacing: -0.5,
            height: 1.15,
          ),
        ),
        const SizedBox(height: 8),
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [
              AppTheme.primaryLight,
              AppTheme.secondary,
            ],
          ).createShader(bounds),
          child: Text(
            'Flutter & Full-Stack AI Engineer',
            textAlign: isMobile ? TextAlign.center : TextAlign.start,
            style: TextStyle(
              fontSize: isMobile ? 22 : 32,
              fontWeight: FontWeight.w700,
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
      'Computer Science Engineering student crafting production-ready mobile apps with Flutter and full-stack web platforms powered by Explainable AI (XAI) and modern backends.',
      textAlign: isMobile ? TextAlign.center : TextAlign.start,
      style: TextStyle(
        fontSize: isMobile ? 15 : 17,
        color: AppTheme.textSecondary,
        height: 1.6,
        letterSpacing: 0.2,
      ),
    );
  }

  Widget _buildActionButtons({required bool isMobile}) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
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
          onPressed: () => _scrollTo(3200),
        ),
      ],
    );
  }

  Widget _buildAvatar({required double size}) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppTheme.primary,
                AppTheme.secondary,
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: AppTheme.primary.withValues(alpha: 0.25),
                blurRadius: 36,
                spreadRadius: 2,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          padding: const EdgeInsets.all(3),
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppTheme.darkSpace,
            ),
            padding: const EdgeInsets.all(3),
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
        // Floating pill micro-badge
        Positioned(
          bottom: 4,
          right: 4,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppTheme.surfaceDark.withValues(alpha: 0.95),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: AppTheme.primary.withValues(alpha: 0.4),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.4),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.verified,
                  size: 14,
                  color: AppTheme.primaryLight,
                ),
                const SizedBox(width: 6),
                Text(
                  'B.E. CSE • 2027',
                  style: const TextStyle(
                    fontSize: 12,
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
      {'val': '5+', 'label': 'Projects Shipped', 'icon': Icons.folder_outlined},
      {'val': '8.65', 'label': 'B.E. CGPA (9.18 Sem 3)', 'icon': Icons.school_outlined},
      {'val': 'Winner', 'label': 'Euphoria AI Sprint', 'icon': Icons.emoji_events_outlined},
      {'val': 'Full-Stack', 'label': 'Flutter • Node • XAI', 'icon': Icons.layers_outlined},
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: AppTheme.surfaceDark.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppTheme.borderSubtle,
          width: 1,
        ),
      ),
      child: Wrap(
        alignment: WrapAlignment.spaceAround,
        runAlignment: WrapAlignment.center,
        spacing: 24,
        runSpacing: 16,
        children: metrics.map((m) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppTheme.primary.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  m['icon'] as IconData,
                  size: 18,
                  color: AppTheme.primaryLight,
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    m['val'] as String,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                  Text(
                    m['label'] as String,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppTheme.textSecondary,
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
