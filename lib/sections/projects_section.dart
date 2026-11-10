import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import '../widgets/glass_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width > 768 ? 40 : 20,
        vertical: 60,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'PROJECTS',
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width > 768 ? 36 : 28,
                fontWeight: FontWeight.bold,
                color: AppTheme.neonBlue,
                letterSpacing: 2,
              ),
            ),
          ),
          const SizedBox(height: 40),
          LayoutBuilder(
            builder: (context, constraints) {
              final cardWidth = constraints.maxWidth > 1200
                  ? (constraints.maxWidth - 90) / 2
                  : constraints.maxWidth - 40;

              return Wrap(
                spacing: 20,
                runSpacing: 20,
                alignment: WrapAlignment.center,
                children: [
                  _ProjectCard(
                    title: 'ProjIntel — AI Academic Project Management',
                    cardWidth: cardWidth,
                    description:
                        'An Explainable AI (XAI) and LLM-assisted academic project platform for students, faculty guides, and department admins with early delay prediction.',
                    problem:
                        'Institutions struggle with tracking capstone delays, lack of early risk visibility, opaque evaluations, and unguided prioritization.',
                    solution:
                        'End-to-end intelligent platform with milestone tracking, SHAP-based delay risk explanations, task prioritization, and Groq LLM assistance.',
                    techStack:
                        'React 19, Node.js, Express, MongoDB, Groq Cloud, Python, SHAP',
                    thumbnail: 'assets/ProjIntel.png',
                    learned:
                        'Explainable AI (SHAP), LLM integration with Groq, full-stack MERN architecture, dependency graph modeling, predictive risk analytics',
                    githubUrl: 'https://github.com/Muthunilavan-D/ProjIntel',
                    liveUrl: 'https://proj-intel.vercel.app',
                    linkedinUrl:
                        'https://www.linkedin.com/in/d-mn-92a1b7341',
                  ),
                  _ProjectCard(
                    title: 'FitTrack — AI Fitness Tracker',
                    cardWidth: cardWidth,
                    description:
                        'AI-powered fitness app with real-time activity tracking, food recognition, and personalized dashboards.',
                    problem:
                        'People struggle to track fitness and nutrition consistently.',
                    solution:
                        'An intelligent app that automates tracking and delivers personalized insights.',
                    techStack: 'Flutter, Firebase, Gemini API',
                    thumbnail: 'assets/FitTrack.png',
                    learned:
                        'AI integration, secure authentication, clean UI design, scalable architecture',
                    githubUrl: 'https://github.com/Muthunilavan-D/FitTrack.git',
                    linkedinUrl:
                        'https://www.linkedin.com/posts/d-mn-92a1b7341_flutter-firebase-ai-activity-7304894778985361408-vMVe',
                  ),
                  _ProjectCard(
                    title: 'PricePulse — Price Tracking App',
                    cardWidth: cardWidth,
                    description:
                        'Track online product prices and get notified when prices drop.',
                    problem: 'Users miss deals due to fluctuating prices.',
                    solution:
                        'Offline-first app with alerts, history, and notifications.',
                    techStack: 'Flutter, Node.js, Hive, Notifications',
                    thumbnail: 'assets/PricePulse.png',
                    learned:
                        'Local storage, alert systems, automated web scraping, offline-first design',
                    githubUrl:
                        'https://github.com/Muthunilavan-D/Pricepulse.git',
                    linkedinUrl:
                        'https://www.linkedin.com/posts/d-mn-92a1b7341_release-price-pulse-v10-muthunilavan-d-activity-7418546470263373824-iAm1',
                  ),
                  _ProjectCard(
                    title: 'Commitment Tracker — AI Task Manager',
                    cardWidth: cardWidth,
                    description:
                        'AI-powered web app that predicts task priority and urgency using NLP and ML.',
                    problem: 'People struggle to prioritize tasks effectively.',
                    solution:
                        'Smart task manager with explainable AI recommendations.',
                    techStack:
                        'Python, Machine Learning, NLP, Rule-based Logic, Web UI',
                    thumbnail: 'assets/CommitTracker.png',
                    learned:
                        'NLP processing, ML integration, explainable AI, hybrid systems',
                    githubUrl:
                        'https://github.com/Kishorets05/AI-Commitment-Tracker.git',
                    linkedinUrl:
                        'https://www.linkedin.com/posts/d-mn-92a1b7341_ai-machinelearning-nlp-activity-7418544623360458752-4eU7',
                  ),
                  _ProjectCard(
                    title: 'NewzSphere — Real-Time News App',
                    cardWidth: cardWidth,
                    description:
                        'Sleek Flutter app delivering real-time news with category browsing and in-app reading.',
                    problem:
                        'Users need a fast, distraction-free news experience.',
                    solution:
                        'Clean UI with category filters and integrated WebView for full reading.',
                    techStack: 'Flutter, NewsAPI, REST APIs',
                    thumbnail: 'assets/NewzSphere.png',
                    learned:
                        'API integration, pagination, performance tuning, WebView handling',
                    githubUrl:
                        'https://github.com/Muthunilavan-D/NewzSphere.git',
                    linkedinUrl:
                        'https://www.linkedin.com/posts/d-mn-92a1b7341_flutter-flutterweb-newsapp-activity-7338821423643209730-1tbN',
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final String problem;
  final String solution;
  final String techStack;
  final String thumbnail;
  final String learned;
  final String githubUrl;
  final String linkedinUrl;
  final String? liveUrl;
  final double cardWidth;

  const _ProjectCard({
    required this.title,
    required this.description,
    required this.problem,
    required this.solution,
    required this.techStack,
    required this.thumbnail,
    required this.learned,
    required this.githubUrl,
    required this.linkedinUrl,
    this.liveUrl,
    required this.cardWidth,
  });

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 18),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.spaceGray,
        foregroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: color.withOpacity(0.3), width: 1),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      width: cardWidth,
      height: 720, // Uniform project card height
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Thumbnail with overlay
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    thumbnail,
                    width: double.infinity,
                    height: 220,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 220,
                        color: AppTheme.spaceGray,
                        child: const Icon(
                          Icons.image,
                          size: 50,
                          color: Colors.white38,
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  height: 220,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        AppTheme.darkSpace.withOpacity(0.8),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Title
            Text(
              title,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppTheme.neonBlue,
                height: 1.3,
              ),
            ),
            const SizedBox(height: 16),
            // Description
            Text(
              description,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.white,
                height: 1.6,
              ),
            ),
            const SizedBox(height: 20),
            // Info sections with better styling
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppTheme.spaceGray.withOpacity(0.3),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppTheme.neonBlue.withOpacity(0.2),
                  width: 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _InfoRow(label: 'Problem', value: problem),
                  const SizedBox(height: 14),
                  _InfoRow(label: 'Solution', value: solution),
                  const SizedBox(height: 14),
                  _InfoRow(label: 'Tech Stack', value: techStack),
                  const SizedBox(height: 14),
                  _InfoRow(label: 'Key Learnings', value: learned),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Action buttons
            Wrap(
              spacing: 12,
              runSpacing: 10,
              children: [
                _buildActionButton(
                  icon: Icons.code,
                  label: 'GitHub',
                  color: AppTheme.neonBlue,
                  onPressed: () => _launchURL(githubUrl),
                ),
                if (liveUrl != null && liveUrl!.isNotEmpty)
                  _buildActionButton(
                    icon: Icons.rocket_launch,
                    label: 'Live Demo',
                    color: AppTheme.neonBlue,
                    onPressed: () => _launchURL(liveUrl!),
                  ),
                if (linkedinUrl.isNotEmpty)
                  _buildActionButton(
                    icon: Icons.work,
                    label: 'LinkedIn',
                    color: AppTheme.neonPurple,
                    onPressed: () => _launchURL(linkedinUrl),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 4,
              height: 4,
              decoration: BoxDecoration(
                color: AppTheme.neonBlue,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: AppTheme.neonBlue,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              color: AppTheme.textSecondary,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}
