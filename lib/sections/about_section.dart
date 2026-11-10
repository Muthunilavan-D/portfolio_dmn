import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/glass_card.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

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
              const SizedBox(height: 48),
              if (isMobile)
                _buildMobileCards()
              else
                _buildDesktopCards(),
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
            gradient: LinearGradient(
              colors: [
                AppTheme.primary.withValues(alpha: 0.18),
                AppTheme.secondary.withValues(alpha: 0.12),
              ],
            ),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppTheme.primaryLight.withValues(alpha: 0.45),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: AppTheme.primary.withValues(alpha: 0.2),
                blurRadius: 10,
              ),
            ],
          ),
          child: const Text(
            'ABOUT ME',
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
          'Driven by Curiosity, Built for Impact',
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
          'How I approach problem solving, architecture, and shipping scalable software.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            color: AppTheme.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopCards() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Expanded(
          child: _AboutCard(
            icon: Icons.lightbulb_outline,
            title: 'Engineering Philosophy',
            subtitle: 'Consistency over shortcuts',
            description:
                'I learn best by building real products end-to-end. I prioritize clean code architecture, intuitive user flows, and measurable reliability. I care deeply about getting better every single day.',
            tags: ['Clean Architecture', 'Predictable State', 'High Reliability'],
            accentColor: Color(0xFF818CF8), // Indigo
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          child: _AboutCard(
            icon: Icons.hub_outlined,
            title: 'Full-Stack & AI Focus',
            subtitle: 'End-to-end system design',
            description:
                'Bridging performant cross-platform Flutter applications with scalable Node.js/Express and MongoDB backends. Experienced with Explainable AI (SHAP) and LLM-assisted decision workflows.',
            tags: ['Flutter Web/Mobile', 'Node.js & MongoDB', 'Explainable AI'],
            accentColor: Color(0xFF06B6D4), // Cyan
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          child: _AboutCard(
            icon: Icons.school_outlined,
            title: 'Education & Growth',
            subtitle: 'Velammal College of Engineering',
            description:
                'Pursuing B.E. in Computer Science (2023–2027) with an 8.65 CGPA and 9.18 in 3rd semester. Passionate about collaborative development, hackathons, and high-impact systems.',
            tags: ['8.65 CGPA', 'Sem 3 GPA 9.18', 'Hackathon Winner'],
            accentColor: Color(0xFF10B981), // Emerald
          ),
        ),
      ],
    );
  }

  Widget _buildMobileCards() {
    return Column(
      children: const [
        _AboutCard(
          icon: Icons.lightbulb_outline,
          title: 'Engineering Philosophy',
          subtitle: 'Consistency over shortcuts',
          description:
              'I learn best by building real products end-to-end. I prioritize clean code architecture, intuitive user flows, and measurable reliability. I care deeply about getting better every single day.',
          tags: ['Clean Architecture', 'Predictable State', 'High Reliability'],
          accentColor: Color(0xFF818CF8),
        ),
        SizedBox(height: 16),
        _AboutCard(
          icon: Icons.hub_outlined,
          title: 'Full-Stack & AI Focus',
          subtitle: 'End-to-end system design',
          description:
              'Bridging performant cross-platform Flutter applications with scalable Node.js/Express and MongoDB backends. Experienced with Explainable AI (SHAP) and LLM-assisted decision workflows.',
          tags: ['Flutter Web/Mobile', 'Node.js & MongoDB', 'Explainable AI'],
          accentColor: Color(0xFF06B6D4),
        ),
        SizedBox(height: 16),
        _AboutCard(
          icon: Icons.school_outlined,
          title: 'Education & Growth',
          subtitle: 'Velammal College of Engineering',
          description:
              'Pursuing B.E. in Computer Science (2023–2027) with an 8.65 CGPA and 9.18 in 3rd semester. Passionate about collaborative development, hackathons, and high-impact systems.',
          tags: ['8.65 CGPA', 'Sem 3 GPA 9.18', 'Hackathon Winner'],
          accentColor: Color(0xFF10B981),
        ),
      ],
    );
  }
}

class _AboutCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String description;
  final List<String> tags;
  final Color accentColor;

  const _AboutCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.tags,
    required this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.all(26),
      glowColor: accentColor,
      borderColor: accentColor.withValues(alpha: 0.35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  accentColor.withValues(alpha: 0.22),
                  accentColor.withValues(alpha: 0.08),
                ],
              ),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: accentColor.withValues(alpha: 0.5),
                width: 1.2,
              ),
              boxShadow: [
                BoxShadow(
                  color: accentColor.withValues(alpha: 0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Icon(icon, color: accentColor, size: 24),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w700,
              color: AppTheme.textPrimary,
              letterSpacing: -0.2,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: accentColor,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            description,
            style: const TextStyle(
              fontSize: 14,
              color: AppTheme.textSecondary,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 18),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: tags.map((t) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: AppTheme.spaceGray,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: accentColor.withValues(alpha: 0.35),
                    width: 1,
                  ),
                ),
                child: Text(
                  t,
                  style: TextStyle(
                    fontSize: 11.5,
                    fontWeight: FontWeight.w600,
                    color: accentColor,
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
