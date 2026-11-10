import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/glass_card.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

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
              _buildSkillsGrid(context),
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
            color: AppTheme.secondary.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppTheme.secondary.withValues(alpha: 0.3),
              width: 1,
            ),
          ),
          child: const Text(
            'SKILLS & TOOLKIT',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: AppTheme.secondary,
              letterSpacing: 1.5,
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Technologies & Architectural Capabilities',
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
          'A modern stack focused on mobile fluency, scalable web services, and AI decision systems.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            color: AppTheme.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildSkillsGrid(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final cardWidth = constraints.maxWidth > 1024
            ? (constraints.maxWidth - 40) / 3
            : constraints.maxWidth > 680
                ? (constraints.maxWidth - 20) / 2
                : constraints.maxWidth;

        return Wrap(
          spacing: 20,
          runSpacing: 20,
          alignment: WrapAlignment.center,
          children: [
            _SkillCard(
              title: 'Mobile & Web Platforms',
              icon: Icons.phone_android_outlined,
              accentColor: AppTheme.primary,
              skills: const [
                'Flutter (Mobile & Web)',
                'Dart',
                'React 19 & Vite',
                'Material 3 & Responsive UI',
                'Provider & Riverpod',
                'HTML5 & Modern CSS',
              ],
              width: cardWidth,
            ),
            _SkillCard(
              title: 'Backend & Databases',
              icon: Icons.storage_outlined,
              accentColor: AppTheme.secondary,
              skills: const [
                'Node.js & Express.js',
                'MongoDB & Mongoose',
                'Firebase Auth & Firestore',
                'MySQL & Relational DBs',
                'RESTful API Architecture',
                'Web Scraping & Automation',
              ],
              width: cardWidth,
            ),
            _SkillCard(
              title: 'AI & Data Intelligence',
              icon: Icons.psychology_outlined,
              accentColor: AppTheme.emerald,
              skills: const [
                'Explainable AI (SHAP)',
                'Groq Cloud LLM Integration',
                'Google Gemini API',
                'NLP & Text Classification',
                'Predictive Risk Modeling',
                'Rule-based Hybrid Logic',
              ],
              width: cardWidth,
            ),
            _SkillCard(
              title: 'Programming Languages',
              icon: Icons.code_outlined,
              accentColor: AppTheme.primaryLight,
              skills: const [
                'Java (OOP & System Design)',
                'Dart',
                'Python',
                'C Language',
                'JavaScript (ES6+)',
                'SQL',
              ],
              width: cardWidth,
            ),
            _SkillCard(
              title: 'Tools & Cloud Deployment',
              icon: Icons.cloud_done_outlined,
              accentColor: AppTheme.amber,
              skills: const [
                'Git & GitHub Workflows',
                'Postman API Testing',
                'Vercel & Render Deployment',
                'VS Code & Android Studio',
                'Figma UI/UX Prototyping',
                'Notion Project Mgmt',
              ],
              width: cardWidth,
            ),
            _SkillCard(
              title: 'Core CS Foundations',
              icon: Icons.developer_board_outlined,
              accentColor: AppTheme.secondary,
              skills: const [
                'Object-Oriented Design (OOP)',
                'Clean Architecture & MVVM',
                'Cloud Computing (NPTEL/Wipro)',
                'Operating Systems & Networks',
                'Offline-First Design (Hive)',
                'SDLC & Agile Development',
              ],
              width: cardWidth,
            ),
          ],
        );
      },
    );
  }
}

class _SkillCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color accentColor;
  final List<String> skills;
  final double width;

  const _SkillCard({
    required this.title,
    required this.icon,
    required this.accentColor,
    required this.skills,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      width: width,
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: accentColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: accentColor.withValues(alpha: 0.3),
                    width: 1,
                  ),
                ),
                child: Icon(icon, color: accentColor, size: 20),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.textPrimary,
                    letterSpacing: -0.2,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: skills.map((skill) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 6),
                decoration: BoxDecoration(
                  color: AppTheme.spaceGray.withValues(alpha: 0.8),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: AppTheme.borderSubtle,
                    width: 1,
                  ),
                ),
                child: Text(
                  skill,
                  style: const TextStyle(
                    fontSize: 12.5,
                    color: AppTheme.textSecondary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
