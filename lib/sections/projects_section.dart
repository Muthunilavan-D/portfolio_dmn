import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import '../widgets/glass_card.dart';
import '../widgets/glow_button.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 960;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 40,
        vertical: 70,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1140),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionHeader(),
              const SizedBox(height: 36),
              _buildFeaturedProjIntel(isMobile),
              const SizedBox(height: 32),
              _buildProjectsGrid(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: AppTheme.surfaceElevated,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: AppTheme.borderSubtle),
          ),
          child: const Text(
            'SELECTED WORKS',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: AppTheme.textSecondary,
              letterSpacing: 0.8,
            ),
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'Featured Systems & Applications',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w800,
            color: AppTheme.textPrimary,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Production mobile apps, machine intelligence platforms, and full-stack software built end-to-end.',
          style: TextStyle(
            fontSize: 15,
            color: AppTheme.textMuted,
          ),
        ),
      ],
    );
  }

  Widget _buildFeaturedProjIntel(bool isMobile) {
    return GlassCard(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.all(isMobile ? 20 : 28),
      borderColor: AppTheme.borderMedium,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Spotlight Header Badges
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppTheme.surfaceElevated,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: AppTheme.borderMedium),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        color: Color(0xFF22C55E),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      '01 / FLAGSHIP CAPSTONE • OCTOBER 2026',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.textPrimary,
                        letterSpacing: 0.6,
                      ),
                    ),
                  ],
                ),
              ),
              if (!isMobile)
                const Text(
                  'Academic Intelligence Platform',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppTheme.textMuted,
                    fontWeight: FontWeight.w500,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 18),
          // Project Title & Subtitle
          const Text(
            'ProjIntel — AI-Assisted Academic Project Management System',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: AppTheme.textPrimary,
              letterSpacing: -0.3,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'An Explainable AI (XAI) and LLM-assisted academic platform for students, faculty guides, and department administrators featuring early milestone delay-risk prediction and dependency-aware task prioritization.',
            style: TextStyle(
              fontSize: 15,
              color: AppTheme.textSecondary,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 22),
          // Banner Image
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppTheme.borderSubtle),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.asset(
                'assets/ProjIntel.png',
                width: double.infinity,
                height: isMobile ? 200 : 340,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 200,
                    color: AppTheme.surfaceElevated,
                    child: const Center(
                      child: Icon(Icons.image, size: 48, color: AppTheme.textMuted),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 22),
          // Key Architecture Highlights
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.surfaceElevated,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppTheme.borderSubtle),
            ),
            child: Wrap(
              spacing: 24,
              runSpacing: 14,
              children: [
                _buildHighlightItem(
                  number: 'A',
                  title: 'Early Delay-Risk Prediction',
                  desc: 'Deterministic scoring formula + SHAP feature importance explanation',
                ),
                _buildHighlightItem(
                  number: 'B',
                  title: 'Dependency Prioritization',
                  desc: 'Directs teams to resolve prerequisite bottlenecks first',
                ),
                _buildHighlightItem(
                  number: 'C',
                  title: 'Role-Based Workspaces',
                  desc: 'Dedicated portals for Students, Faculty Guides, and HODs',
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          // Tech Stack Badges
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: const [
              'React 19',
              'Node.js & Express',
              'MongoDB',
              'Groq Cloud (LLaMA 3.3)',
              'Python (SHAP)',
              'Vite',
            ].map((t) => _TechTag(label: t)).toList(),
          ),
          const SizedBox(height: 22),
          // Action Buttons
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              GlowButton(
                text: 'Live Platform',
                icon: Icons.open_in_new,
                onPressed: () => _launchURL('https://proj-intel.vercel.app'),
              ),
              GlowButton(
                text: 'GitHub Repository',
                icon: Icons.code,
                isOutlined: true,
                onPressed: () => _launchURL('https://github.com/Muthunilavan-D/ProjIntel'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHighlightItem({
    required String number,
    required String title,
    required String desc,
  }) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 310),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: AppTheme.surfaceDark,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: AppTheme.borderSubtle),
            ),
            child: Text(
              number,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: AppTheme.textPrimary,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.textPrimary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  desc,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppTheme.textMuted,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectsGrid(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final cardWidth = constraints.maxWidth > 900
            ? (constraints.maxWidth - 16) / 2
            : constraints.maxWidth;

        return Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            _ProjectCard(
              number: '02',
              title: 'FitTrack — AI Fitness Analytics',
              category: 'Flutter • AI Health',
              cardWidth: cardWidth,
              description:
                  'Intelligent mobile application with real-time workout tracking, AI-based food recognition via Gemini API, and personalized health metrics.',
              techStack: const ['Flutter', 'Firebase Auth', 'Gemini API', 'Material 3'],
              thumbnail: 'assets/FitTrack.png',
              githubUrl: 'https://github.com/Muthunilavan-D/FitTrack.git',
              linkedinUrl:
                  'https://www.linkedin.com/posts/d-mn-92a1b7341_flutter-firebase-ai-activity-7304894778985361408-vMVe',
            ),
            _ProjectCard(
              number: '03',
              title: 'PricePulse — Price Tracking Engine',
              category: 'Mobile • FinTech & Scrapers',
              cardWidth: cardWidth,
              description:
                  'E-commerce tracking application that monitors product price fluctuations over time and delivers alerts when items hit user-defined budget targets.',
              techStack: const ['Flutter', 'Node.js', 'Hive DB', 'Cron Alerts'],
              thumbnail: 'assets/PricePulse.png',
              githubUrl: 'https://github.com/Muthunilavan-D/Pricepulse.git',
              linkedinUrl:
                  'https://www.linkedin.com/posts/d-mn-92a1b7341_release-price-pulse-v10-muthunilavan-d-activity-7418546470263373824-iAm1',
            ),
            _ProjectCard(
              number: '04',
              title: 'Commitment Tracker — AI Task Manager',
              category: 'Machine Learning • Web UI',
              cardWidth: cardWidth,
              description:
                  'Smart task prioritization web engine using Natural Language Processing and machine learning to evaluate task urgency and provide transparent recommendations.',
              techStack: const ['Python', 'NLP', 'Scikit-Learn', 'Web UI'],
              thumbnail: 'assets/CommitTracker.png',
              githubUrl: 'https://github.com/Kishorets05/AI-Commitment-Tracker.git',
              linkedinUrl:
                  'https://www.linkedin.com/posts/d-mn-92a1b7341_ai-machinelearning-nlp-activity-7418544623360458752-4eU7',
            ),
            _ProjectCard(
              number: '05',
              title: 'NewzSphere — Real-Time News Client',
              category: 'Flutter • REST Architecture',
              cardWidth: cardWidth,
              description:
                  'Clean news app providing live global headlines organized by categories with in-app WebView rendering for distraction-free reading.',
              techStack: const ['Flutter', 'NewsAPI', 'REST APIs', 'WebView'],
              thumbnail: 'assets/NewzSphere.png',
              githubUrl: 'https://github.com/Muthunilavan-D/NewzSphere.git',
              linkedinUrl:
                  'https://www.linkedin.com/posts/d-mn-92a1b7341_flutter-flutterweb-newsapp-activity-7338821423643209730-1tbN',
            ),
          ],
        );
      },
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final String number;
  final String title;
  final String category;
  final String description;
  final List<String> techStack;
  final String thumbnail;
  final String githubUrl;
  final String linkedinUrl;
  final double cardWidth;

  const _ProjectCard({
    required this.number,
    required this.title,
    required this.category,
    required this.description,
    required this.techStack,
    required this.thumbnail,
    required this.githubUrl,
    required this.linkedinUrl,
    required this.cardWidth,
  });

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      width: cardWidth,
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Thumbnail
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Container(
              height: 190,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: AppTheme.borderSubtle),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Image.asset(
                thumbnail,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: AppTheme.surfaceElevated,
                    child: const Center(
                      child: Icon(Icons.image, size: 40, color: AppTheme.textMuted),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Category tag with Number
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                category.toUpperCase(),
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.textSecondary,
                  letterSpacing: 0.6,
                ),
              ),
              Text(
                number,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  color: AppTheme.textMuted,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          // Title
          Text(
            title,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: AppTheme.textPrimary,
              letterSpacing: -0.2,
            ),
          ),
          const SizedBox(height: 8),
          // Description
          Text(
            description,
            style: const TextStyle(
              fontSize: 13.5,
              color: AppTheme.textMuted,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 14),
          // Tech stack tags
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: techStack.map((t) => _TechTag(label: t)).toList(),
          ),
          const SizedBox(height: 18),
          // Action Buttons
          Row(
            children: [
              Expanded(
                child: GlowButton(
                  text: 'GitHub',
                  icon: Icons.code,
                  isOutlined: true,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  onPressed: () => _launchURL(githubUrl),
                ),
              ),
              if (linkedinUrl.isNotEmpty) ...[
                const SizedBox(width: 8),
                Expanded(
                  child: GlowButton(
                    text: 'Post',
                    icon: Icons.open_in_new,
                    isOutlined: true,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    onPressed: () => _launchURL(linkedinUrl),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

class _TechTag extends StatelessWidget {
  final String label;

  const _TechTag({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppTheme.surfaceElevated,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: AppTheme.borderSubtle,
          width: 1,
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 11.5,
          fontWeight: FontWeight.w500,
          color: AppTheme.textSecondary,
        ),
      ),
    );
  }
}
