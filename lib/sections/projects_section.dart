import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import '../widgets/glass_card.dart';
import '../widgets/glow_button.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  int _selectedFilterIndex = 0;

  final List<String> _filters = [
    'All Projects (5)',
    'AI & Systems (2)',
    'Flutter Mobile (3)',
    'FinTech & Web (2)',
  ];

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
      padding: EdgeInsets.only(
        top: 110,
        bottom: 80,
        left: isMobile ? 20 : 40,
        right: isMobile ? 20 : 40,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1140),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildSectionHeader(),
              const SizedBox(height: 28),
              _buildFilterTabs(),
              const SizedBox(height: 40),
              if (_selectedFilterIndex == 0 || _selectedFilterIndex == 1) ...[
                _buildFeaturedProjIntel(isMobile),
                const SizedBox(height: 36),
              ],
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
              color: AppTheme.primaryLight.withValues(alpha: 0.35),
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

  Widget _buildFilterTabs() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(_filters.length, (index) {
          final isSelected = _selectedFilterIndex == index;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: InkWell(
              onTap: () => setState(() => _selectedFilterIndex = index),
              borderRadius: BorderRadius.circular(20),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppTheme.primary.withValues(alpha: 0.22)
                      : AppTheme.surfaceDark.withValues(alpha: 0.6),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isSelected
                        ? AppTheme.primaryLight
                        : AppTheme.borderSubtle,
                    width: 1,
                  ),
                  boxShadow: [
                    if (isSelected)
                      BoxShadow(
                        color: AppTheme.primary.withValues(alpha: 0.25),
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      ),
                  ],
                ),
                child: Text(
                  _filters[index],
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                    color: isSelected
                        ? AppTheme.primaryLight
                        : AppTheme.textSecondary,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildFeaturedProjIntel(bool isMobile) {
    return GlassCard(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.all(isMobile ? 20 : 30),
      borderColor: AppTheme.primary.withValues(alpha: 0.45),
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
                    color: AppTheme.emerald.withValues(alpha: 0.35),
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
              fontSize: 25,
              fontWeight: FontWeight.w800,
              color: AppTheme.textPrimary,
              letterSpacing: -0.3,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'An Explainable AI (XAI) and LLM-assisted academic platform for students, faculty guides, and department administrators featuring early milestone delay-risk prediction and dependency-aware task prioritization.',
            style: TextStyle(
              fontSize: 15.5,
              color: AppTheme.textSecondary,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 22),
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
          const SizedBox(height: 22),
          // Key Highlights
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: AppTheme.spaceGray.withValues(alpha: 0.6),
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
          const SizedBox(width: 10),
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
    final allProjects = [
      _ProjectData(
        title: 'FitTrack — AI Fitness Tracker',
        category: 'Flutter • AI Health',
        description:
            'Intelligent mobile application with real-time workout tracking, AI-based food recognition via Gemini API, and personalized health metrics.',
        techStack: const ['Flutter', 'Firebase Auth', 'Gemini API', 'Material 3'],
        thumbnail: 'assets/FitTrack.png',
        githubUrl: 'https://github.com/Muthunilavan-D/FitTrack.git',
        linkedinUrl:
            'https://www.linkedin.com/posts/d-mn-92a1b7341_flutter-firebase-ai-activity-7304894778985361408-vMVe',
        filterCategoryIndex: 2, // Flutter Mobile
      ),
      _ProjectData(
        title: 'PricePulse — Price Tracking App',
        category: 'Mobile • FinTech & Scrapers',
        description:
            'E-commerce tracking application that monitors product price fluctuations over time and delivers alerts when items hit user-defined budget targets.',
        techStack: const ['Flutter', 'Node.js', 'Hive DB', 'Cron Alerts'],
        thumbnail: 'assets/PricePulse.png',
        githubUrl: 'https://github.com/Muthunilavan-D/Pricepulse.git',
        linkedinUrl:
            'https://www.linkedin.com/posts/d-mn-92a1b7341_release-price-pulse-v10-muthunilavan-d-activity-7418546470263373824-iAm1',
        filterCategoryIndex: 3, // FinTech & Web
      ),
      _ProjectData(
        title: 'Commitment Tracker — AI Task Manager',
        category: 'Machine Learning • Web App',
        description:
            'Smart task prioritization web engine using Natural Language Processing and machine learning to evaluate task urgency and provide transparent recommendations.',
        techStack: const ['Python', 'NLP', 'Scikit-Learn', 'Web UI'],
        thumbnail: 'assets/CommitTracker.png',
        githubUrl: 'https://github.com/Kishorets05/AI-Commitment-Tracker.git',
        linkedinUrl:
            'https://www.linkedin.com/posts/d-mn-92a1b7341_ai-machinelearning-nlp-activity-7418544623360458752-4eU7',
        filterCategoryIndex: 1, // AI & Systems
      ),
      _ProjectData(
        title: 'NewzSphere — Real-Time News App',
        category: 'Flutter • REST API',
        description:
            'Clean news app providing live global headlines organized by categories with in-app WebView rendering for distraction-free reading.',
        techStack: const ['Flutter', 'NewsAPI', 'REST APIs', 'WebView'],
        thumbnail: 'assets/NewzSphere.png',
        githubUrl: 'https://github.com/Muthunilavan-D/NewzSphere.git',
        linkedinUrl:
            'https://www.linkedin.com/posts/d-mn-92a1b7341_flutter-flutterweb-newsapp-activity-7338821423643209730-1tbN',
        filterCategoryIndex: 2, // Flutter Mobile
      ),
    ];

    final filtered = _selectedFilterIndex == 0
        ? allProjects
        : allProjects
            .where((p) =>
                p.filterCategoryIndex == _selectedFilterIndex ||
                (_selectedFilterIndex == 1 && p.title.contains('Commitment')) ||
                (_selectedFilterIndex == 2 && p.category.contains('Flutter')) ||
                (_selectedFilterIndex == 3 &&
                    (p.category.contains('FinTech') || p.category.contains('Web'))))
            .toList();

    return LayoutBuilder(
      builder: (context, constraints) {
        final cardWidth = constraints.maxWidth > 900
            ? (constraints.maxWidth - 20) / 2
            : constraints.maxWidth;

        return Wrap(
          spacing: 20,
          runSpacing: 20,
          alignment: WrapAlignment.center,
          children: filtered.map((project) {
            return _ProjectCard(
              title: project.title,
              category: project.category,
              cardWidth: cardWidth,
              description: project.description,
              techStack: project.techStack,
              thumbnail: project.thumbnail,
              githubUrl: project.githubUrl,
              linkedinUrl: project.linkedinUrl,
            );
          }).toList(),
        );
      },
    );
  }
}

class _ProjectData {
  final String title;
  final String category;
  final String description;
  final List<String> techStack;
  final String thumbnail;
  final String githubUrl;
  final String linkedinUrl;
  final int filterCategoryIndex;

  _ProjectData({
    required this.title,
    required this.category,
    required this.description,
    required this.techStack,
    required this.thumbnail,
    required this.githubUrl,
    required this.linkedinUrl,
    required this.filterCategoryIndex,
  });
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
          // Thumbnail with aspect ratio
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
          // Action Buttons - perfectly aligned
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
        color: AppTheme.spaceGray.withValues(alpha: 0.85),
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
