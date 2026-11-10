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
                      title: 'Mobile & Frontend',
                      icon: Icons.phone_android,
                      skills: [
                        'Flutter (Mobile & Web)',
                        'Dart',
                        'React 19 & Vite',
                        'Material 3 & Responsive UI',
                        'State Management (Provider, Riverpod)',
                        'HTML5, CSS3 & Bootstrap',
                      ],
                      width: cardWidth,
                    ),
                    _SkillCategory(
                      title: 'Backend & Databases',
                      icon: Icons.cloud,
                      skills: [
                        'Node.js & Express.js',
                        'MongoDB & Mongoose',
                        'Firebase (Auth, Firestore, Storage)',
                        'MySQL & Relational Databases',
                        'RESTful API Design & Integration',
                        'Web Scraping & Cron Jobs',
                      ],
                      width: cardWidth,
                    ),
                    _SkillCategory(
                      title: 'AI & Machine Learning',
                      icon: Icons.psychology,
                      skills: [
                        'Explainable AI (XAI / SHAP)',
                        'Groq Cloud LLM Integration',
                        'Google Gemini API',
                        'NLP & Text Classification',
                        'Predictive Risk Modeling',
                        'Rule-based & Hybrid Logic',
                      ],
                      width: cardWidth,
                    ),
                    _SkillCategory(
                      title: 'Programming Languages',
                      icon: Icons.code,
                      skills: [
                        'Java (Strong OOP Foundation)',
                        'Dart',
                        'Python',
                        'C',
                        'JavaScript',
                        'SQL',
                      ],
                      width: cardWidth,
                    ),
                    _SkillCategory(
                      title: 'Tools & Cloud Deployment',
                      icon: Icons.build,
                      skills: [
                        'Git & GitHub',
                        'VS Code & Android Studio',
                        'Postman & API Testing',
                        'Vercel & Render Deployment',
                        'Figma (UI/UX)',
                        'Notion Workflow',
                      ],
                      width: cardWidth,
                    ),
                    _SkillCategory(
                      title: 'Core CS & Concepts',
                      icon: Icons.lightbulb,
                      skills: [
                        'Object-Oriented Programming (OOP)',
                        'Clean Architecture & MVVM',
                        'Cloud Computing (NPTEL/Wipro)',
                        'Operating Systems & Networking',
                        'DevOps & SDLC Lifecycle',
                        'Offline-First Design (Hive)',
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
