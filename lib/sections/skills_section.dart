import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/glass_card.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

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
              'SKILLS',
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width > 768 ? 36 : 28,
                fontWeight: FontWeight.bold,
                color: AppTheme.neonBlue,
                letterSpacing: 2,
              ),
            ),
          ),
          const SizedBox(height: 40),
          Center(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final cardWidth = constraints.maxWidth > 1200
                    ? (constraints.maxWidth - 100) / 3
                    : constraints.maxWidth > 768
                    ? (constraints.maxWidth - 60) / 2
                    : constraints.maxWidth - 40;

                return Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  alignment: WrapAlignment.center,
                  children: [
                    _SkillCategory(
                      title: 'Mobile App Development',
                      icon: Icons.phone_android,
                      skills: [
                        'Flutter (Mobile & Web)',
                        'Dart',
                        'Material 3',
                        'Responsive UI Design',
                        'State Management (Provider, Riverpod)',
                      ],
                      width: cardWidth,
                    ),
                    _SkillCategory(
                      title: 'Backend & Services',
                      icon: Icons.cloud,
                      skills: [
                        'Node.js ',
                        'SQL',
                        'Firebase Authentication',
                        'Cloud Firestore & Storage',
                        'REST API Integration',
                        'Web Scraping / Cron Jobs',
                      ],
                      width: cardWidth,
                    ),
                    _SkillCategory(
                      title: 'Programming Languages',
                      icon: Icons.code,
                      skills: [
                        'Dart',
                        'Java',
                        'HTML',
                        'CSS',
                        'JavaScript',
                        'SQL',
                      ],
                      width: cardWidth,
                    ),
                    _SkillCategory(
                      title: 'Tools & Workflow',
                      icon: Icons.build,
                      skills: [
                        'Git & GitHub',
                        'Android Studio',
                        'VS Code',
                        'Notion',
                        'Photoshop',
                        'Figma (UI/UX)',
                      ],
                      width: cardWidth,
                    ),
                    _SkillCategory(
                      title: 'Concepts',
                      icon: Icons.lightbulb,
                      skills: [
                        'Clean Architecture',
                        'State Management',
                        'API Integration',
                        'Authentication & Authorization',
                        'Offline-first Design',
                        'Real-time Data Handling',
                        'AI Integration',
                        'UI/UX Thinking',
                      ],
                      width: cardWidth,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _SkillCategory extends StatelessWidget {
  final String title;
  final List<String> skills;
  final double width;
  final IconData icon;

  const _SkillCategory({
    required this.title,
    required this.skills,
    required this.width,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      width: width,
      height: 280, // Fixed height for uniform cards
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    gradient: AppTheme.neonGradient,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(icon, color: Colors.white, size: 22),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.neonPurple,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Divider(color: AppTheme.spaceGray, thickness: 1),
            const SizedBox(height: 16),
            ...skills.map(
              (skill) => Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 6),
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        gradient: AppTheme.neonGradient,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Text(
                        skill,
                        style: const TextStyle(
                          fontSize: 15,
                          color: AppTheme.textSecondary,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
