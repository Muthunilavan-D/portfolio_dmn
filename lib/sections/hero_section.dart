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
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 960;

    return Container(
      constraints: const BoxConstraints(minHeight: 740),
      padding: EdgeInsets.only(
        top: isMobile ? 90 : 130,
        bottom: 50,
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
              const SizedBox(height: 48),
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
              const SizedBox(height: 22),
              _buildHeadline(isMobile: false),
              const SizedBox(height: 18),
              _buildTagline(isMobile: false),
              const SizedBox(height: 32),
              _buildActionButtons(isMobile: false),
            ],
          ),
        ),
        const SizedBox(width: 48),
        // Right Column: Executive Portrait Card
        Expanded(
          flex: 4,
          child: Center(
            child: _buildPortraitCard(isMobile: false),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildPortraitCard(isMobile: true),
        const SizedBox(height: 28),
        _buildAvailabilityPill(),
        const SizedBox(height: 18),
        _buildHeadline(isMobile: true),
        const SizedBox(height: 14),
        _buildTagline(isMobile: true),
        const SizedBox(height: 28),
        _buildActionButtons(isMobile: true),
      ],
    );
  }

  Widget _buildAvailabilityPill() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppTheme.surfaceDark,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppTheme.borderSubtle,
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
              color: Color(0xFF22C55E),
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          const Text(
            'AVAILABLE FOR ROLES & COLLABORATIONS',
            style: TextStyle(
              fontSize: 11.5,
              fontWeight: FontWeight.w700,
              color: AppTheme.textPrimary,
              letterSpacing: 0.6,
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
          'Muthunilavan D.',
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: TextStyle(
            fontSize: isMobile ? 36 : 52,
            fontWeight: FontWeight.w800,
            color: AppTheme.textPrimary,
            letterSpacing: -1.0,
            height: 1.1,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Software Engineer & Full-Stack AI Developer',
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: TextStyle(
            fontSize: isMobile ? 20 : 26,
            fontWeight: FontWeight.w600,
            color: AppTheme.textSecondary,
            letterSpacing: -0.3,
            height: 1.25,
          ),
        ),
      ],
    );
  }

  Widget _buildTagline({required bool isMobile}) {
    return Text(
      'Computer Science Engineering student at Velammal (CGPA 8.65, 3rd sem 9.18). '
      'Building high-performance cross-platform applications with Flutter and end-to-end web platforms '
      'powered by Explainable AI (SHAP), Node.js, and modern distributed architecture.',
      textAlign: isMobile ? TextAlign.center : TextAlign.start,
      style: TextStyle(
        fontSize: isMobile ? 14.5 : 16,
        color: AppTheme.textMuted,
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
      children: [
        GlowButton(
          text: 'Explore Projects',
          icon: Icons.arrow_downward,
          onPressed: () => _scrollTo(1200),
        ),
        GlowButton(
          text: 'Download Resume',
          icon: Icons.download_outlined,
          isOutlined: true,
          onPressed: _downloadResume,
        ),
        GlowButton(
          text: 'Contact',
          icon: Icons.mail_outline,
          isOutlined: true,
          onPressed: () => _scrollTo(3200),
        ),
      ],
    );
  }

  Widget _buildPortraitCard({required bool isMobile}) {
    final double cardWidth = isMobile ? 220 : 280;

    return Container(
      width: cardWidth,
      decoration: BoxDecoration(
        color: AppTheme.surfaceDark,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppTheme.borderSubtle,
          width: 1,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x60000000),
            blurRadius: 20,
            offset: Offset(0, 8),
          ),
        ],
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              color: AppTheme.surfaceElevated,
              child: AspectRatio(
                aspectRatio: 1.0,
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
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Muthunilavan D.',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.textPrimary,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        'B.E. CSE • 2023–2027',
                        style: TextStyle(
                          fontSize: 10.5,
                          color: AppTheme.textMuted,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppTheme.surfaceElevated,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: AppTheme.borderSubtle),
                  ),
                  child: const Text(
                    '8.65 CGPA',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetricBar(bool isMobile) {
    final metrics = [
      {'val': '5+', 'label': 'Shipped Projects', 'sub': 'Flutter, Node, XAI'},
      {'val': '8.65', 'label': 'B.E. CGPA', 'sub': 'Sem 3 GPA: 9.18'},
      {'val': '1st Place', 'label': 'Euphoria AI Sprint', 'sub': 'Hackathon Winner'},
      {'val': 'AstroWeb', 'label': 'Flutter Intern', 'sub': 'Mobile & Cloud APIs'},
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: AppTheme.surfaceDark,
        borderRadius: BorderRadius.circular(10),
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
                width: 3,
                height: 36,
                decoration: BoxDecoration(
                  color: AppTheme.borderMedium,
                  borderRadius: BorderRadius.circular(2),
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
                      letterSpacing: -0.2,
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
                    style: const TextStyle(
                      fontSize: 11,
                      color: AppTheme.textMuted,
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
