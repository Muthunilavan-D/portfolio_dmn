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
        vertical: 80,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1140),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildSectionHeader(),
              const SizedBox(height: 48),
              _buildFeaturedProjIntel(isMobile),
              const SizedBox(height: 36),
              _buildProjectsGrid(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: AppTheme.primary.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppTheme.primaryLight.withValues(alpha: 0.3),
              width: 1,
            ),
          ),
          child: const Text(
            'FEATURED PORTFOLIO',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: AppTheme.primaryLight,
              letterSpacing: 1.5,
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Crafted With Code, Data & Purpose',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w800,
            color: AppTheme.textPrimary,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Real-world applications spanning AI-driven decision systems, mobile utilities, and full-stack platforms.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            color: AppTheme.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildFeaturedProjIntel(bool isMobile) {
    return GlassCard(
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.all(28),
      borderColor: AppTheme.primary.withValues(alpha: 0.4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Spotlight Header Badges
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppTheme.emerald.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: AppTheme.emerald.withValues(alpha: 0.3),
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
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
                      'LATEST CAPSTONE • OCTOBER 2026',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.emerald,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
              if (!isMobile)
                const Text(
                  'Featured Project',
                  style: TextStyle(
                    fontSize: 13,
                    color: AppTheme.textMuted,
                    fontWeight: FontWeight.w500,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 20),
          // Project Title & Subtitle
          const Text(
            'ProjIntel — AI-Assisted Academic Project Management System',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w800,
              color: AppTheme.textPrimary,
              letterSpacing: -0.3,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'An Explainable AI (XAI) and LLM-assisted academic platform for students, faculty guides, and department administrators featuring early milestone delay-risk prediction and dependency-aware task prioritization.',
            style: TextStyle(
              fontSize: 15.5,
              color: AppTheme.textSecondary,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 24),
          // Banner Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppTheme.borderSubtle),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.asset(
                'assets/ProjIntel.png',
                width: double.infinity,
                height: isMobile ? 220 : 360,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 220,
                    color: AppTheme.surfaceElevated,
                    child: const Center(
                      child: Icon(Icons.image, size: 48, color: AppTheme.textMuted),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 24),
          // Key Highlights
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: AppTheme.spaceGray.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppTheme.borderSubtle),
            ),
            child: Wrap(
              spacing: 24,
              runSpacing: 14,
              children: [
                _buildHighlightItem(
                  icon: Icons.analytics_outlined,
                  title: 'Early Delay Prediction',
                  desc: 'Deterministic risk formula + SHAP feature importance',
                ),
                _buildHighlightItem(
                  icon: Icons.account_tree_outlined,
                  title: 'Dependency Prioritization',
                  desc: 'Directs teams to complete blocking prerequisite tasks',
                ),
                _buildHighlightItem(
                  icon: Icons.groups_outlined,
                  title: 'Multi-Role Workspaces',
                  desc: 'Tailored dashboards for Students, Guides, and HODs',
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Tech Stack Badges
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: const [
              'React 19',
              'Node.js & Express',
              'MongoDB',
              'Groq Cloud (Llama 3.3)',
              'Python (SHAP)',
              'Vite',
            ].map((t) => _TechTag(label: t)).toList(),
          ),
          const SizedBox(height: 24),
          // Action Buttons
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              GlowButton(
                text: 'Live Demo',
                icon: Icons.rocket_launch,
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
    required IconData icon,
    required String title,
    required String desc,
  }) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 300),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18, color: AppTheme.primaryLight),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 13.5,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.textPrimary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  desc,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppTheme.textSecondary,
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
            ? (constraints.maxWidth - 20) / 2
            : constraints.maxWidth;

        return Wrap(
          spacing: 20,
          runSpacing: 20,
          alignment: WrapAlignment.center,
          children: [
            _ProjectCard(
              title: 'FitTrack — AI Fitness Tracker',
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
              title: 'PricePulse — Price Tracking App',
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
              title: 'Commitment Tracker — AI Task Manager',
              category: 'Machine Learning • Web App',
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
              title: 'NewzSphere — Real-Time News App',
              category: 'Flutter • REST API',
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
  final String title;
  final String category;
  final String description;
  final List<String> techStack;
  final String thumbnail;
  final String githubUrl;
  final String linkedinUrl;
  final double cardWidth;

  const _ProjectCard({
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
      padding: const EdgeInsets.all(22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Thumbnail
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: AppTheme.borderSubtle),
                borderRadius: BorderRadius.circular(10),
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
          const SizedBox(height: 18),
          // Category tag
          Text(
            category.toUpperCase(),
            style: const TextStyle(
              fontSize: 11.5,
              fontWeight: FontWeight.w700,
              color: AppTheme.primaryLight,
              letterSpacing: 0.8,
            ),
          ),
          const SizedBox(height: 6),
          // Title
          Text(
            title,
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w700,
              color: AppTheme.textPrimary,
              letterSpacing: -0.2,
            ),
          ),
          const SizedBox(height: 10),
          // Description
          Text(
            description,
            style: const TextStyle(
              fontSize: 14,
              color: AppTheme.textSecondary,
              height: 1.55,
            ),
          ),
          const SizedBox(height: 16),
          // Tech stack tags
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: techStack.map((t) => _TechTag(label: t)).toList(),
          ),
          const SizedBox(height: 20),
          // Action Buttons
          Row(
            children: [
              Expanded(
                child: GlowButton(
                  text: 'GitHub',
                  icon: Icons.code,
                  isOutlined: true,
                  padding: const EdgeInsets.symmetric(vertical: 11),
                  onPressed: () => _launchURL(githubUrl),
                ),
              ),
              if (linkedinUrl.isNotEmpty) ...[
                const SizedBox(width: 10),
                Expanded(
                  child: GlowButton(
                    text: 'LinkedIn',
                    icon: Icons.work_outline,
                    isOutlined: true,
                    customColor: AppTheme.secondary,
                    padding: const EdgeInsets.symmetric(vertical: 11),
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
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: AppTheme.spaceGray.withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: AppTheme.borderSubtle,
          width: 1,
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: AppTheme.textSecondary,
        ),
      ),
    );
  }
}
