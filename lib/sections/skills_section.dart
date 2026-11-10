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
              _buildSkillsGrid(context),
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
            'TECHNICAL MATRIX',
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
          'Languages, Frameworks & Infrastructure',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w800,
            color: AppTheme.textPrimary,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'A modern stack focused on mobile fluency, scalable web services, and machine intelligence.',
          style: TextStyle(
            fontSize: 15,
            color: AppTheme.textMuted,
          ),
        ),
      ],
    );
  }

  Widget _buildSkillsGrid(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final cardWidth = constraints.maxWidth > 1024
            ? (constraints.maxWidth - 32) / 3
            : constraints.maxWidth > 680
                ? (constraints.maxWidth - 16) / 2
                : constraints.maxWidth;

        return Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            _SkillCard(
              category: '01 / MOBILE & WEB',
              title: 'Client Architecture',
              skills: const [
                'Flutter (Mobile & Web)',
                'Dart',
                'React 19 & Vite',
                'Material 3 & Responsive Design',
                'Provider & Riverpod',
                'Clean Architecture & MVVM',
              ],
              width: cardWidth,
            ),
            _SkillCard(
              category: '02 / BACKEND & DATA',
              title: 'Server & Databases',
              skills: const [
                'Node.js & Express.js',
                'MongoDB & Mongoose',
                'Firebase Auth & Firestore',
                'MySQL & Relational DBs',
                'RESTful API Engineering',
                'Cron Automation & Scraping',
              ],
              width: cardWidth,
            ),
            _SkillCard(
              category: '03 / AI & SYSTEMS',
              title: 'Applied Intelligence',
              skills: const [
                'Explainable AI (SHAP)',
                'Groq Cloud (LLaMA 3.3)',
                'Google Gemini API',
                'Predictive Risk Modeling',
                'NLP & Text Classification',
                'Hybrid Decision Rules',
              ],
              width: cardWidth,
            ),
            _SkillCard(
              category: '04 / LANGUAGES',
              title: 'Core Programming',
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
              category: '05 / DEVOPS & TOOLS',
              title: 'Engineering Toolkit',
              skills: const [
                'Git & GitHub Workflows',
                'Postman API Testing',
                'Vercel & Render Deployment',
                'Android Studio & VS Code',
                'Figma UI/UX Specifications',
                'Notion Project Workspaces',
              ],
              width: cardWidth,
            ),
            _SkillCard(
              category: '06 / FOUNDATIONS',
              title: 'Computer Science Core',
              skills: const [
                'Object-Oriented Design',
                'Data Structures & Algorithms',
                'Cloud Computing (NPTEL/Wipro)',
                'Database Management Systems',
                'Operating Systems & Networks',
                'Agile Sprint Lifecycles',
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
  final String category;
  final String title;
  final List<String> skills;
  final double width;

  const _SkillCard({
    required this.category,
    required this.title,
    required this.skills,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      width: width,
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.all(22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            category,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: AppTheme.textSecondary,
              letterSpacing: 0.8,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            title,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: AppTheme.textPrimary,
              letterSpacing: -0.2,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: skills.map((skill) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: AppTheme.surfaceElevated,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: AppTheme.borderSubtle,
                    width: 1,
                  ),
                ),
                child: Text(
                  skill,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppTheme.textPrimary,
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
